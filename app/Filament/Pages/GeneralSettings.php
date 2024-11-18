<?php

namespace App\Filament\Pages;

use App\Settings\GeneralSettings as GeneralSettingsModel;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Pages\SettingsPage;
use Wiebenieuwenhuis\FilamentCodeEditor\Components\CodeEditor;

class GeneralSettings extends SettingsPage
{
    protected static ?string $navigationIcon = 'heroicon-o-adjustments-horizontal';

    protected static string $settings = GeneralSettingsModel::class;

    protected static ?int $navigationSort = 1;

    public function getSubheading(): string
    {
        return __('Manage your general settings');
    }

    public function getTitle(): string
    {
        return __('General Settings');
    }

    public static function getNavigationGroup(): ?string
    {
        return __('Settings');
    }

    public static function getNavigationLabel(): string
    {
        return __('General Settings');
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Tabs::make('Tabs')->tabs([
                    Forms\Components\Tabs\Tab::make(__('Website Settings'))
                        ->schema([
                            Forms\Components\FileUpload::make('site_logo')
                                ->label(__('Site logo (min height 56px)'))
                                ->required()
                                ->previewable()
                                ->image()
                                ->imageEditor()
                                ->preserveFilenames()
                                ->required(),
                            Forms\Components\FileUpload::make('site_favicon')
                                ->label(__('Site favicon (56x56)'))
                                ->required()
                                ->previewable()
                                ->imagePreviewHeight('76')
                                ->avatar()
                                ->preserveFilenames()
                                ->required(),
                            Forms\Components\TextInput::make('site_name')
                                ->label(__('Site name'))
                                ->required(),
                            Forms\Components\TextInput::make('site_description')
                                ->label(__('Site description'))
                                ->required(),
                            Forms\Components\TextInput::make('site_keywords')
                                ->label(__('Site keywords')),
                            Forms\Components\TextInput::make('site_phone')
                                ->label(__('Site phone')),
                            Forms\Components\TextInput::make('site_email')
                                ->label(__('Site email')),
                            Forms\Components\TextInput::make('site_address')
                                ->label(__('Site address')),
                            Forms\Components\TextInput::make('site_copyright')
                                ->label(__('Copyright notice')),
                        ]),
                    Forms\Components\Tabs\Tab::make(__('Social Media'))
                        ->schema([
                            Forms\Components\TextInput::make('site_facebook')
                                ->label(__('Site facebook'))
                                ->prefixIcon('heroicon-o-link'),
                            Forms\Components\TextInput::make('site_twitter')
                                ->label(__('Site twitter'))
                                ->prefixIcon('heroicon-o-link'),
                            Forms\Components\TextInput::make('site_instagram')
                                ->label(__('Site instagram'))
                                ->prefixIcon('heroicon-o-link'),
                            Forms\Components\TextInput::make('site_youtube')
                                ->label(__('Site youtube'))
                                ->prefixIcon('heroicon-o-link'),
                            Forms\Components\TextInput::make('site_linkedin')
                                ->label(__('Site linkedin'))
                                ->prefixIcon('heroicon-o-link'),
                            Forms\Components\TextInput::make('site_google')
                                ->label(__('Site google'))
                                ->prefixIcon('heroicon-o-link'),
                        ]),
                    Forms\Components\Tabs\Tab::make(__('Footer'))
                        ->schema([
                            Forms\Components\Repeater::make('site_footer')
                                ->schema([
                                    Forms\Components\FileUpload::make('image')
                                        ->label(__('Image'))
                                        ->previewable()
                                        ->avatar()
                                        ->image()
                                        ->imageEditor()
                                        ->imageEditorAspectRatios([
                                            null,
                                            '1:1',
                                        ])
                                        ->preserveFilenames()
                                        ->required(),
                                    Forms\Components\TextInput::make('text')
                                        ->label(__('Text')),
                                ])
                                ->grid(4),
                        ]),
                    Forms\Components\Tabs\Tab::make(__('Custom JS/CSS'))
                        ->schema([
                            CodeEditor::make('custom_css'),
                            CodeEditor::make('custom_js'),
                        ]),
                ]),
            ])->columns(1);
    }
}
