<?php

namespace App\Filament\Resources\System\NavigationResource\Pages;

use App\Filament\Resources\System\NavigationResource\Traits\HandlesNavigationBuilder;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use RyanChandler\FilamentNavigation\FilamentNavigation;

class EditNavigation extends EditRecord
{
    use HandlesNavigationBuilder;

    public static function getResource(): string
    {
        return FilamentNavigation::get()->getResource();
    }

    protected function getHeaderActions(): array
    {
        return [
            ...$this->getActions(),
//            Actions\LocaleSwitcher::make(),
            // ...
        ];
    }
}
