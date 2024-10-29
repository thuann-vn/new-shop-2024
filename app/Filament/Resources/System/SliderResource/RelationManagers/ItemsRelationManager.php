<?php

namespace App\Filament\Resources\System\SliderResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;

class ItemsRelationManager extends RelationManager
{
    protected static string $relationship = 'items';

    protected static ?string $label = 'Banner Items';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\FileUpload::make('image')
                    ->image()
                    ->required(),
                Forms\Components\TextInput::make('title')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('subtitle')
                    ->maxLength(255),
                Forms\Components\TextInput::make('link')
                    ->maxLength(255),
                Forms\Components\Toggle::make('is_image_only')
                    ->label('Display image only')
                    ->live()
                    ->default(false),
                Forms\Components\Toggle::make('is_alt_style')
                    ->label('Alt Style (white text)')
                    ->default(false),
                Forms\Components\Toggle::make('is_visible')
                    ->default(true),
            ])->columns(1);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('title')
            ->columns([
                Tables\Columns\ImageColumn::make('image'),
                Tables\Columns\TextColumn::make('title'),
                Tables\Columns\TextColumn::make('subtitle'),
                Tables\Columns\IconColumn::make('is_image_only'),
                Tables\Columns\IconColumn::make('is_alt_style'),
                Tables\Columns\IconColumn::make('is_visible')
                    ->boolean(),
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
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
