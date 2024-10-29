<x-filament-forms::field-wrapper
    :id="$getId()"
    :label="$getLabel()"
    :label-sr-only="$isLabelHidden()"
    :helper-text="$getHelperText()"
    :hint="$getHint()"
    :hint-icon="$getHintIcon()"
    :required="$isRequired()"
    :state-path="$getStatePath()"
    class="filament-navigation"
>
    <div wire:key="navigation-items-wrapper">
        <div
            class="space-y-2"
            x-data="navigationSortableContainer({
                statePath: @js($getStatePath()),
                locale: @js($locale),
            })"
            data-sortable-container
        >
            @php
                $currentState = $getState();
                if(!is_array($currentState)) $currentState = [];
                //Sort by position
                uasort($currentState, function($a, $b) {
                    return @$a['display_order'] <=> @$b['display_order'];
                });
            @endphp
            @forelse($currentState as $uuid => $item)
                <x-filament-navigation::nav-item
                    :statePath="$getStatePath() . '.' . $uuid"
                    :item="$item"
                    :locale="$locale"
                />
            @empty
                <div @class([
                    'w-full bg-white rounded-lg border border-gray-300 px-3 py-2 text-left',
                    'dark:bg-gray-700 dark:border-gray-600',
                ])>
                    {{__('filament-navigation::filament-navigation.items.empty')}}
                </div>
            @endforelse
        </div>
    </div>

    <div class="flex justify-end">
        <x-filament::button wire:click="cloneItems('{{$locale}}')" class="mr-2" type="button" size="sm" color="danger">
            Clone to all locales
        </x-filament::button>
        <x-filament::button wire:click="createItem('{{$locale}}')" type="button" size="sm">
            {{__('filament-navigation::filament-navigation.items.add-item')}}
        </x-filament::button>
    </div>
</x-filament-forms::field-wrapper>
