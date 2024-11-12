<?php

namespace App\Filament\Resources\Shop\CategoryResource\Pages;

use App\Filament\Resources\Shop\CategoryResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditCategory extends EditRecord
{
    use EditRecord\Concerns\Translatable;

    protected static string $resource = CategoryResource::class;

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
            $this->getSaveFormAction()
                ->submit(null)
                ->action('save'),
        ];
    }
}
