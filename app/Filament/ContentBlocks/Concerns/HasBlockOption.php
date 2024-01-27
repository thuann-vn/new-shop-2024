<?php

namespace App\Filament\ContentBlocks\Concerns;

trait HasBlockOption
{
    public ?string $containerWidth;
    public ?string $customClasses;

    protected function setBlockOption(array $blockData): void
    {
        $this->containerWidth = $blockData['container_width'] ?? null;
        $this->customClasses = $blockData['custom_classes'] ?? null;
    }
}
