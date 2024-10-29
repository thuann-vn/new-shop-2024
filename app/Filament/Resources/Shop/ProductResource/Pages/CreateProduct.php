<?php

namespace App\Filament\Resources\Shop\ProductResource\Pages;

use App\Filament\Resources\Shop\ProductResource;
use Filament\Actions\CreateAction;
use Filament\Actions\DeleteAction;
use Filament\Actions\LocaleSwitcher;
use Filament\Resources\Pages\CreateRecord;
use Noxo\FilamentActivityLog\Extensions\LogCreateRecord;

class CreateProduct extends CreateRecord
{
    use CreateRecord\Concerns\Translatable;
    use LogCreateRecord;

    protected static string $resource = ProductResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        unset($data['categories']);

        return $data;
    }

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
