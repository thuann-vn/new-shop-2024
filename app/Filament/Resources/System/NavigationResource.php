<?php

namespace App\Filament\Resources\System;

use App\Filament\Resources\System\NavigationResource\Pages\CreateNavigation;
use App\Filament\Resources\System\NavigationResource\Pages\EditNavigation;
use App\Filament\Resources\System\NavigationResource\Pages\ListNavigations;
use App\Models\Language;
use App\Models\Navigation;
use Filament\Forms\Components\Group;
use Filament\Forms\Components\Placeholder;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\View;
use Filament\Forms\Components\ViewField;
use Filament\Forms\Form;
use Filament\Forms\Set;
use Filament\Resources\Concerns\Translatable;
use Filament\Resources\Resource;
use Filament\Tables\Actions\DeleteAction;
use Filament\Tables\Actions\EditAction;
use Filament\Tables\Actions\ReplicateAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use Illuminate\Support\HtmlString;
use Illuminate\Support\Str;
use SolutionForest\FilamentTranslateField\Forms\Component\Translate;

class NavigationResource extends Resource
{
    use Translatable;

    protected static bool $isDiscovered = true;

    protected static ?string $navigationIcon = 'heroicon-o-bars-3';

    protected static ?int $navigationSort = 3;

    protected static bool $showTimestamps = true;

    private static ?string $workNavigationLabel = null;

    private static ?string $workPluralLabel = null;

    private static ?string $workLabel = null;

    public static function getNavigationGroup(): string
    {
        return trans('Settings');
    }


    public static function disableTimestamps(bool $condition = true): void
    {
        static::$showTimestamps = ! $condition;
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('')->schema([
                    TextInput::make('name')
                        ->label(__('filament-navigation::filament-navigation.attributes.name'))
                        ->reactive()
                        ->debounce()
                        ->afterStateUpdated(function (?string $state, Set $set) {
                            if (! $state) {
                                return;
                            }

                            $set('handle', Str::slug($state));
                        })
                        ->required(),
                    //                    Select::make('language_id')
                    //                        ->options(Language::whereIsVisible(true)->get()->pluck('name', 'id')->toArray())
                    //                        ->label('Language'),
                    Translate::make()
                        ->locales(Language::all()->pluck('code')->toArray())
                        ->schema(function (string $locale) {
                            return [
                                ViewField::make('items')
                                    ->label(__('filament-navigation::filament-navigation.attributes.items'))
                                    ->default([])
                                    ->view('filament-navigation::navigation-builder')
                                    ->viewData([
                                        'locale' => $locale,
                                    ]),
                            ];
                        }),

                ])
                    ->columnSpan([
                        12,
                        'lg' => 8,
                    ]),
                Group::make([
                    Section::make('')->schema([
                        TextInput::make('handle')
                            ->label(__('filament-navigation::filament-navigation.attributes.handle'))
                            ->required()
                            ->unique(column: 'handle', ignoreRecord: true),
                        View::make('filament-navigation::card-divider')
                            ->visible(static::$showTimestamps),
                        Placeholder::make('created_at')
                            ->label(__('filament-navigation::filament-navigation.attributes.created_at'))
                            ->visible(static::$showTimestamps)
                            ->content(fn (?Navigation $record) => $record ? $record->created_at->translatedFormat(Table::$defaultDateTimeDisplayFormat) : new HtmlString('&mdash;')),
                        Placeholder::make('updated_at')
                            ->label(__('filament-navigation::filament-navigation.attributes.updated_at'))
                            ->visible(static::$showTimestamps)
                            ->content(fn (?Navigation $record) => $record ? $record->updated_at->translatedFormat(Table::$defaultDateTimeDisplayFormat) : new HtmlString('&mdash;')),
                    ]),
                ])
                    ->columnSpan([
                        12,
                        'lg' => 4,
                    ]),
            ])
            ->columns(12);
    }

    public static function navigationLabel(?string $string): void
    {
        self::$workNavigationLabel = __($string);
    }

    public static function pluralLabel(?string $string): void
    {
        self::$workPluralLabel = $string;
    }

    public static function label(?string $string): void
    {
        self::$workLabel = $string;
    }

    public static function getNavigationLabel(): string
    {
        return __('Navigation');
    }

    public static function getModelLabel(): string
    {
        return __('Navigation');
    }

    public static function getPluralModelLabel(): string
    {
        return __('Navigations');
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')
                    ->label(__('filament-navigation::filament-navigation.attributes.name'))
                    ->searchable(),
                TextColumn::make('handle')
                    ->badge()
                    ->label(__('filament-navigation::filament-navigation.attributes.handle'))
                    ->searchable(),
                TextColumn::make('created_at')
                    ->label(__('filament-navigation::filament-navigation.attributes.created_at'))
                    ->dateTime()
                    ->sortable(),
                TextColumn::make('updated_at')
                    ->label(__('filament-navigation::filament-navigation.attributes.updated_at'))
                    ->dateTime()
                    ->sortable(),
            ])
            ->actions([
                EditAction::make()
                    ->icon(null),
                DeleteAction::make()
                    ->icon(null),
                ReplicateAction::make()
                    ->icon(null)
                    ->beforeReplicaSaved(function (Navigation $replica): void {
                        // Runs after the record has been replicated but before it is saved to the database.
                        $replica->name = $replica->name . ' (Copy)';
                        $replica->handle = Str::slug($replica->name);
                    }),
            ])
            ->filters([
                //                SelectFilter::make('language_id')
                //                    ->label('Language')
                //                    ->options(Language::whereIsVisible(true)->get()->pluck('name', 'id')->toArray()),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => ListNavigations::route('/'),
            'create' => CreateNavigation::route('/create'),
            'edit' => EditNavigation::route('/{record}'),
        ];
    }

    public static function getModel(): string
    {
        return Navigation::class;
    }
}
