<?php

namespace App\Filament\ContentBlocks;

use App\Models\Shop\Category;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Spatie\MediaLibrary\HasMedia;
use Statikbe\FilamentFlexibleContentBlocks\ContentBlocks\AbstractContentBlock;
use Statikbe\FilamentFlexibleContentBlocks\ContentBlocks\Concerns\HasBackgroundColour;
use Statikbe\FilamentFlexibleContentBlocks\ContentBlocks\Concerns\HasBlockStyle;
use Statikbe\FilamentFlexibleContentBlocks\Models\Contracts\HasContentBlocks;

class CategoriesBlock extends AbstractContentBlock
{
    use HasBackgroundColour;
    use HasBlockStyle;


    public ?string $title;
    public ?array $categoryIds;
    public ?array $categories;

    /**
     * Create a new component instance.
     */
    public function __construct(HasContentBlocks & HasMedia $record, ?array $blockData)
    {
        parent::__construct($record, $blockData);

        $this->title = $blockData['title'] ?? null;
        $this->categoryIds = $blockData['category_ids'] ?? null;
        $this->categories = Category::whereIn('id', $this->categoryIds)->get()->toArray();
        $this->setBlockStyle($blockData);
    }

    public static function getNameSuffix(): string
    {
        return '';
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
            Select::make('category_ids')
                ->multiple()
                ->minItems(1)
                ->label(static::getFieldLabel('category_ids'))
                ->options(Category::where('is_visible', true)->pluck('name', 'id')->toArray())
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
        return 'Categories';
    }

    public static function getLabel(): string
    {
        return 'Categories';
    }

    public static function getFieldLabel(string $field): string
    {
        return 'Categories';
    }

    public function render()
    {
        // TODO: Implement render() method.
    }
}
