<?php

namespace App\Filament\Resources\Shop;

use App\Filament\Resources\Shop;
use App\Models\Shop\Attribute;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class AttributeResource extends Resource
{
    protected static ?string $model = Attribute::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationGroup = 'Shop';

    protected static ?int $navigationSort   = 6;

    protected static ?string $navigationLabel = 'Attribute';

    public static function getNavigationParentItem(): ?string
    {
        return __('Product');
    }
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
                //
                TextInput::make('name')
                    ->label(__('Name'))
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                //
                Tables\Columns\TextColumn::make('name')
                    ->label(__('Name')),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Shop\AttributeResource\Pages\ManageAttributes::route('/'),
        ];
    }
}
