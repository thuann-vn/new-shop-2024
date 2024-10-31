<?php

namespace App\Filament\Resources\Shop\CollectionResource\Pages;

use App\Filament\Resources\Shop\CollectionResource;
use Filament\Actions\LocaleSwitcher;
use Filament\Resources\Pages\CreateRecord;

class CreateCollection extends CreateRecord
{
    use CreateRecord\Concerns\Translatable;
    protected static string $resource = CollectionResource::class;

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
