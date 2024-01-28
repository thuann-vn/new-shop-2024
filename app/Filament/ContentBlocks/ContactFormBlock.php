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

class ContactFormBlock extends AbstractContentBlock
{
    use HasBlockOption;

    public ?string $title;
    public ?string $content;


    /**
     * Create a new component instance.
     */
    public function __construct(HasContentBlocks & HasMedia $record, ?array $blockData)
    {
        parent::__construct($record, $blockData);
        $this->title = $blockData['title'] ?? null;
        $this->content = $blockData['content'] ?? null;
        $this->setBlockOption($blockData);
    }

    public static function getNameSuffix(): string
    {
        return 'contact_form';
    }

    public static function getIcon(): string
    {
        return 'heroicon-o-question-mark-circle';
    }

    /**
     * {@inheritDoc}
     */
    protected static function makeFilamentSchema(): array | \Closure
    {
        return [
            TextInput::make('title')
                ->label('Title'),
            RichEditor::make('content'),
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
        return 'Contact Form';
    }

    public static function getLabel(): string
    {
        return 'Contact Form';
    }

    public static function getFieldLabel(string $field): string
    {
        return 'Contact Form';
    }

    public function render()
    {
        // TODO: Implement render() method.
    }
}
