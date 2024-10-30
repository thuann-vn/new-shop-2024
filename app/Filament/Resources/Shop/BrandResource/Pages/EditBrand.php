<?php

namespace App\Filament\Resources\Shop\BrandResource\Pages;

use App\Filament\Resources\Shop\BrandResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditBrand extends EditRecord
{
    use EditRecord\Concerns\Translatable;
    protected static string $resource = BrandResource::class;

    protected function getActions(): array
    {
        if (count(getAvailableLanguages()) > 1) {
            return [
                Actions\LocaleSwitcher::make(),
                Actions\DeleteAction::make(),
                $this->getSaveFormAction()
                    ->submit(null)
                    ->action('save'),
            ];
        }
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
