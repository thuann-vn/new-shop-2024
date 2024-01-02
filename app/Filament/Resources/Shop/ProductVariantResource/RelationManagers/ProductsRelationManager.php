<?php

namespace App\Filament\Resources\Shop\ProductVariantResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Model;

class ProductsRelationManager extends RelationManager
{
  protected static string $relationship = 'variants';
  protected static bool $isLazy = false;

  public static function canViewForRecord(Model $ownerRecord, string $pageClass): bool
  {
    return $ownerRecord->productAttributes->count() > 0;
  }

  public function form(Form $form): Form
  {
    $schema = [];
    if (empty($form->getRecord())) {
      foreach ($this->ownerRecord->productAttributes as $productAttribute) {
        $schema[] = Forms\Components\TextInput::make('attributes.' . $productAttribute->id)
            ->label($productAttribute->pivot->attribute->name)
            ->required()
            ->rules([
                fn(Forms\Get $get): \Closure => function (string $attribute, $value, \Closure $fail) use ($get) {
                  //Check if existing variant has same attribute option
                  $attributes = $get('attributes');
                  $code = [
                      $this->ownerRecord->slug
                  ];
                  foreach ($attributes as $key => $attributeOptionId) {
                    $attributeOption = \App\Models\Shop\AttributeOption::where([
                        'shop_attribute_id' => $key,
                        'value' => $attributeOptionId
                    ])->first();
                    if ($attributeOption) {
                      $code[] = $attributeOption->value;
                    }
                  }
                  $productVariant = \App\Models\Shop\ProductVariant::where('code', implode('-', $code))->first();
                  if ($productVariant) {
                    $fail("The variant with the same attribute option already exists.");
                  }
                },
            ]);
      }
    }

    $schema[] = Forms\Components\TextInput::make('price')
        ->currencyMask(thousandSeparator: ',', decimalSeparator: '.', precision: 2)
        ->label('Price')
        ->required();

    $schema[] = Forms\Components\TextInput::make('old_price')
        ->currencyMask(thousandSeparator: ',', decimalSeparator: '.', precision: 2)
        ->label('Old Price')
        ->required();

    $schema[] = Forms\Components\TextInput::make('sku')
        ->label('SKU')
        ->required();

    $schema[] = Forms\Components\TextInput::make('qty')
        ->type('number')
        ->numeric()
        ->label('Stock')
        ->required();

    $schema[] = Forms\Components\Checkbox::make('is_visible')
        ->label('Is Visible')
        ->required();

    return $form
        ->schema($schema);
  }

  public function table(Table $table): Table
  {
    return $table
        ->recordTitleAttribute('name')
        ->columns([
            Tables\Columns\TextColumn::make('name'),
            Tables\Columns\TextColumn::make('sku'),
            Tables\Columns\TextColumn::make('price'),
            Tables\Columns\TextColumn::make('qty'),
        ])
        ->filters([
          //
        ])
        ->headerActions([
            \Filament\Tables\Actions\CreateAction::make()
                ->mutateFormDataUsing(function ($data) {
                  $data['shop_product_id'] = $this->ownerRecord->id;
                  return $data;
                })
                ->using(function (array $data, string $model): Model {
                  $attributes = $data['attributes'] ?? [];
                  $name = [];
                  foreach ($attributes as $key => $value) {
                    if (is_null($value)) {
                      unset($attributes[$key]);
                    }

                    //Create attribute option if not exists
                    $attributeOption = \App\Models\Shop\AttributeOption::firstOrCreate([
                        'shop_attribute_id' => $key,
                        'value' => $value
                    ]);

                    $attributes[$key] = $attributeOption->id;
                    $name[] = $attributeOption->value;
                  }
                  unset($data['attributes']);
                  $data['code'] = implode('-', array_merge([$this->ownerRecord->slug], $name));
                  $data['name'] = implode('/', $name);
                  $createdData = $model::create($data);

                  //Create product variant attribute options
                  $productVariantAttributeOptions = [];
                  foreach ($attributes as $key => $value) {
                    $productVariantAttributeOptions[] = [
                        'shop_attribute_id' => $key,
                        'shop_attribute_option_id' => $value,
                        'shop_product_variant_id' => $createdData->id
                    ];
                  }
                  \App\Models\Shop\ProductVariantAttributeOption::insert($productVariantAttributeOptions);
                  return $createdData;
                })
        ])
        ->actions([
            Tables\Actions\EditAction::make(),
            Tables\Actions\DeleteAction::make(),
        ])
        ->bulkActions([
            Tables\Actions\BulkActionGroup::make([
                Tables\Actions\DeleteBulkAction::make(),
            ]),
        ]);
  }
}
