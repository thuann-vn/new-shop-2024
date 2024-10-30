<?php

namespace App\Filament\Resources\Shop\BrandResource\Pages;

use App\Filament\Resources\Shop\BrandResource;
use Filament\Actions\LocaleSwitcher;
use Filament\Resources\Pages\CreateRecord;

class CreateBrand extends CreateRecord
{
    use CreateRecord\Concerns\Translatable;
    protected static string $resource = BrandResource::class;

    protected function getActions(): array
    {
        if (count(getAvailableLanguages()) > 1) {
            return [
                LocaleSwitcher::make(),
                $this->getCreateFormAction()
                    ->submit(null)
                    ->action('create'),
            ];
        }

        return [
            $this->getCreateFormAction()
                ->submit(null)
                ->action('create'),
        ];
    }
}
