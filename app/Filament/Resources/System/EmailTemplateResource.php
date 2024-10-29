<?php

namespace App\Filament\Resources\System;

use AmidEsfahani\FilamentTinyEditor\TinyEditor;
use App\Filament\Resources\System\EmailTemplateResource\Pages\CreateEmailTemplate;
use App\Filament\Resources\System\EmailTemplateResource\Pages\EditEmailTemplate;
use App\Filament\Resources\System\EmailTemplateResource\Pages\ListEmailTemplates;
use App\Models\EmailTemplate;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Forms\Set;
use Filament\Notifications\Notification;
use Filament\Resources\Concerns\Translatable;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Str;
use SolutionForest\FilamentTranslateField\Forms\Component\Translate;

class EmailTemplateResource extends Resource
{
    use Translatable;

    protected static ?string $model = EmailTemplate::class;

    protected static ?string $navigationIcon = 'heroicon-o-envelope';


    public static function getNavigationGroup(): string
    {
        return trans('Settings');
    }
    public static function getModelLabel(): string
    {
        return __('email-templates.resource_name.singular');
    }

    public static function getPluralModelLabel(): string
    {
        return __('email-templates.resource_name.plural');
    }

    public static function form(Form $form): Form
    {
        $templates = [
            'default' => 'Default',
        ];

        return $form->schema(
            [
                Section::make()
                    ->schema(
                        [
                            Grid::make(['default' => 1])
                                ->schema(
                                    [
                                        TextInput::make('name')
                                            ->live()
                                            ->label(__('email-templates.form-fields-labels.template-name'))
                                            ->hint(__('email-templates.form-fields-labels.template-name-hint'))
                                            ->required(),
                                    ]
                                ),

                            Grid::make(['default' => 1, 'sm' => 1, 'md' => 2])
                                ->schema(
                                    [
                                        TextInput::make('key')
                                            ->afterStateUpdated(
                                                fn (Set $set, ?string $state) => $set('key', Str::slug($state))
                                            )
                                            ->label(__('email-templates.form-fields-labels.key'))
                                            ->hint(__('email-templates.form-fields-labels.key-hint'))
                                            ->required()->columnSpanFull(),
                                        Select::make('language')
                                            ->options(getAvailableLanguages())
                                            ->default(config('filament-email-templates.default_locale'))
                                            ->searchable()
                                            ->visible(false)
                                            ->allowHtml(),
                                    ]
                                ),
                            Grid::make(['default' => 1])
                                ->schema(
                                    [
                                        Translate::make()
                                            ->locales(getAvailableLanguages())
                                            ->contained(false)
                                            ->schema([
                                                TextInput::make('subject')
                                                    ->label(__('email-templates.form-fields-labels.subject')),

                                                TinyEditor::make('content')
                                                    ->label(__('email-templates.form-fields-labels.content'))
                                                    ->profile('default')
                                                    ->default('<p>Dear ##user.firstname##, </p>'),
                                            ]),

                                    ]
                                ),

                        ]
                    ),
            ]
        );
    }

    public static function table(Table $table): Table
    {

        return $table->columns(
            [
                TextColumn::make('id'),
                TextColumn::make('name')
                    ->limit(50)
                    ->sortable()
                    ->searchable(),
                TextColumn::make('subject')
                    ->limit(50),
            ]
        )
            ->actions(
                [
                    Tables\Actions\EditAction::make(),
                    Tables\Actions\DeleteAction::make(),
                    Tables\Actions\ForceDeleteAction::make(),
                    Tables\Actions\RestoreAction::make(),
                ]
            )
            ->bulkActions(
                [
                    Tables\Actions\DeleteBulkAction::make(),
                    Tables\Actions\ForceDeleteBulkAction::make(),
                    Tables\Actions\RestoreBulkAction::make(),
                ]
            )->headerActions([
                Tables\Actions\LocaleSwitcher::make(),
            ])->headerActionsPosition(Tables\Actions\HeaderActionsPosition::Bottom);
    }

    public static function getPages(): array
    {
        return [
            'index' => ListEmailTemplates::route('/'),
            'create' => CreateEmailTemplate::route('/create'),
            'edit' => EditEmailTemplate::route('/{record}/edit'),
        ];
    }

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()
            ->withoutGlobalScopes(
                [
                    SoftDeletingScope::class,
                ]
            );
    }
}
