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

    protected static ?string $navigationGroup = 'Settings';
    protected static ?string $navigationLabel = 'General Settings';

    protected static ?string $title = 'General Settings';
    protected ?string $subheading = 'Manage your general settings';

    protected static ?int $navigationSort = 1;
    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Tabs::make('Tabs')->tabs([
                    Forms\Components\Tabs\Tab::make('Website Settings')
                        ->schema([
                            Forms\Components\FileUpload::make('site_logo')
                                ->label('Site logo (min height 56px)')
                                ->required()
                                ->previewable()
                                ->image()
                                ->imageEditor()
                                ->imageEditorAspectRatios([
                                    null,
                                    '1:1',
                                ])
                                ->preserveFilenames()
                                ->required(),
                            Forms\Components\FileUpload::make('site_favicon')
                                ->label('Site favicon (56x56)')
                                ->required()
                                ->previewable()
                                ->imagePreviewHeight('76')
                                ->avatar()
                                ->preserveFilenames()
                                ->required(),
                            Forms\Components\TextInput::make('site_name')
                                ->label('Site name')
                                ->required(),
                            Forms\Components\TextInput::make('site_description')
                                ->label('Site description')
                                ->required(),
                            Forms\Components\TextInput::make('site_keywords')
                                ->label('Site keywords'),
                            Forms\Components\TextInput::make('site_phone')
                                ->label('Site phone'),
                            Forms\Components\TextInput::make('site_email')
                                ->label('Site email'),
                            Forms\Components\TextInput::make('site_address')
                                ->label('Site address'),
                            Forms\Components\TextInput::make('site_footer')
                                ->label('Site footer'),
                            Forms\Components\TextInput::make('site_copyright')
                                ->label('Copyright notice'),
                        ]),
                    Forms\Components\Tabs\Tab::make('Social Media')
                        ->schema([
                            Forms\Components\TextInput::make('site_facebook')
                                ->label('Site facebook')
                                ->prefixIcon('heroicon-o-link'),
                            Forms\Components\TextInput::make('site_twitter')
                                ->label('Site twitter')
                                ->prefixIcon('heroicon-o-link'),
                            Forms\Components\TextInput::make('site_instagram')
                                ->label('Site instagram')
                                ->prefixIcon('heroicon-o-link'),
                            Forms\Components\TextInput::make('site_youtube')
                                ->label('Site youtube')
                                ->prefixIcon('heroicon-o-link'),
                            Forms\Components\TextInput::make('site_linkedin')
                                ->label('Site linkedin')
                                ->prefixIcon('heroicon-o-link'),
                            Forms\Components\TextInput::make('site_google')
                                ->label('Site google')
                                ->prefixIcon('heroicon-o-link'),
                        ]),
                    Forms\Components\Tabs\Tab::make('Custom JS/CSS')
                        ->schema([
                            CodeEditor::make('custom_css'),
                            CodeEditor::make('custom_js'),
                        ]),
                ])
            ])->columns(1);
    }
}
