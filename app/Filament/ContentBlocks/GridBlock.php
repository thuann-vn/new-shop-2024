<?php

namespace App\Filament\ContentBlocks;

use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\TextInput;
use Spatie\MediaLibrary\HasMedia;
use Statikbe\FilamentFlexibleContentBlocks\ContentBlocks\AbstractContentBlock;
use Statikbe\FilamentFlexibleContentBlocks\ContentBlocks\Concerns\HasBackgroundColour;
use Statikbe\FilamentFlexibleContentBlocks\ContentBlocks\Concerns\HasBlockStyle;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\Blocks\BackgroundColourField;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\Blocks\BlockStyleField;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\Blocks\GridColumnsField;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\ContentBlocksField;
use Statikbe\FilamentFlexibleContentBlocks\FilamentFlexibleBlocksConfig;
use Statikbe\FilamentFlexibleContentBlocks\Models\Contracts\HasContentBlocks;

class GridBlock extends AbstractContentBlock
{
    use HasBackgroundColour;
    use HasBlockStyle;

    public array $columns = [];

    public ?string $title;

    public int $gridColumns = 2;

    /**
     * Create a new component instance.
     */
    public function __construct(HasContentBlocks & HasMedia $record, ?array $blockData)
    {
        parent::__construct($record, $blockData);

        $this->columns = $this->createBlocks($blockData['columns'] ?? []);
        $this->title = $blockData['title'] ?? null;
        $this->backgroundColourType = $blockData['background_colour'] ?? null;
        $this->gridColumns = $blockData['grid_columns'] ?? null;
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
            TextInput::make('title')
                ->label('Title')
                ->maxLength(255),
            Grid::make(2)->schema([
                GridColumnsField::create(static::class, true),
                BackgroundColourField::create(static::class),
                BlockStyleField::create(static::class),
            ]),
            Repeater::make('columns')
                ->hiddenLabel()
                ->collapsible()
                ->itemLabel('Column')
                ->schema(
                    [
                        ContentBlocksField::create()->hiddenLabel(),
                    ]
                ),
        ];
    }

    public function getSearchableContent(): array
    {
        $searchable = [];

        return $searchable;
    }

    public static function getName(): string
    {
        return 'Grid';
    }

    public static function getLabel(): string
    {
        return 'Grid';
    }

    public static function getFieldLabel(string $field): string
    {
        return 'Grid';
    }

    public function render()
    {
        // TODO: Implement render() method.
    }

    /**
     * Transforms the JSON block data into content block components that can be rendered.
     *
     * @return array<AbstractContentBlock>
     */
    private function createBlocks($content_blocks): array
    {
        $columns = [];
        $blockClasses = FilamentFlexibleBlocksConfig::getDefaultFlexibleBlocks();
        $blockClassIndex = collect($blockClasses)->mapWithKeys(fn ($item, $key) => [$item::getName() => $item]);
        foreach ($content_blocks as $index => $columnBlocks) {
            $columns[$index] = [];
            foreach ($columnBlocks['content_blocks'] as $blockData) {
                if ($blockClassIndex->has($blockData['type'])) {
                    $blockClass = $blockClassIndex->get($blockData['type']);
                    $block = new $blockClass($this->record, $blockData['data']);
                    $block->name = $block->getName();
                    $columns[$index][] = $block;
                }
            }
        }

        return $columns;
    }
}
