<?php

namespace App\Filament\Resources\Blog;

use App\Filament\Resources\Blog\CategoryResource\Pages;
use App\Models\Blog\Category;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Infolists\Components\IconEntry;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Infolist;
use Filament\Resources\Concerns\Translatable;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Support\Str;
use SolutionForest\FilamentTranslateField\Forms\Component\Translate;

class CategoryResource extends Resource
{
    use Translatable;

    protected static ?string $model = Category::class;

    protected static ?string $slug = 'blog/categories';

    protected static ?string $recordTitleAttribute = 'name';

    protected static ?string $navigationGroup = 'Blog';

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?int $navigationSort = 1;

    protected static ?string $navigationLabel = 'Blog Category';

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
            ->schema([Translate::make()
                ->locales(getAvailableLanguages())
                ->contained(false)
                ->schema(fn (string $locale) => [
                    Forms\Components\TextInput::make('name')
                        ->label(__('Name'))
                        ->required()
                        ->maxLength(255)
                        ->live(onBlur: true)
                        ->afterStateUpdated(function (string $operation, $state, Forms\Set $set, Forms\Get $get) use ($locale) {
                            $path = 'slug.' . $locale;
                            $slug = $get($path);
                            if ($operation !== 'create' && ! empty($slug)) {
                                return;
                            }
                            $set($path, Str::slug($state));
                        }),

                    Forms\Components\TextInput::make('slug')
                        ->label(__('Slug'))
                        ->disabled()
                        ->dehydrated()
                        ->required()
                        ->maxLength(255)
                        ->unique(Category::class, 'slug', ignoreRecord: true),

                    Forms\Components\MarkdownEditor::make('description')
                        ->label(__('Description'))
                        ->columnSpan('full'),
                ]),

                Forms\Components\Toggle::make('is_visible')
                    ->label(__('Visible to customers.'))
                    ->default(true),
            ])
            ->columns(1);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->label(__('Name'))
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('slug')
                    ->label(__('Slug'))
                    ->searchable()
                    ->sortable(),
                Tables\Columns\IconColumn::make('is_visible')
                    ->label(__('Visibility')),
                Tables\Columns\TextColumn::make('updated_at')
                    ->label(__('Last Updated'))
                    ->date(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ]);
    }

    public static function infolist(Infolist $infolist): Infolist
    {
        return $infolist
            ->schema([
                TextEntry::make('name'),
                TextEntry::make('slug'),
                TextEntry::make('description'),
                IconEntry::make('is_visible')
                    ->label('Visibility'),
                TextEntry::make('updated_at')
                    ->dateTime(),
            ])
            ->columns(1)
            ->inlineLabel();
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ManageCategories::route('/'),
        ];
    }
}
