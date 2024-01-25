<?php

namespace App\Filament\ContentBlocks;

use App\Models\Page;
use Filament\Forms\Components\Repeater;
use Spatie\MediaLibrary\HasMedia;
use Statikbe\FilamentFlexibleContentBlocks\ContentBlocks\AbstractContentBlock;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\ContentBlocksField;
use Statikbe\FilamentFlexibleContentBlocks\FilamentFlexibleBlocksConfig;
use Statikbe\FilamentFlexibleContentBlocks\Models\Contracts\HasContentBlocks;

class GridBlock extends AbstractContentBlock
{
    public ?array $columns;

    /**
     * Create a new component instance.
     */
    public function __construct(HasContentBlocks & HasMedia $record, ?array $blockData)
    {
        parent::__construct($record, $blockData);

        $this->columns = $this->createBlocks($blockData['columns'] ?? []);
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
        $blockClasses = FilamentFlexibleBlocksConfig::getDefaultFlexibleBlocks();
        $blockClassIndex = collect($blockClasses)->mapWithKeys(fn ($item, $key) => [$item::getName() => $item]);
        $blocks = [];
        foreach ($content_blocks as $blockData) {
            $blockData = $blockData['content_blocks'][0];
            if ($blockClassIndex->has($blockData['type'])) {
                $blockClass = $blockClassIndex->get($blockData['type']);
                $block = new $blockClass($this->record, $blockData['data']);
                $block->name = $block->getName();
                $blocks[] = $block;
            }
        }

        return $blocks;
    }
}
