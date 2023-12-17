<?php

namespace App\Filament\Resources\Blog\PageResource\Pages;

use App\Filament\Resources\Blog\PageResource;
use Filament\Resources\Pages\CreateRecord;
use Filament\Resources\Pages\CreateRecord\Concerns\Translatable;

class CreatePage extends CreateRecord
{
    use Translatable;

    protected static string $resource = PageResource::class;
}
