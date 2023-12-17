<?php

namespace App\Filament\Pages;

use Noxo\FilamentActivityLog\Pages\ListActivities;

class ActivityLog extends ListActivities
{
    // protected bool $isCollapsible = true;

    // protected bool $isCollapsed = false;

    // public function getTitle(): string
    // {
    //     return __('filament-activity-log::activities.title');
    // }
    public static function shouldRegisterNavigation(): bool
    {
        return auth()->check();
    }

     public static function getNavigationLabel(): string
     {
         return __('filament-activity-log::activities.title');
     }

     public static function getNavigationGroup(): ?string
     {
         return __('System');
     }

}
