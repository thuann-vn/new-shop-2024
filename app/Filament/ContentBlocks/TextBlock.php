<?php

namespace App\Filament\ContentBlocks;

use App\Filament\ContentBlocks\Concerns\HasBlockOption;
use App\Filament\Form\Fields\Blocks\BlockOptionField;
use App\Models\Slider;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Spatie\MediaLibrary\HasMedia;
use Statikbe\FilamentFlexibleContentBlocks\ContentBlocks\AbstractContentBlock;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\Blocks\BlockStyleField;
use Statikbe\FilamentFlexibleContentBlocks\Models\Contracts\HasContentBlocks;

class TextBlock extends AbstractContentBlock
{
    use HasBlockOption;

    public ?string $content;

    public ?string $title;


    /**
     * Create a new component instance.
     */
    public function __construct(HasContentBlocks & HasMedia $record, ?array $blockData)
    {
        parent::__construct($record, $blockData);
        $this->content = $blockData['content'] ?? null;
        $this->title = $blockData['title'] ?? null;
        $this->setBlockOption($blockData);
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
            TextInput::make('title')
                ->label('Title'),
            RichEditor::make('content')
                ->label('Content')
                ->required(),
            BlockOptionField::create(static::class),
        ];
    }

    public function getSearchableContent(): array
    {
        $searchable = [];

        return $searchable;
    }

    public static function getName(): string
    {
        return 'Text';
    }

    public static function getLabel(): string
    {
        return 'Text';
    }

    public static function getFieldLabel(string $field): string
    {
        return 'Text';
    }

    public function render()
    {
        // TODO: Implement render() method.
    }
}
