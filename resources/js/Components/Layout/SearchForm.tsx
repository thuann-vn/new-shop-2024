import {MagnifyingGlassIcon} from "@heroicons/react/24/outline";
import {useCallback, useEffect, useState} from "react";
import {Combobox} from "@headlessui/react";
import debounce from 'lodash.debounce'
import axios from "axios";
import {imageStorageUrl} from "@/Utils/Helper";
import CustomCurrencyFormat from "@/Components/CurrencyFormat";
import {Link, router} from "@inertiajs/react";
import {Product} from "@/types";

export default function SearchForm() {
    const [selectedProduct, setSelectedProduct] = useState(null)
    const [query, setQuery] = useState('all')
    const [dropdownOptions, setDropdownOptions] = useState<Product[]>([])


    useEffect(() => {
        //Call API to search for products
        debounceDropDown(query)
    }, [query])

    function fetchDropdownOptions(key: string) {
        axios.get(route('products.search', {q: key}))
            .then(res => {
                setDropdownOptions(res.data)
            });
    }

    const debounceDropDown = useCallback(debounce((nextValue) => fetchDropdownOptions(nextValue), 300), [])

    const onSelectProduct = (product: Product) => {
        router.visit(route('products.detail', {slug: product.slug}))
    }
    return (
        <form className="flex-1 lg:w-0 ms-8" action="#" method="GET">
            <div className="relative w-full text-gray-400 focus-within:text-gray-600">
                <label htmlFor="search" className="sr-only">Search</label>
                <Combobox value={selectedProduct}
                          onChange={onSelectProduct}>
                    <Combobox.Input id="search" name="search"
                                    className="block w-full bg-white py-3 pr-10 pl-3 border border-transparent rounded-full leading-5 text-gray-900 placeholder-gray-500 focus:outline-none focus:bg-white focus:border-transparent focus:ring-0 sm:text-sm"
                                    placeholder="Search for your products..."
                                    type="search"
                                    onChange={(event) => setQuery(event.target.value)}
                    />
                    <Combobox.Options
                        className={"absolute z-30 mt-1 w-full overflow-auto rounded-md bg-white text-base shadow-lg ring-1 ring-black/5 focus:outline-none sm:text-sm"}>
                        {
                            dropdownOptions.length === 0 ? (
                                <div className="px-4 py-2 text-sm text-gray-700">
                                    {query !== '' ? 'No results found' : 'Start typing to search'}
                                </div>
                            ) : null
                        }
                        {dropdownOptions.map((product) => (
                            <Combobox.Option
                                key={product}
                                value={product}
                                className={({active}) =>
                                    `relative cursor-pointer select-none py-2 pl-4 pr-4 hover:bg-gray-100 text-gray-900`
                                }
                            >
                                <div className="flex items-center">
                                    <img src={product.featured_image_url} alt={product.name}
                                         className="flex-shrink-0 h-20 w-20 rounded-full"/>
                                    <div className="ml-3 ">
                                        <span className="leading-6 text-black font-bold line-clamp-2">
                                        {product.name}
                                        </span>
                                        <span className="ml-auto text-lg text-main-500 leading-6 font-bold block">
                                            {
                                                product.old_price ? (
                                                    <span className="text-gray-500 text-sm line-through me-2">
                                                        <CustomCurrencyFormat value={product.old_price}/>
                                                    </span>
                                                ) : null
                                            }
                                            <CustomCurrencyFormat value={product.price}/>
                                        </span>
                                    </div>
                                </div>
                            </Combobox.Option>
                        ))}
                    </Combobox.Options>
                </Combobox>

                <div className="absolute inset-y-0 right-4 flex items-center pointer-events-none">
                    <MagnifyingGlassIcon className="h-6 w-6" aria-hidden="true"/>
                </div>
            </div>
        </form>
    )
}
