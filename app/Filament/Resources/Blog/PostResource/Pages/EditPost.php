<?php

namespace App\Filament\Resources\Blog\PostResource\Pages;

use App\Filament\Resources\Blog\PostResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditPost extends EditRecord
{
    use EditRecord\Concerns\Translatable;
    protected static string $resource = PostResource::class;

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
