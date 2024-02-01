<?php

namespace App\Forms\Components;

use Filament\Forms;
use Illuminate\Database\Eloquent\Model;

class AddressForm extends Forms\Components\Field
{
    protected string $view = 'filament-forms::components.group';

    public $relationship = null;

    public function relationship(string | callable $relationship): static
    {
        $this->relationship = $relationship;

        return $this;
    }

    public function saveRelationships(): void
    {
        $state = $this->getState();
        $record = $this->getRecord();
        $relationship = $record?->{$this->getRelationship()}();

        unset($state['pivot']);

        if ($relationship === null) {
            return;
        } elseif ($address = $relationship->first()) {
            $address->update($state);
        } else {
            $relationship->updateOrCreate($state);
        }
        $record->touch();
    }

    public function getChildComponents(): array
    {
        return [
            Forms\Components\TextInput::make('street')
                ->label('Street address')
                ->maxLength(255),
            Forms\Components\Grid::make(3)
                ->schema([
                    Forms\Components\TextInput::make('province')
                        ->label('Province/City')
                        ->required(),
                    Forms\Components\TextInput::make('district')
                        ->label('District')
                        ->required(),
                    Forms\Components\TextInput::make('ward')
                        ->label('Ward'),
                ]),
        ];
    }

    protected function setUp(): void
    {
        parent::setUp();

        $this->afterStateHydrated(function (AddressForm $component, ?Model $record) {
            $address = $record?->getRelationValue($this->getRelationship())->first();

            $component->state($address ? $address->toArray() : [
                'country' => null,
                'street' => null,
                'city' => null,
                'state' => null,
                'zip' => null,
            ]);
        });

        $this->dehydrated(false);
    }

    public function getRelationship(): string
    {
        return $this->evaluate($this->relationship) ?? $this->getName();
    }
}
