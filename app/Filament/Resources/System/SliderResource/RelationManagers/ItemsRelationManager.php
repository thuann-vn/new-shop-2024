<?php

namespace App\Filament\Resources\System\SliderResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Components\SpatieMediaLibraryFileUpload;
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
                SpatieMediaLibraryFileUpload::make('media')
                    ->image()
                    ->required()
                    ->collection('slider-image')
                    ->reorderable()
                    ->preserveFilenames()
                    ->hiddenLabel(),
                Forms\Components\TextInput::make('title')
                    ->label(__('Title'))
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('subtitle')
                    ->label(__('Subtitle'))
                    ->maxLength(255),
                Forms\Components\TextInput::make('link')
                    ->label(__('Link'))
                    ->maxLength(255),
                Forms\Components\Toggle::make('is_image_only')
                    ->label(__('Display image only'))
                    ->live()
                    ->default(false),
                Forms\Components\Toggle::make('is_alt_style')
                    ->label(__('Alt Style (white text)'))
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
                Tables\Columns\SpatieMediaLibraryImageColumn::make('media')
                    ->collection('slider-image')
                    ->label(__('Image')),
                Tables\Columns\TextColumn::make('title')->label(__('Title')),
                Tables\Columns\IconColumn::make('is_visible')->label(__('Visible'))
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
