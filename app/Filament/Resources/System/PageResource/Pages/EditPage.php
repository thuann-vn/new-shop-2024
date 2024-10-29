<?php

namespace App\Filament\Resources\System\PageResource\Pages;

use App\Filament\Resources\System\PageResource;
use Filament\Actions\DeleteAction;
use Filament\Actions\LocaleSwitcher;
use Filament\Resources\Pages\EditRecord;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Resource\Pages\Actions\CopyContentBlocksToLocalesAction;

class EditPage extends EditRecord
{
    use EditRecord\Concerns\Translatable;

    protected static string $resource = PageResource::class;

    protected function getActions(): array
    {
        return [
            CopyContentBlocksToLocalesAction::make(),
            LocaleSwitcher::make(),
            DeleteAction::make(),
        ];
    }
}
