<?php

namespace App\Filament\Resources\Shop\ProductResource\Widgets;

use App\Filament\Resources\Shop\ProductResource\Pages\ListProducts;
use Filament\Widgets\Concerns\InteractsWithPageTable;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class ProductStats extends BaseWidget
{
    use InteractsWithPageTable;

    protected static ?string $pollingInterval = null;

    protected function getTablePage(): string
    {
        return ListProducts::class;
    }

    protected function getStats(): array
    {
        return [
            Stat::make(__('Total Products'), $this->getPageTableQuery()->count()),
            Stat::make(__('Product Inventory'), $this->getPageTableQuery()->sum('qty')),
            Stat::make(__('Average price'), number_format($this->getPageTableQuery()->avg('price'), 0)),
        ];
    }
}
