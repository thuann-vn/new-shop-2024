import {RadioGroup} from "@headlessui/react";
import * as React from "react";
import {useEffect, useState} from "react";
import {classNames} from "@/Utils/Helper";
import axios from "axios";
import {Product} from "@/types";

export default function ProductVariants({ onVariantChange, product, attributes, options }: {
    onVariantChange: any,
    product: Product,
    attributes: any,
    options: any
}): JSX.Element {
    const [selectedVariant, setSelectedVariant] = useState(null)
    const [selectedOptions, setSelectedOptions] = useState<{ [key: string]: string }>({})
    const [availableOptions, setAvailableOptions] = useState<{ [key: string]: any[] }>({})

    useEffect(() => {
        //Auto select first option
        if (Object.keys(selectedOptions).length === 0) {
            let firstAttribute = attributes[0]
            let firstAttributeOptions = options[firstAttribute.id]
            let availableOptions: string[] = [];
            let firstAvailableOption: any = null;
            Object.keys(firstAttributeOptions).map((key) => {
                var option = firstAttributeOptions[key]
                if (option.in_stock) {
                    availableOptions.push(key)
                    firstAvailableOption = firstAvailableOption ? firstAvailableOption : key;
                }
            })
            setAvailableOptions({
                [firstAttribute.id]: availableOptions
            })

            if(firstAvailableOption){
                const initiateSelectedOptions = { [firstAttribute.id]: firstAvailableOption}
                setSelectedOptions(initiateSelectedOptions)
                _onSelectOption(initiateSelectedOptions, firstAttribute.id)
            }
        }
    }, [])

    //When variant change
    const _onSelectOption = (options: { [key: string]: string }, attributeId: number) => {
        setSelectedVariant(null)
        axios.get(route('products.available-variants', {product_id: product.id, attribute_id: attributeId, selected_options: options}))
            .then((response) => {
                let responseData = response.data;
                let options = responseData.product_options;
                let selectedVariant = responseData.selected_variant;
                Object.keys(options).map(availableAttributeId => {
                    setAvailableOptions((prevState)=>{
                        let availableOptions = {...prevState}
                        availableOptions[availableAttributeId] = Object.keys(options[availableAttributeId])
                        return availableOptions
                    })
                })
                setSelectedVariant(selectedVariant)
                onVariantChange(selectedVariant)
            })
    }

    return (
        <div>
            {
                attributes.map((attribute: any) => {
                    const attributeOptions = options[attribute.id]
                    return (
                        <div className="mt-10">
                            <h3 className="text-sm font-medium text-gray-900">{attribute.name}</h3>
                            <RadioGroup value={selectedOptions[attribute.id]}
                                        onChange={(value) => {
                                            setSelectedOptions({
                                                ...selectedOptions,
                                                [attribute.id]: value
                                            })
                                            _onSelectOption({
                                                ...selectedOptions,
                                                [attribute.id]: value
                                            }, attribute.id)
                                        }} className="mt-4">
                                <RadioGroup.Label className="sr-only">Choose a {attribute.name}</RadioGroup.Label>
                                <div className="grid grid-cols-4 gap-4 sm:grid-cols-8 lg:grid-cols-4">
                                    {Object.keys(attributeOptions).map((key) => {
                                        var option = attributeOptions[key].name
                                        var inStock = attributeOptions[key].in_stock
                                        var isAvailable = availableOptions[attribute.id] && availableOptions[attribute.id].includes(key);
                                        return (
                                            <RadioGroup.Option
                                                key={option}
                                                value={key}
                                                disabled={!isAvailable}
                                                className={({active}) =>
                                                    classNames(
                                                        isAvailable
                                                            ? 'cursor-pointer bg-white text-gray-900 shadow-sm'
                                                            : 'cursor-not-allowed bg-gray-50 text-gray-200',
                                                        active ? 'ring-2 ring-indigo-500' : '',
                                                        'group relative flex items-center justify-center rounded-md border py-3 px-4 text-sm font-medium uppercase hover:bg-gray-50 focus:outline-none sm:flex-1 sm:py-6'
                                                    )
                                                }
                                            >
                                                {({active, checked}) => (
                                                    <>
                                                        <RadioGroup.Label
                                                            as="span">{option} <span className={isAvailable ? "text-gray-400" : "text-gray-200"}>({inStock})</span></RadioGroup.Label>
                                                        {isAvailable ? (
                                                            <span
                                                                className={classNames(
                                                                    active ? 'border' : 'border-2',
                                                                    checked ? 'border-indigo-500' : 'border-transparent',
                                                                    'pointer-events-none absolute -inset-px rounded-md'
                                                                )}
                                                                aria-hidden="true"
                                                            />
                                                        ) : (
                                                            <span
                                                                aria-hidden="true"
                                                                className="pointer-events-none absolute -inset-px rounded-md border-2 border-gray-200"
                                                            >
                                                              <svg
                                                                  className="absolute inset-0 h-full w-full stroke-2 text-gray-200"
                                                                  viewBox="0 0 100 100"
                                                                  preserveAspectRatio="none"
                                                                  stroke="currentColor"
                                                              >
                                                                <line x1={0} y1={100} x2={100} y2={0}
                                                                      vectorEffect="non-scaling-stroke"/>
                                                              </svg>
                                                            </span>
                                                        )}
                                                    </>
                                                )}
                                            </RadioGroup.Option>
                                        )
                                    })}
                                </div>
                            </RadioGroup>
                        </div>
                    )
                })
            }
        </div>
    )
}
