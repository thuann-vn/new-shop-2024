<?php

namespace App\Forms\Components;

use App\Models\District;
use App\Models\Province;
use App\Models\Ward;
use Filament\Forms;
use Illuminate\Database\Eloquent\Model;
use Squire\Models\Country;

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
                    Forms\Components\Select::make('province_code')
                        ->label('Province/City')
                        ->live()
                        ->options(Province::all()->pluck('full_name', 'code')->toArray())
                        ->afterStateUpdated(function (Forms\Set $set) {
                            $set('district_code', null);
                            $set('ward_code', null);
                        })
                        ->required()
                    ,
                    Forms\Components\Select::make('district_code')
                        ->options(function (Forms\Get $get): array {
                            return District::where('province_code', $get('province_code'))->orderBy('display_order')->orderBy('name')->pluck('full_name', 'code')->toArray();
                        })
                        ->afterStateUpdated(function (Forms\Set $set) {
                          $set('ward_code', null);
                        })
                        ->live()
                        ->label('District')
                        ->required(),
                    Forms\Components\Select::make('ward_code')
                        ->options(function (Forms\Get $get): array {
                            return Ward::where('district_code', $get('district_code'))->orderBy('name')->pluck('full_name', 'code')->toArray();
                        })
                        ->live()
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
