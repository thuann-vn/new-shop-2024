<?php

namespace App\Filament\Resources\Shop;

use App\Filament\Resources\Shop\CollectionResource\RelationManagers\ProductsRelationManager;
use App\Filament\Resources\System\SliderResource;
use App\Models\Shop\Collection;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Support\Str;

class CollectionResource extends Resource
{
    protected static ?string $slug = 'shop/collections';

    protected static ?string $recordTitleAttribute = 'name';

    protected static ?string $navigationGroup = 'Shop';

    protected static ?string $model = \App\Models\Shop\Collection::class;

    protected static ?string $navigationIcon = 'heroicon-o-queue-list';

    protected static ?int $navigationSort = 4;
    protected static ?string $navigationLabel = 'Collection';

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
                Forms\Components\FileUpload::make('image')
                    ->label(__('Image'))
                    ->image()
                    ->imageEditor(),
                Forms\Components\TextInput::make('name')
                    ->label(__('Name'))
                    ->required()
                    ->maxLength(255)
                    ->live(onBlur: true)
                    ->afterStateUpdated(fn (string $operation, $state, Forms\Set $set) => $operation === 'create' ? $set('slug', Str::slug($state)) : null),
                Forms\Components\TextInput::make('slug')
                    ->label(__('Slug'))
                    ->dehydrated()
                    ->required()
                    ->maxLength(255)
                    ->unique(Collection::class, 'slug', ignoreRecord: true),

                Forms\Components\MarkdownEditor::make('description')
                    ->label(__('Description')),
                Forms\Components\Toggle::make('is_visible')
                    ->label(__('Visible to customers.'))
                    ->default(true),
            ])->columns(1);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('image')
                    ->label(__('Image')),
                Tables\Columns\TextColumn::make('name')
                    ->label(__('Name'))
                    ->searchable()
                    ->sortable(),
                Tables\Columns\IconColumn::make('is_visible')
                    ->label(__('Visibility'))
                    ->sortable(),
                Tables\Columns\TextColumn::make('updated_at')
                    ->label(__('Updated Date'))
                    ->date()
                    ->sortable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            ProductsRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => CollectionResource\Pages\ListCollections::route('/'),
            'create' => CollectionResource\Pages\CreateCollection::route('/create'),
            'edit' => CollectionResource\Pages\EditCollection::route('/{record}/edit'),
        ];
    }
}
