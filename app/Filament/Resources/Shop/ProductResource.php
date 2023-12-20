<?php

namespace App\Filament\Resources\Shop;

use AmidEsfahani\FilamentTinyEditor\TinyEditor;
use App\Filament\Resources\Shop\BrandResource\RelationManagers\ProductsRelationManager;
use App\Filament\Resources\Shop\ProductResource\Pages;
use App\Filament\Resources\Shop\ProductResource\Widgets\ProductStats;
use App\Forms\Components\VariantsForm;
use App\Models\Shop\Attribute;
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
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

class ProductResource extends Resource
{
    protected static ?string $model = Product::class;

    protected static ?string $slug = 'shop/products';

    protected static ?string $recordTitleAttribute = 'name';

    protected static ?string $navigationGroup = 'Shop';

    protected static ?string $navigationIcon = 'heroicon-o-bolt';

    protected static ?string $navigationLabel = 'Products';

    protected static ?int $navigationSort = 0;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Group::make()
                    ->schema([
                        Tabs::make('Tabs')
                            ->tabs([
                                Tabs\Tab::make('General Information')
                                    ->schema([
                                        Forms\Components\Section::make()
                                            ->schema([
                                                Forms\Components\TextInput::make('name')
                                                    ->required()
                                                    ->maxLength(255)
                                                    ->live(onBlur: true)
                                                    ->afterStateUpdated(function (string $operation, $state, Forms\Set $set) {
                                                        if ($operation !== 'create') {
                                                            return;
                                                        }

                                                        $set('slug', Str::slug($state));
                                                    }),

                                                Forms\Components\TextInput::make('slug')
                                                    ->disabled()
                                                    ->dehydrated()
                                                    ->required()
                                                    ->maxLength(255)
                                                    ->unique(Product::class, 'slug', ignoreRecord: true),

                                                TinyEditor::make('description')
                                                    ->columnSpan('full'),
                                            ])
                                            ->columns(2),

                                        Forms\Components\Section::make('Pricing')
                                            ->schema([
                                                Forms\Components\TextInput::make('price')
                                                    ->currencyMask(thousandSeparator: ',',decimalSeparator: '.',precision: 2)
                                                    ->rules(['regex:/^\d{1,6}(\.\d{0,2})?$/'])
                                                    ->required(),

                                                Forms\Components\TextInput::make('old_price')
                                                    ->label('Compare at price')
                                                    ->currencyMask(thousandSeparator: ',',decimalSeparator: '.',precision: 2)
                                                    ->rules(['regex:/^\d{1,6}(\.\d{0,2})?$/'])
                                                    ->required(),

                                                Forms\Components\TextInput::make('cost')
                                                    ->label('Cost per item')
                                                    ->helperText('Customers won\'t see this price.')
                                                    ->currencyMask(thousandSeparator: ',',decimalSeparator: '.',precision: 2)
                                                    ->rules(['regex:/^\d{1,6}(\.\d{0,2})?$/'])
                                                    ->required(),
                                            ])
                                            ->columns(2),
                                        Forms\Components\Section::make('Inventory')
                                            ->schema([
                                                Forms\Components\TextInput::make('sku')
                                                    ->label('SKU (Stock Keeping Unit)')
                                                    ->unique(Product::class, 'sku', ignoreRecord: true)
                                                    ->maxLength(255),

                                                Forms\Components\TextInput::make('barcode')
                                                    ->label('Barcode (ISBN, UPC, GTIN, etc.)')
                                                    ->unique(Product::class, 'barcode', ignoreRecord: true)
                                                    ->maxLength(255),

                                                Forms\Components\TextInput::make('qty')
                                                    ->label('Quantity')
                                                    ->numeric()
                                                    ->rules(['integer', 'min:0'])
                                                    ->required(),

                                                Forms\Components\TextInput::make('security_stock')
                                                    ->helperText('The safety stock is the limit stock for your products which alerts you if the product stock will soon be out of stock.')
                                                    ->numeric()
                                                    ->rules(['integer', 'min:0'])
                                                    ->default(0)
                                                    ->required(),
                                            ])
                                            ->columns(2),

                                        Forms\Components\Section::make('Shipping')
                                            ->schema([
                                                Forms\Components\Checkbox::make('backorder')
                                                    ->label('This product can be returned'),

                                                Forms\Components\Checkbox::make('requires_shipping')
                                                    ->label('This product will be shipped'),
                                            ])
                                            ->columns(2),
                                    ]),
                                Tabs\Tab::make('Images')
                                    ->schema([
                                        SpatieMediaLibraryFileUpload::make('media')
                                            ->collection('product-images')
                                            ->multiple()
                                            ->maxFiles(5)
                                            ->reorderable()
                                            ->responsiveImages()
                                            ->hiddenLabel(),
                                    ]),
                                Tabs\Tab::make('Variants')
                                    ->schema([
                                        Forms\Components\Repeater::make('productAttributes')
                                            ->relationship('productAttributes')
                                            ->hiddenLabel()
                                            ->label('Select attributes to create variants:')
                                            ->schema([
                                                Forms\Components\Select::make('shop_attribute_id')
                                                    ->label('Attribute')
                                                    ->options(Attribute::all()->pluck('name', 'id'))
                                                    ->disableOptionsWhenSelectedInSiblingRepeaterItems()
                                                    ->required()
                                                    ->createOptionForm([
                                                        Forms\Components\TextInput::make('name')
                                                            ->required(),
                                                    ])
                                                    ->createOptionUsing(function ($data)  {
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
                                            ->addActionLabel('Add options like size or color')
                                            ->reorderable()
                                            ->columnSpan('full')
                                            ->deleteAction(
                                                fn (Forms\Components\Actions\Action $action) => $action->requiresConfirmation(),
                                            )->addable(function (Forms\Get $get) {
                                                $attributes = $get('productAttributes');
                                                $isValid = true;
                                                foreach ($attributes as $attribute){
                                                    if(@$attribute['shop_attribute_id'] == null){
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
                            ->persistTabInQueryString()
                    ])
                    ->columnSpan(['lg' => 2]),

                Forms\Components\Group::make()
                    ->schema([
                        Forms\Components\Section::make('Status')
                            ->schema([
                                Forms\Components\Toggle::make('is_visible')
                                    ->label('Visible')
                                    ->helperText('This product will be hidden from all sales channels.')
                                    ->default(true),

                                Forms\Components\DatePicker::make('published_at')
                                    ->label('Availability')
                                    ->default(now())
                                    ->required(),
                            ]),

                        Forms\Components\Section::make('Associations')
                            ->schema([
                                Forms\Components\Select::make('shop_brand_id')
                                    ->relationship('brand', 'name')
                                    ->searchable()
                                    ->hiddenOn(ProductsRelationManager::class),

                                SelectTree::make('categories')
                                    ->relationship('categories', 'name', 'parent_id')
                                    ->independent(true)
                                    ->enableBranchNode()
                                    ->emptyLabel(__('Oops, no results have been found!'))
                                    ->withCount()
                                    ->searchable()
                                    ->required(),
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
                    ->label('Image')
                    ->collection('product-images'),

                Tables\Columns\TextColumn::make('name')
                    ->label('Name')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('brand.name')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),

                Tables\Columns\IconColumn::make('is_visible')
                    ->label('Visibility')
                    ->sortable()
                    ->toggleable(),

                Tables\Columns\TextColumn::make('price')
                    ->label('Price')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('sku')
                    ->label('SKU')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),

                Tables\Columns\TextColumn::make('qty')
                    ->label('Quantity')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),

                Tables\Columns\TextColumn::make('security_stock')
                    ->searchable()
                    ->sortable()
                    ->toggleable()
                    ->toggledHiddenByDefault(),

                Tables\Columns\TextColumn::make('published_at')
                    ->label('Publish Date')
                    ->date()
                    ->sortable()
                    ->toggleable()
                    ->toggledHiddenByDefault(),
            ])
            ->filters([
                QueryBuilder::make()
                    ->constraints([
                        TextConstraint::make('name'),
                        TextConstraint::make('slug'),
                        TextConstraint::make('sku')
                            ->label('SKU (Stock Keeping Unit)'),
                        TextConstraint::make('barcode')
                            ->label('Barcode (ISBN, UPC, GTIN, etc.)'),
                        TextConstraint::make('description'),
                        NumberConstraint::make('old_price')
                            ->label('Compare at price')
                            ->icon('heroicon-m-currency-dollar'),
                        NumberConstraint::make('price')
                            ->icon('heroicon-m-currency-dollar'),
                        NumberConstraint::make('cost')
                            ->label('Cost per item')
                            ->icon('heroicon-m-currency-dollar'),
                        NumberConstraint::make('qty')
                            ->label('Quantity'),
                        NumberConstraint::make('security_stock'),
                        BooleanConstraint::make('is_visible')
                            ->label('Visibility'),
                        BooleanConstraint::make('featured'),
                        BooleanConstraint::make('backorder'),
                        BooleanConstraint::make('requires_shipping')
                            ->icon('heroicon-m-truck'),
                        DateConstraint::make('published_at'),
                    ])
                    ->constraintPickerColumns(2),
            ], layout: Tables\Enums\FiltersLayout::AboveContentCollapsible)
            ->actions([
                Tables\Actions\EditAction::make()
            ])
            ->groupedBulkActions([
                Tables\Actions\DeleteBulkAction::make()
                    ->action(function () {
                        Notification::make()
                            ->title('Now, now, don\'t be cheeky, leave some records for others to play with!')
                            ->warning()
                            ->send();
                    }),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            RelationGroup::make('Variants', [
                ProductVariantResource\RelationManagers\ProductsRelationManager::class
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
