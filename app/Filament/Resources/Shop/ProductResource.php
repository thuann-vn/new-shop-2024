<?php

namespace App\Filament\Resources\Shop;

use AmidEsfahani\FilamentTinyEditor\TinyEditor;
use App\Filament\Resources\Shop\BrandResource\RelationManagers\ProductsRelationManager;
use App\Filament\Resources\Shop\ProductResource\Pages;
use App\Filament\Resources\Shop\ProductResource\RelationManagers\CommentsRelationManager;
use App\Filament\Resources\Shop\ProductResource\Widgets\ProductStats;
use App\Models\Shop\Attribute;
use App\Models\Shop\Brand;
use App\Models\Shop\Product;
use CodeWithDennis\FilamentSelectTree\SelectTree;
use Filament\Forms;
use Filament\Forms\Components\SpatieMediaLibraryFileUpload;
use Filament\Forms\Components\Tabs;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Resources\RelationManagers\RelationGroup;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Filters\QueryBuilder;
use Filament\Tables\Filters\QueryBuilder\Constraints\BooleanConstraint;
use Filament\Tables\Filters\QueryBuilder\Constraints\DateConstraint;
use Filament\Tables\Filters\QueryBuilder\Constraints\NumberConstraint;
use Filament\Tables\Filters\QueryBuilder\Constraints\TextConstraint;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class ProductResource extends Resource
{
    protected static ?string $model = Product::class;

    protected static ?string $slug = 'shop/products';

    protected static ?string $recordTitleAttribute = 'name';

    protected static ?string $navigationGroup = 'Shop';

    protected static ?string $navigationIcon = 'heroicon-o-bolt';


    protected static ?int $navigationSort = 0;

    protected static ?string $navigationLabel = 'Product';

    public static function getNavigationLabel(): string
    {
        return __(self::$navigationLabel);
    }

    public static function getPluralLabel(): ?string
    {
        return __(self::$navigationLabel);
    }

    public static function getLabel(): ?string
    {
        return __(self::$navigationLabel);
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Group::make()
                    ->schema([
                        Tabs::make('Tabs')
                            ->tabs([
                                Tabs\Tab::make(__('General Info'))
                                    ->icon('heroicon-o-information-circle')
                                    ->schema([
                                        Forms\Components\TextInput::make('name')
                                            ->label(__('Name'))
                                            ->required()
                                            ->maxLength(255)
                                            ->live(onBlur: true)
                                            ->afterStateUpdated(function (string $operation, $state, Forms\Set $set, Forms\Get $get) {
                                                $slug = $get('slug');
                                                if ($operation !== 'create' && ! empty($slug)) {
                                                    return;
                                                }

                                                $set('slug', Str::slug($state));
                                            }),

                                        Forms\Components\TextInput::make('slug')
                                            ->label(__('Slug'))
                                            ->dehydrated()
                                            ->required()
                                            ->maxLength(255)
                                            ->unique(Product::class, 'slug', ignoreRecord: true),

                                        Forms\Components\Textarea::make('description')
                                            ->label(__('Description'))
                                            ->rows(3)
                                            ->columnSpan('full'),

                                        TinyEditor::make('content')
                                            ->label(__('Content'))
                                            ->columnSpan('full'),
                                        Forms\Components\Repeater::make('specifications')
                                            ->label('Specifications')
                                            ->schema([
                                                Forms\Components\TextInput::make('name')
                                                    ->required(),
                                                Forms\Components\TextInput::make('value')
                                                    ->required(),
                                            ])
                                            ->defaultItems(0)
                                            ->reorderable()
                                            ->columns(2)
                                            ->columnSpan('full'),
                                    ])->columns(),
                                Tabs\Tab::make(__('Price & Stock'))
                                    ->icon('heroicon-o-banknotes')
                                    ->schema([
                                        Forms\Components\TextInput::make('price')
                                            ->label(__('Price'))
                                            ->currencyMask(thousandSeparator: ',', decimalSeparator: '.', precision: 2)
                                            ->rules(['regex:/^\d{1,6}(\.\d{0,2})?$/'])
                                            ->required(),

                                        Forms\Components\TextInput::make('old_price')
                                            ->label(__('Compare at price'))
                                            ->currencyMask(thousandSeparator: ',', decimalSeparator: '.', precision: 2)
                                            ->rules(['regex:/^\d{1,6}(\.\d{0,2})?$/'])
                                            ->required(),

                                        Forms\Components\TextInput::make('cost')
                                            ->label(__('Cost per item'))
                                            ->helperText(__('Customers won\'t see this price.'))
                                            ->currencyMask(thousandSeparator: ',', decimalSeparator: '.', precision: 2)
                                            ->rules(['regex:/^\d{1,6}(\.\d{0,2})?$/'])
                                            ->required(),
                                        Forms\Components\TextInput::make('sku')
                                            ->label(__('SKU (Stock Keeping Unit)'))
                                            ->unique(Product::class, 'sku', ignoreRecord: true)
                                            ->maxLength(255),

                                        Forms\Components\TextInput::make('barcode')
                                            ->label(__('Barcode (ISBN, UPC, GTIN, etc.)'))
                                            ->unique(Product::class, 'barcode', ignoreRecord: true)
                                            ->maxLength(255),

                                        Forms\Components\TextInput::make('qty')
                                            ->label(__('Quantity'))
                                            ->numeric()
                                            ->rules(['integer', 'min:0'])
                                            ->required(),

                                        Forms\Components\TextInput::make('security_stock')
                                            ->label(__('Safety stock'))
                                            ->helperText(__('The safety stock is the limit stock for your products which alerts you if the product stock will soon be out of stock.'))
                                            ->numeric()
                                            ->rules(['integer', 'min:0'])
                                            ->default(0)
                                            ->required(),
                                    ]),
                                Tabs\Tab::make(__('Images'))
                                    ->icon('heroicon-o-photo')
                                    ->schema([
                                        SpatieMediaLibraryFileUpload::make('media')
                                            ->image()
                                            ->collection('product-images')
                                            ->multiple()
                                            ->maxFiles(5)
                                            ->reorderable()
                                            ->hiddenLabel(),
                                    ]),
                                Tabs\Tab::make(__('Variants'))
                                    ->icon('heroicon-o-swatch')
                                    ->schema([
                                        Forms\Components\Repeater::make('productAttributes')
                                            ->relationship('productAttributes')
                                            ->hiddenLabel()
                                            ->defaultItems(0)
                                            ->label(__('Select attributes to create variants:'))
                                            ->schema([
                                                Forms\Components\Select::make('shop_attribute_id')
                                                    ->label(__('Attribute'))
                                                    ->options(Attribute::all()->pluck('name', 'id'))
                                                    ->disableOptionsWhenSelectedInSiblingRepeaterItems()
                                                    ->required()
                                                    ->createOptionForm([
                                                        Forms\Components\TextInput::make('name')
                                                            ->required(),
                                                    ])
                                                    ->createOptionUsing(function ($data) {
                                                        $attribute = Attribute::create([
                                                            'name' => $data['name'],
                                                        ]);

                                                        return [
                                                            'id' => $attribute->id,
                                                            'name' => $data['name'],
                                                        ];
                                                    }),
                                            ])
                                            ->mutateRelationshipDataBeforeSaveUsing(function ($data, Model $record) {
                                                $data['shop_product_id'] = $record->id;

                                                return $data;
                                            })
                                            ->addActionLabel(__('Add options like size or color'))
                                            ->reorderable()
                                            ->columnSpan('full')
                                            ->deleteAction(
                                                fn (Forms\Components\Actions\Action $action) => $action->requiresConfirmation(),
                                            )->addable(function (Forms\Get $get) {
                                                $attributes = $get('productAttributes');
                                                $isValid = true;
                                                foreach ($attributes as $attribute) {
                                                    if (@$attribute['shop_attribute_id'] == null) {
                                                        $isValid = false;
                                                    }
                                                }

                                                return $isValid;
                                            })->saveRelationshipsUsing(function (Model $record, Forms\Get $get) {
                                                $data = $get('productAttributes');
                                                $ids = array_map(function ($item) {
                                                    return $item['shop_attribute_id'];
                                                }, $data);
                                                $record->productAttributes()->sync($ids);
                                            }),
                                        //                                        VariantsForm::make('variants'),
                                    ]),
                            ])
                            ->persistTabInQueryString(),
                    ])
                    ->columnSpan(['lg' => 2]),

                Forms\Components\Group::make()
                    ->schema([
                        Forms\Components\Section::make(__('Status'))
                            ->schema([
                                Forms\Components\Toggle::make('is_visible')
                                    ->label(__('Visible'))
                                    ->helperText(__('This product will be hidden from all sales channels.'))
                                    ->default(true),

                                Forms\Components\DatePicker::make('published_at')
                                    ->label(__('Availability'))
                                    ->default(now())
                                    ->required(),
                            ]),

                        Forms\Components\Section::make(__('Associations'))
                            ->schema([
                                Forms\Components\Select::make('shop_brand_id')
                                    ->label(__('Brand'))
                                    ->relationship('brand', 'name')
                                    ->searchable()
                                    ->preload()
                                    ->hiddenOn(ProductsRelationManager::class)
                                    ->createOptionForm([
                                        Forms\Components\TextInput::make('name')
                                            ->label(__('Name'))
                                            ->required()
                                            ->maxLength(255)
                                            ->live(onBlur: true)
                                            ->afterStateUpdated(function (string $operation, $state, Forms\Set $set) {
                                                $set('slug', Str::slug($state));
                                            }),
                                        Forms\Components\TextInput::make('slug')
                                            ->label(__('Slug'))
                                            ->dehydrated()
                                            ->required()
                                            ->maxLength(255)
                                            ->unique(Brand::class, 'slug', ignoreRecord: true),
                                    ]),

                                SelectTree::make('categories')
                                    ->label(__('Categories'))
                                    ->relationship('categories', 'name', 'parent_id')
                                    ->independent(true)
                                    ->enableBranchNode()
                                    ->emptyLabel(__('Oops, no results have been found!'))
                                    ->withCount()
                                    ->searchable(),
                                Forms\Components\Select::make('collections')
                                    ->label(__('Collections'))
                                    ->relationship('collections', 'name')
                                    ->preload()
                                    ->searchable()
                                    ->multiple()
                                    ->createOptionForm([
                                        Forms\Components\TextInput::make('name')
                                            ->required(),
                                    ]),
                            ]),
                    ])
                    ->columnSpan(['lg' => 1]),
            ])
            ->columns(3);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\SpatieMediaLibraryImageColumn::make('product-image')
                    ->label(__('Image'))
                    ->collection('product-images'),

                Tables\Columns\TextColumn::make('name')
                    ->label(__('Name'))
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('brand.name')
                    ->label(__('Brand'))
                    ->searchable()
                    ->sortable()
                    ->toggleable(),

                Tables\Columns\IconColumn::make('is_visible')
                    ->label(__('Visibility'))
                    ->sortable()
                    ->toggleable(),

                Tables\Columns\TextColumn::make('price')
                    ->label(__('Price'))
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('sku')
                    ->label(__('SKU'))
                    ->searchable()
                    ->sortable()
                    ->toggleable(),

                Tables\Columns\TextColumn::make('qty')
                    ->label(__('Quantity'))
                    ->searchable()
                    ->sortable()
                    ->toggleable(),

                Tables\Columns\TextColumn::make('security_stock')
                    ->searchable()
                    ->sortable()
                    ->toggleable()
                    ->toggledHiddenByDefault(),

                Tables\Columns\TextColumn::make('published_at')
                    ->label(__('Publish Date'))
                    ->date()
                    ->sortable()
                    ->toggleable()
                    ->toggledHiddenByDefault(),
            ])
            ->filters([
                QueryBuilder::make()
                    ->constraints([
                        TextConstraint::make('name')
                            ->label(__('Name')),
                        TextConstraint::make('slug')
                            ->label(__('Slug')),
                        TextConstraint::make('sku')
                            ->label(__('SKU (Stock Keeping Unit)')),
                        TextConstraint::make('barcode')
                            ->label(__('Barcode (ISBN, UPC, GTIN, etc.)')),
                        TextConstraint::make('description')
                            ->label(__('Description')),
                        NumberConstraint::make('old_price')
                            ->label(__('Compare at price'))
                            ->icon('heroicon-m-currency-dollar'),
                        NumberConstraint::make('price')
                            ->label(__('Price'))
                            ->icon('heroicon-m-currency-dollar'),
                        NumberConstraint::make('cost')
                            ->label(__('Cost per item'))
                            ->icon('heroicon-m-currency-dollar'),
                        NumberConstraint::make('qty')
                            ->label(__('Quantity')),
                        NumberConstraint::make('security_stock')
                            ->label(__('Safety stock')),
                        BooleanConstraint::make('is_visible')
                            ->label(__('Visibility')),
                        BooleanConstraint::make('featured')
                            ->label(__('Featured')),
                        BooleanConstraint::make('backorder')
                            ->label(__('Backorder')),
                        BooleanConstraint::make('requires_shipping')
                            ->label(__('Requires Shipping'))
                            ->icon('heroicon-m-truck'),
                        DateConstraint::make('published_at')
                            ->label(__('Publish Date')),
                    ])
                    ->constraintPickerColumns(2),
            ], layout: Tables\Enums\FiltersLayout::AboveContentCollapsible)
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\ReplicateAction::make()
                    ->excludeAttributes(['slug'])
                    ->successNotification(
                        Notification::make()
                            ->success()
                            ->title('Product replicated')
                            ->body('The product has been replicated successfully.'),
                    ),
            ])
            ->groupedBulkActions([
                Tables\Actions\DeleteBulkAction::make()
                    ->action(fn (Collection $records) => $records->each->delete()),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            RelationGroup::make('Variants', [
                ProductVariantResource\RelationManagers\ProductsRelationManager::class,
            ]),
            RelationGroup::make('Comments', [
                CommentsRelationManager::class,
            ]),
        ];
    }

    public function hasCombinedRelationManagerTabsWithForm(): bool
    {
        return true;
    }

    public static function getWidgets(): array
    {
        return [
            ProductStats::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListProducts::route('/'),
            'create' => Pages\CreateProduct::route('/create'),
            'edit' => Pages\EditProduct::route('/{record}/edit'),
        ];
    }

    public static function getGloballySearchableAttributes(): array
    {
        return ['name', 'sku', 'brand.name'];
    }

    public static function getGlobalSearchResultDetails(Model $record): array
    {
        /** @var Product $record */

        return [
            'Brand' => optional($record->brand)->name,
        ];
    }

    public static function getGlobalSearchEloquentQuery(): Builder
    {
        return parent::getGlobalSearchEloquentQuery()->with(['brand']);
    }

    public static function getNavigationBadge(): ?string
    {
        return static::$model::whereColumn('qty', '<', 'security_stock')->count();
    }
}
