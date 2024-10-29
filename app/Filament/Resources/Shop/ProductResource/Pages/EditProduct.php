<?php

namespace App\Filament\Resources\Shop\ProductResource\Pages;

use App\Filament\Resources\Shop\ProductResource;
use Filament\Actions;
use Filament\Actions\DeleteAction;
use Filament\Actions\LocaleSwitcher;
use Filament\Resources\Pages\EditRecord;
use Noxo\FilamentActivityLog\Extensions\LogEditRecord;

class EditProduct extends EditRecord
{
    use EditRecord\Concerns\Translatable;
    use LogEditRecord;

    protected static string $resource = ProductResource::class;

    protected function getActions(): array
    {
        if (count(getAvailableLanguages()) > 1) {
            return [
                LocaleSwitcher::make(),
                DeleteAction::make(),
            ];
        }

        return [
            Actions\DeleteAction::make(),
        ];
    }

    protected function mutateFormDataBeforeSave(array $data): array
    {
        unset($data['categories']);

        return $data;
    }
}
