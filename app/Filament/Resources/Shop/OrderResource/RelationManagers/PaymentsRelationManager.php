<?php

namespace App\Filament\Resources\Shop\OrderResource\RelationManagers;

use Akaunting\Money\Currency;
use App\Settings\ShopSettings;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class PaymentsRelationManager extends RelationManager
{
    protected static string $relationship = 'payments';

    protected static ?string $recordTitleAttribute = 'reference';

    protected static ?string $label = 'Payment';

    public static function getTitle(Model $ownerRecord, string $pageClass): string
    {
        return __('Payments');
    }

    public static function getModelPluralLabel(): ?string
    {
        return __(self::$label);
    }

    public static function getModelLabel(): ?string
    {
        return __(self::$label);
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('reference')
                    ->label(__('Reference'))
                    ->columnSpan('full')
                    ->required(),

                Forms\Components\TextInput::make('amount')
                    ->label(__('Amount'))
                    ->numeric()
                    ->rules(['regex:/^\d{1,6}(\.\d{0,2})?$/'])
                    ->required(),

                Forms\Components\Select::make('currency')
                    ->label(__('Currency'))
                    ->options(collect(Currency::getCurrencies())->mapWithKeys(fn ($item, $key) => [$key => $item['symbol'] . ' - ' . $item['name']]))
                    ->searchable()
                    ->default(fn () => app(ShopSettings::class)->shop_currency)
                    ->required(),
                Forms\Components\Select::make('method')
                    ->label(__('Method'))
                    ->options(array_map(fn ($method) => $method['name'], array_filter(app(ShopSettings::class)->payment_methods, fn ($method) => $method['enabled'])))
                    ->required()
                    ->native(false),

                Forms\Components\Select::make('provider')
                    ->label(__('Provider'))
                    ->options([
                        'cash' => __('Cash'),
                        'bank' => __('Bank'),
                    ])
                    ->required()
                    ->native(false),

            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('reference')
                    ->searchable(),

                Tables\Columns\TextColumn::make('amount')
                    ->sortable()
                    ->money(fn ($record) => $record->currency),

                Tables\Columns\TextColumn::make('provider')
                    ->formatStateUsing(fn ($state) => Str::headline($state)),

                Tables\Columns\TextColumn::make('method')
                    ->formatStateUsing(fn ($state) => Str::headline($state)),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->groupedBulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }
}
