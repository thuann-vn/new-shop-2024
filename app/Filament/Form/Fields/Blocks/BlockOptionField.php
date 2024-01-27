<?php

namespace App\Filament\Form\Fields\Blocks;

use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Statikbe\FilamentFlexibleContentBlocks\ContentBlocks\AbstractContentBlock;

class BlockOptionField extends Grid
{
    /**
     * @param  class-string<AbstractContentBlock>  $blockClass
     */
    public static function create(string $blockClass, bool $required = false): static
    {
        return static::make(2)
            ->schema([
                Select::make('container_width')
                    ->label('Container width')
                    ->default('container')
                    ->options([
                        'container' => 'Container',
                        'container-fluid' => 'Container fluid',
                    ]),
                TextInput::make('custom_classes')
                    ->label('Block classes')
                    ->maxLength(255),
            ]);

    }
}
