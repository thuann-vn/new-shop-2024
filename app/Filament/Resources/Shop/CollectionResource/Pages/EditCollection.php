<?php

namespace App\Filament\Resources\Shop\CollectionResource\Pages;

use App\Filament\Resources\Shop\CollectionResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditCollection extends EditRecord
{
    use EditRecord\Concerns\Translatable;

    protected static string $resource = CollectionResource::class;


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
