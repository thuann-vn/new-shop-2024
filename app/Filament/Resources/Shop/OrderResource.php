<?php

namespace App\Filament\Resources\Shop;

use App\Enums\OrderStatus;
use App\Filament\Form\Fields\PriceField;
use App\Filament\Resources\Shop\OrderResource\Pages;
use App\Filament\Resources\Shop\OrderResource\RelationManagers;
use App\Filament\Resources\Shop\OrderResource\Widgets\OrderStats;
use App\Forms\Components\AddressForm;
use App\Models\Shop\Order;
use App\Models\Shop\Product;
use Filament\Forms;
use Filament\Forms\Components\Actions\Action;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;
use Squire\Models\Currency;

class OrderResource extends Resource
{
    protected static ?string $model = Order::class;

    protected static ?string $slug = 'shop/orders';

    protected static ?string $recordTitleAttribute = 'number';

    protected static ?string $navigationGroup = 'Shop';

    protected static ?string $navigationIcon = 'heroicon-o-shopping-bag';

    protected static ?int $navigationSort = 2;

    protected static ?string $navigationLabel = 'Order';

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
                Forms\Components\Tabs::make()
                    ->tabs([
                        Forms\Components\Tabs\Tab::make(__('Details'))
                            ->schema(static::getDetailsFormSchema()),

                        Forms\Components\Tabs\Tab::make(__('Order Items'))
                            ->schema([
                                static::getItemsRepeater(),
                                static::getTotalPriceInputs(),
                            ]),
                    ])
                    ->columnSpan(['lg' => fn (?Order $record) => $record === null ? 3 : 2]),

            ])
            ->columns(2);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('number')
                    ->label(__('Order Number'))
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('customer.name')
                    ->label(__('Customer'))
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('status')
                    ->label(__('Status'))
                    ->badge(),
                Tables\Columns\TextColumn::make('total_price')
                    ->label(__('Total Price'))
                    ->searchable()
                    ->sortable()
                    ->summarize([
                        Tables\Columns\Summarizers\Sum::make()
                            ->money(),
                    ]),
                Tables\Columns\TextColumn::make('shipping_price')
                    ->label(__('Shipping Cost'))
                    ->searchable()
                    ->sortable()
                    ->toggleable()
                    ->summarize([
                        Tables\Columns\Summarizers\Sum::make()
                            ->money(),
                    ]),
                Tables\Columns\TextColumn::make('created_at')
                    ->label(__('Order Date'))
                    ->date()
                    ->toggleable(),
            ])
            ->filters([
                Tables\Filters\TrashedFilter::make(),

                Tables\Filters\Filter::make('created_at')
                    ->form([
                        Forms\Components\DatePicker::make('created_from')
                            ->placeholder(fn ($state): string => 'Dec 18, ' . now()->subYear()->format('Y')),
                        Forms\Components\DatePicker::make('created_until')
                            ->placeholder(fn ($state): string => now()->format('M d, Y')),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query
                            ->when(
                                $data['created_from'] ?? null,
                                fn (Builder $query, $date): Builder => $query->whereDate('created_at', '>=', $date),
                            )
                            ->when(
                                $data['created_until'] ?? null,
                                fn (Builder $query, $date): Builder => $query->whereDate('created_at', '<=', $date),
                            );
                    })
                    ->indicateUsing(function (array $data): array {
                        $indicators = [];
                        if ($data['created_from'] ?? null) {
                            $indicators['created_from'] = __('Order from ') . Carbon::parse($data['created_from'])->toFormattedDateString();
                        }
                        if ($data['created_until'] ?? null) {
                            $indicators['created_until'] = __('Order until ') . Carbon::parse($data['created_until'])->toFormattedDateString();
                        }

                        return $indicators;
                    }),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->groupedBulkActions([
                Tables\Actions\DeleteBulkAction::make()
                    ->action(fn (Collection $records) => $records->each->delete()),
            ])
            ->groups([
                Tables\Grouping\Group::make(__('Order Date'))
                    ->label(__('Order Date'))
                    ->date()
                    ->collapsible(),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            RelationManagers\PaymentsRelationManager::class,
        ];
    }

    public static function getWidgets(): array
    {
        return [
            OrderStats::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListOrders::route('/'),
            'create' => Pages\CreateOrder::route('/create'),
            'edit' => Pages\EditOrder::route('/{record}/edit'),
        ];
    }

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()->withoutGlobalScope(SoftDeletingScope::class);
    }

    public static function getGloballySearchableAttributes(): array
    {
        return ['number', 'customer.name'];
    }

    public static function getGlobalSearchResultDetails(Model $record): array
    {
        /** @var Order $record */

        return [
            'Customer' => optional($record->customer)->name,
        ];
    }

    public static function getGlobalSearchEloquentQuery(): Builder
    {
        return parent::getGlobalSearchEloquentQuery()->with(['customer', 'items']);
    }

    public static function getNavigationBadge(): ?string
    {
        return static::$model::where('status', 'new')->count();
    }

    public static function getDetailsFormSchema(): array
    {
        return [
            Forms\Components\TextInput::make('number')
                ->label(__('Order Number'))
                ->default('OR-' . random_int(100000, 999999))
                ->disabled()
                ->dehydrated()
                ->required()
                ->maxLength(32)
                ->unique(Order::class, 'number', ignoreRecord: true),

            Forms\Components\Select::make('shop_customer_id')
                ->label(__('Customer'))
                ->relationship('customer', 'name')
                ->searchable()
                ->createOptionForm([
                    Forms\Components\TextInput::make('name')
                        ->label(__('Name'))
                        ->required()
                        ->maxLength(255),

                    Forms\Components\TextInput::make('email')
                        ->label(__('Email address'))
                        ->email()
                        ->maxLength(255)
                        ->unique(),

                    Forms\Components\TextInput::make('phone')
                        ->label(__('Phone'))
                        ->maxLength(255),
                    Forms\Components\Hidden::make('password')
                        ->default(Str::random(16)),
                ])
                ->createOptionAction(function (Action $action) {
                    return $action
                        ->modalHeading(__('Create customer'))
                        ->modalButton(__('Create customer'))
                        ->modalWidth('lg');
                }),

            Forms\Components\Select::make('status')
                ->label(__('Status'))
                ->options(OrderStatus::class)
                ->required()
                ->native(false),

            Forms\Components\Select::make('currency')
                ->default('vnd')
                ->label(__('Currency'))
                ->searchable()
                ->getSearchResultsUsing(fn (string $query) => Currency::where('name', 'like', "%{$query}%")->pluck('name', 'id'))
                ->getOptionLabelUsing(fn ($value): ?string => Currency::find($value)?->getAttribute('name'))
                ->required(),

            AddressForm::make('address')
                ->label(__('Shipping Address'))
                ->columnSpan('full'),

            Forms\Components\MarkdownEditor::make('notes')
                ->label(__('Notes'))
                ->columnSpan('full'),
        ];
    }

    public static function getItemsRepeater(): Repeater
    {
        return Repeater::make('items')
            ->label(__('Order Items'))
            ->relationship()
            ->schema([
                Forms\Components\Select::make('shop_product_id')
                    ->label(__('Product'))
                    ->options(Product::query()->pluck('name', 'id'))
                    ->required()
                    ->reactive()
                    ->afterStateUpdated(function ($state, Forms\Set $set, Forms\Get $get) {
                        $set('unit_price', Product::find($state)?->price ?? 0);
                        $set('subtotal', Product::find($state)?->price * $get('qty') ?? 1);
                    })
                    ->distinct()
                    ->disableOptionsWhenSelectedInSiblingRepeaterItems()
                    ->columnSpan([
                        'md' => 4,
                    ])
                    ->searchable(),
                Forms\Components\TextInput::make('qty')
                    ->label(__('Qty'))
                    ->numeric()
                    ->default(1)
                    ->columnSpan([
                        'md' => 2,
                    ])
                    ->reactive()
                    ->afterStateUpdated(function ($state, Forms\Set $set, Forms\Get $get) {
                        $price = $get('unit_price');
                        $set('subtotal', $state * $price);
                    })
                    ->required(),

                PriceField::make('unit_price')
                    ->label(__('Unit Price'))
                    ->dehydrated()
                    ->numeric()
                    ->required()
                    ->live(onBlur: true)
                    ->afterStateUpdated(function ($state, Forms\Set $set, Forms\Get $get) {
                        $qty = $get('qty');
                        $set('subtotal', $state * $qty);
                    })
                    ->columnSpan([
                        'md' => 2,
                    ]),

                PriceField::make('subtotal')
                    ->label(__('Subtotal'))
                    ->dehydrated()
                    ->numeric()
                    ->required()
                    ->afterStateUpdated(function ($state, Forms\Set $set, Forms\Get $get) {
                        OrderResource::calculateTotalPrice($get, $set);
                    })
                    ->columnSpan([
                        'md' => 2,
                    ]),
            ])
            ->extraItemActions([
                Action::make('openProduct')
                    ->tooltip('Open product')
                    ->icon('heroicon-m-arrow-top-right-on-square')
                    ->url(function (array $arguments, Repeater $component): ?string {
                        $itemData = $component->getRawItemState($arguments['item']);

                        $product = Product::find($itemData['shop_product_id']);

                        if (! $product) {
                            return null;
                        }

                        return ProductResource::getUrl('edit', ['record' => $product]);
                    }, shouldOpenInNewTab: true)
                    ->hidden(fn (array $arguments, Repeater $component): bool => blank($component->getRawItemState($arguments['item'])['shop_product_id'])),
            ])
            ->orderColumn('sort')
            ->defaultItems(1)
            ->hiddenLabel()
            ->columns([
                'md' => 10,
            ])
            ->required();
    }

    public static function calculateTotalPrice(Forms\Get $get, Forms\Set $set): void
    {
        $items = $get('../../items');
        $discount = $get('../../discount') ?? 0;
        $shippingPrice = $get('../../shipping_price') ?? 0;
        $totalPrice = 0;
        foreach ($items as $item) {
            $totalPrice += floatval($item['unit_price']) * intval($item['qty']);
        }
        $set('../../subtotal', $totalPrice);
        $set('../../total_price', $totalPrice + $shippingPrice - $discount);
    }

    public static function getTotalPriceInputs()
    {
        return Forms\Components\Grid::make(2)
            ->schema([
                PriceField::make('subtotal')
                    ->numeric()
                    ->label(__('Subtotal')),
                PriceField::make('shipping_price')
                    ->default(0)
                    ->live(onBlur: true)
                    ->afterStateUpdated(function ($state, Forms\Set $set, Forms\Get $get) {
                        $subtotal = $get('subtotal') ?? 0;
                        $shippingPrice = $state ?? 0;
                        $discount = $get('discount') ?? 0;
                        $set('total_price', $subtotal + $shippingPrice - $discount);
                    })
                    ->numeric()
                    ->label(__('Shipping price')),
                PriceField::make('discount')
                    ->default(0)
                    ->live(onBlur: true)
                    ->afterStateUpdated(function ($state, Forms\Set $set, Forms\Get $get) {
                        $subtotal = $get('subtotal') ?? 0;
                        $shippingPrice = $get('shipping_price') ?? 0;
                        $discount = $state ?? 0;
                        $set('total_price', $subtotal + $shippingPrice - $discount);
                    })
                    ->numeric()
                    ->label(__('Discount')),
                PriceField::make('total_price')
                    ->numeric()
                    ->label(__('Total price')),
            ]);
    }
}
