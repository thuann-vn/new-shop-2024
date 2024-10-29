<?php

namespace App\Filament\Resources\System\NavigationResource\Traits;

use App\Models\Language;
use Filament\Actions\Action;
use Filament\Forms\ComponentContainer;
use Filament\Forms\Components\Component;
use Filament\Forms\Components\Group;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Get;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use RyanChandler\FilamentNavigation\FilamentNavigation;

trait HandlesNavigationBuilder
{
    public $mountedItem;

    public $mountedItemData = [];

    public $mountedChildTarget;

    public $locale;

    public function sortNavigation(string $targetStatePath, array $targetItemsStatePaths, ?string $locale)
    {
        $items = [];
        foreach ($targetItemsStatePaths as $index => $targetItemStatePath) {
            $item = data_get($this, $targetItemStatePath);
            $uuid = Str::afterLast($targetItemStatePath, '.');
            $item['display_order'] = $index;
            $items[$uuid] = $item;
        }
        data_set($this, $targetStatePath, $items);
    }

    public function addChild(string $statePath, string $locale)
    {
        $this->locale = $locale;
        $this->mountedChildTarget = $statePath;

        $this->mountAction('item');
    }

    public function removeItem(string $statePath, string $locale)
    {
        $uuid = Str::afterLast($statePath, '.');

        $parentPath = Str::beforeLast($statePath, '.');
        $parent = data_get($this, $parentPath);

        data_set($this, $parentPath, Arr::except($parent, $uuid));
    }

    public function editItem(string $statePath, string $locale)
    {
        $this->locale = $locale;
        $this->mountedItem = $statePath;
        $this->mountedItemData = Arr::except(data_get($this, $statePath), 'children');

        $this->mountAction('item');
    }

    public function createItem($locale)
    {
        $this->locale = $locale;
        $this->mountedItem = null;
        $this->mountedItemData = [];
        $this->mountedActionData = [];
        $this->mountAction('item');
    }

    public function cloneItems(string $org_locale)
    {
        $this->locale = $org_locale;
        $this->mountAction('clone');
    }

    protected function getActions(): array
    {
        return [
            Action::make('item')
                ->mountUsing(function (ComponentContainer $form) {
                    if (! $this->mountedItem) {
                        return;
                    }

                    $form->fill($this->mountedItemData);
                })
                ->view('filament-navigation::hidden-action')
                ->form([
                    TextInput::make('label')
                        ->label(__('filament-navigation::filament-navigation.items-modal.label'))
                        ->required(),
                    Select::make('type')
                        ->label(__('filament-navigation::filament-navigation.items-modal.type'))
                        ->options(function () {
                            $types = FilamentNavigation::get()->getItemTypes();

                            return array_combine(array_keys($types), Arr::pluck($types, 'name'));
                        })
                        ->afterStateUpdated(function ($state, Select $component): void {
                            if (! $state) {
                                return;
                            }

                            // NOTE: This chunk of code is a workaround for Livewire not letting
                            //       you entangle to non-existent array keys, which wire:model
                            //       would normally let you do.
                            $component
                                ->getContainer()
                                ->getComponent(fn (Component $component) => $component instanceof Group)
                                ->getChildComponentContainer()
                                ->fill();
                        })
                        ->reactive(),
                    Group::make()
                        ->statePath('data')
                        ->whenTruthy('type')
                        ->schema(function (Get $get) {
                            $type = $get('type');

                            return FilamentNavigation::get()->getItemTypes()[$type]['fields'] ?? [];
                        }),
                    Group::make()
                        ->statePath('data')
                        ->visible(fn (Component $component) => $component->evaluate(FilamentNavigation::get()->getExtraFields()) !== [])
                        ->schema(function (Component $component) {
                            return FilamentNavigation::get()->getExtraFields();
                        }),
                ])
                ->modalWidth('md')
                ->action(function (array $data) {
                    if ($this->mountedItem) {
                        data_set($this, $this->mountedItem, array_merge(data_get($this, $this->mountedItem), $data));

                        $this->mountedItem = null;
                        $this->mountedItemData = [];
                    } elseif ($this->mountedChildTarget) {
                        $children = data_get($this, $this->mountedChildTarget . '.children', []);
                        $data['display_order'] = count($children);
                        $children[(string) Str::uuid()] = [
                            ...$data,
                            ...['children' => []],
                        ];

                        data_set($this, $this->mountedChildTarget . '.children', $children);

                        $this->mountedChildTarget = null;
                    } else {
                        $data['display_order'] = count($this->data['items'][$this->locale] ?? []);
                        $this->data['items'][$this->locale][(string) Str::uuid()] = [
                            ...$data,
                            ...['children' => []],
                        ];
                    }

                    $this->mountedActionData = [];
                })
                ->modalButton(__('filament-navigation::filament-navigation.items-modal.btn'))
                ->label(__('filament-navigation::filament-navigation.items-modal.title')),

            Action::make('clone')
                ->view('filament-navigation::hidden-action')
                ->action(function () {
                    $locales = Language::whereIsVisible(true)->get()->pluck('code')->toArray();
                    foreach ($locales as $locale) {
                        if ($locale == $this->locale) {
                            continue;
                        }
                        $items = data_get($this, 'data.items.' . $this->locale);
                        data_set($this, 'data.items.' . $locale, $items);
                    }
                })
                ->requiresConfirmation(),
        ];
    }
}
