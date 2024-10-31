<?php

namespace App\Filament\ContentBlocks;

use App\Http\Resources\CollectionResource;
use Filament\Forms\Components\Select;
use Spatie\MediaLibrary\HasMedia;
use Statikbe\FilamentFlexibleContentBlocks\ContentBlocks\AbstractContentBlock;
use Statikbe\FilamentFlexibleContentBlocks\ContentBlocks\Concerns\HasBackgroundColour;
use Statikbe\FilamentFlexibleContentBlocks\ContentBlocks\Concerns\HasBlockStyle;
use Statikbe\FilamentFlexibleContentBlocks\Models\Contracts\HasContentBlocks;

class ProductCollectionBlock extends AbstractContentBlock
{
    use HasBackgroundColour;
    use HasBlockStyle;

    public ?string $collectionId;

    public ?CollectionResource $collection;

    /**
     * Create a new component instance.
     */
    public function __construct(HasContentBlocks & HasMedia $record, ?array $blockData)
    {
        parent::__construct($record, $blockData);
        $this->collectionId = $blockData['collection_id'] ?? null;
        $this->collection = new CollectionResource(\App\Models\Shop\Collection::where('id', $this->collectionId)->first());
        $this->setBlockStyle($blockData);
    }

    public static function getNameSuffix(): string
    {
        return 'text';
    }

    public static function getIcon(): string
    {
        return 'heroicon-o-tag';
    }

    /**
     * {@inheritDoc}
     */
    protected static function makeFilamentSchema(): array | \Closure
    {
        return [
            Select::make('collection_id')
                ->label(static::getFieldLabel('collection_id'))
                ->options(\App\Models\Shop\Collection::whereIsVisible(true)->pluck('name', 'id')->toArray())
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
        return 'Product Collection';
    }

    public static function getLabel(): string
    {
        return 'Product Collection';
    }

    public static function getFieldLabel(string $field): string
    {
        return 'Product Collection';
    }

    public function render()
    {
        // TODO: Implement render() method.
    }
}
