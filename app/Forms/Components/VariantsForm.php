<?php

namespace App\Forms\Components;

use Filament\Forms\Components\Field;

class VariantsForm extends Field
{
    protected string $view = 'forms.components.variants-form';

    public function generateVariants(){
        $model = $this->getModel();
        $combinations = $this->getState();
        $variants = [];
        foreach ($combinations as $index => $combination) {
            $variant = [
                'id' => $index,
                'name' => join('/', array_values($combination)),
                'sku' => '',
                'price' => 0,
            ];
            $variants[] = $variant;
        }
        return $variants;
    }
}
