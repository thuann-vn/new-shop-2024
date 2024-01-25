<?php

namespace App\Filament\ContentBlocks;

use App\Models\Slider;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Spatie\MediaLibrary\HasMedia;
use Statikbe\FilamentFlexibleContentBlocks\ContentBlocks\AbstractContentBlock;
use Statikbe\FilamentFlexibleContentBlocks\ContentBlocks\Concerns\HasBackgroundColour;
use Statikbe\FilamentFlexibleContentBlocks\ContentBlocks\Concerns\HasBlockStyle;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\Blocks\BackgroundColourField;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\Blocks\BlockStyleField;
use Statikbe\FilamentFlexibleContentBlocks\Models\Contracts\HasContentBlocks;

class TwoColumnsBannerBlock extends AbstractContentBlock
{
    use HasBackgroundColour;
    use HasBlockStyle;

    public ?string $sliderId;

    /**
     * Create a new component instance.
     */
    public function __construct(HasContentBlocks & HasMedia $record, ?array $blockData)
    {
        parent::__construct($record, $blockData);

        $this->sliderId = $blockData['slider_id'] ?? null;
        $this->setBlockStyle($blockData);
    }

    public static function getNameSuffix(): string
    {
        return 'text';
    }

    public static function getIcon(): string
    {
        return 'heroicon-o-bars-3-bottom-left';
    }

    /**
     * {@inheritDoc}
     */
    protected static function makeFilamentSchema(): array | \Closure
    {
        return [
            Select::make('slider_id')
                ->label(static::getFieldLabel('slider_id'))
                ->options(Slider::where('is_visible', true)->pluck('name', 'id')->toArray())
                ->required(),
        ];
    }

    public function getSearchableContent(): array
    {
        $searchable = [];

        return $searchable;
    }

    public static function getName(): string
    {
        return 'Two Columns Banner';
    }

    public static function getLabel(): string
    {
        return 'Two Columns Banner';
    }

    public static function getFieldLabel(string $field): string
    {
        return 'Two Columns Banner';
    }

    public function render()
    {
        // TODO: Implement render() method.
    }
}
