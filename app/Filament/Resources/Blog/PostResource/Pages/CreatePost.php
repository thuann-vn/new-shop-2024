<?php

namespace App\Filament\Resources\Blog\PostResource\Pages;

use App\Filament\Resources\Blog\PostResource;
use Filament\Actions\LocaleSwitcher;
use Filament\Resources\Pages\CreateRecord;

class CreatePost extends CreateRecord
{
    use CreateRecord\Concerns\Translatable;
    protected static string $resource = PostResource::class;

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
