<?php

namespace App\Filament\Resources\System\EmailTemplateResource\Pages;

use App\Filament\Resources\System\EmailTemplateResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListEmailTemplates extends ListRecords
{
    use ListRecords\Concerns\Translatable;
    protected static string $resource = EmailTemplateResource::class;
    protected $createMailableHelper;

    protected function getActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
