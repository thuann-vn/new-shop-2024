import {RadioGroup} from "@headlessui/react";
import * as React from "react";
import {useState} from "react";
import {classNames} from "@/Utils/Helper";

export default function ProductVariants({value, onValueChange} : {value: number, onValueChange: any}) : JSX.Element{
    const [selectedColor, setSelectedColor] = useState(null)
    const [selectedSize, setSelectedSize] = useState(null)

    const colors = [
        {name: 'White', class: 'bg-white', selectedClass: 'ring-gray-400'},
        {name: 'Gray', class: 'bg-gray-200', selectedClass: 'ring-gray-400'},
        {name: 'Black', class: 'bg-gray-900', selectedClass: 'ring-gray-900'},
    ]

    const sizes = [
        {name: 'XXS', inStock: false},
        {name: 'XS', inStock: true},
        {name: 'S', inStock: true},
        {name: 'M', inStock: true},
        {name: 'L', inStock: true},
        {name: 'XL', inStock: true},
        {name: '2XL', inStock: true},
        {name: '3XL', inStock: true},
    ]
    return (
        <>
            {/*Colors*/}
            <div>
                <h3 className="text-sm font-medium text-gray-900">Color</h3>
                <RadioGroup value={selectedColor} onChange={setSelectedColor} className="mt-4">
                    <RadioGroup.Label className="sr-only">Choose a color</RadioGroup.Label>
                    <div className="flex items-center space-x-3">
                        {colors.map((color) => (
                            <RadioGroup.Option
                                key={color.name}
                                value={color}
                                className={({active, checked}) =>
                                    classNames(
                                        color.selectedClass,
                                        active && checked ? 'ring ring-offset-1' : '',
                                        !active && checked ? 'ring-2' : '',
                                        'relative -m-0.5 flex cursor-pointer items-center justify-center rounded-full p-0.5 focus:outline-none'
                                    )
                                }
                            >
                                <RadioGroup.Label as="span" className="sr-only">
                                    {color.name}
                                </RadioGroup.Label>
                                <span
                                    aria-hidden="true"
                                    className={classNames(
                                        color.class,
                                        'h-8 w-8 rounded-full border border-black border-opacity-10'
                                    )}
                                />
                            </RadioGroup.Option>
                        ))}
                    </div>
                </RadioGroup>
            </div>

            {/*Sizes*/}
            <div className="mt-10">
                <div className="flex items-center justify-between">
                    <h3 className="text-sm font-medium text-gray-900">Size</h3>
                    <a href="#"
                       className="text-sm font-medium text-indigo-600 hover:text-indigo-500">
                        Size guide
                    </a>
                </div>

                <RadioGroup value={selectedSize} onChange={setSelectedSize} className="mt-4">
                    <RadioGroup.Label className="sr-only">Choose a size</RadioGroup.Label>
                    <div className="grid grid-cols-4 gap-4 sm:grid-cols-8 lg:grid-cols-4">
                        {sizes.map((size) => (
                            <RadioGroup.Option
                                key={size.name}
                                value={size}
                                disabled={!size.inStock}
                                className={({active}) =>
                                    classNames(
                                        size.inStock
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
                                            as="span">{size.name}</RadioGroup.Label>
                                        {size.inStock ? (
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
                                        <line x1={0} y1={100} x2={100} y2={0} vectorEffect="non-scaling-stroke"/>
                                      </svg>
                                    </span>
                                        )}
                                    </>
                                )}
                            </RadioGroup.Option>
                        ))}
                    </div>
                </RadioGroup>
            </div>
        </>
    )
}
