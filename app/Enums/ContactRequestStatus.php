<?php

namespace App\Enums;

use Filament\Support\Contracts\HasColor;
use Filament\Support\Contracts\HasLabel;

enum ContactRequestStatus: string implements HasColor, HasLabel
{
    case New = 'new';
    case Processing = 'processing';
    case Completed = 'completed';

    public function getLabel(): string
    {
        return match ($this) {
            self::New => 'New',
            self::Processing => 'Processing',
            self::Completed => 'Completed'
        };
    }

    public function getColor(): string | array | null
    {
        return match ($this) {
            self::New => 'gray',
            self::Processing => 'warning',
            self::Completed => 'success',
        };
    }
}
