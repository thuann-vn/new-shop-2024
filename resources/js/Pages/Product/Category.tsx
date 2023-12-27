import { Fragment, JSXElementConstructor, Key, ReactElement, ReactNode, ReactPortal, useState} from 'react'
import {Dialog, Disclosure, Menu, Transition} from '@headlessui/react'
import {XMarkIcon} from '@heroicons/react/24/outline'
import {ChevronDownIcon, FunnelIcon, MinusIcon, PlusIcon} from '@heroicons/react/20/solid'
import MasterLayout from "@/Layouts/MasterLayout";
import ProductList from "@/Components/Products/ProductList";
import Pagination from "@/Components/Other/Pagination";
import Breadcrumb from "@/Components/Other/Breadcrumb";
import {Head, Link, router} from "@inertiajs/react";
import {classNames} from "@/Utils/Helper";
import AppHead from "@/Components/Layout/AppHead";
import {ProductCategory, ProductCollection} from "@/types";
import ShopFilter from "@/Components/ProductCategory/ShopFilter";

const sortOptions = [
    {name: 'Newest', code: 'newest', current: false},
    {name: 'Price: Low to High', code: 'price_asc', current: false},
    {name: 'Price: High to Low', code: 'price_desc', current: false},
    {name: 'Name: A-Z', code: 'name_asc', current: false},
    {name: 'Name: Z-A', code: 'name_desc', current: false},
]

export default function Category({category, allCategories, products, filters, sort}: { category: ProductCategory, allCategories: ProductCategory[], products: ProductCollection, filters: any[], sort: string }) {
    const [mobileFiltersOpen, setMobileFiltersOpen] = useState(false)
    const breadcrumbs = [
        {id: 1, name: 'Home', href: '/'},
        {id: 2, name: 'Shop'},
    ]
    const onSortClick = (sortOption: any) => {
        //Generate url
        let url = new URL(window.location.href);
        url.searchParams.set('sort', sortOption.code);
        url.searchParams.set('page', '1');
        router.visit(url.toString());
    }

    return (
        <MasterLayout>
            <AppHead title={category?.name ?? 'Shop'}/>
            <div className="bg-white">
                <div className="container mx-auto px-4 sm:px-6 lg:px-8 pt-6">

                    <div>
                        <Breadcrumb breadcrumbs={breadcrumbs}/>
                        <div className="flex items-center justify-between pb-6 mt-3">
                            <h1 className="text-4xl font-bold tracking-tight text-gray-900">
                                {category?.name ?? 'Shop'}
                            </h1>

                            <div className="flex items-center">
                                <Menu as="div" className="relative inline-block text-left">
                                    <div>
                                        <Menu.Button
                                            className="group inline-flex justify-center text-sm font-medium text-gray-700 hover:text-gray-900">
                                            {
                                                sortOptions.filter((option) => option.code == sort)[0]?.name
                                            }
                                            <ChevronDownIcon
                                                className="-mr-1 ml-1 h-5 w-5 flex-shrink-0 text-gray-400 group-hover:text-gray-500"
                                                aria-hidden="true"
                                            />
                                        </Menu.Button>
                                    </div>

                                    <Transition
                                        as={Fragment}
                                        enter="transition ease-out duration-100"
                                        enterFrom="transform opacity-0 scale-95"
                                        enterTo="transform opacity-100 scale-100"
                                        leave="transition ease-in duration-75"
                                        leaveFrom="transform opacity-100 scale-100"
                                        leaveTo="transform opacity-0 scale-95"
                                    >
                                        <Menu.Items
                                            className="absolute right-0 z-10 mt-2 w-40 origin-top-right rounded-md bg-white shadow-2xl ring-1 ring-black ring-opacity-5 focus:outline-none">
                                            <div className="py-1">
                                                {sortOptions.map((option) => (
                                                    <Menu.Item key={option.name}>
                                                        {({active}) => (
                                                            <a
                                                                href={'#'}
                                                                onClick={(event) => {
                                                                    event.preventDefault();
                                                                    onSortClick(option);
                                                                }}
                                                                className={classNames(
                                                                    option.current ? 'font-medium text-gray-900' : 'text-gray-500',
                                                                    active ? 'bg-gray-100' : '',
                                                                    'block px-4 py-2 text-sm cursor-pointer'
                                                                )}
                                                            >
                                                                {option.name}
                                                            </a>
                                                        )}
                                                    </Menu.Item>
                                                ))}
                                            </div>
                                        </Menu.Items>
                                    </Transition>
                                </Menu>

                                {/*<button type="button"*/}
                                {/*        className="-m-2 ml-5 p-2 text-gray-400 hover:text-gray-500 sm:ml-7">*/}
                                {/*    <span className="sr-only">View grid</span>*/}
                                {/*    <Squares2X2Icon className="h-5 w-5" aria-hidden="true"/>*/}
                                {/*</button>*/}
                                <button
                                    type="button"
                                    className="-m-2 ml-4 p-2 text-gray-400 hover:text-gray-500 sm:ml-6 lg:hidden"
                                    onClick={() => setMobileFiltersOpen(true)}
                                >
                                    <span className="sr-only">Filters</span>
                                    <FunnelIcon className="h-5 w-5" aria-hidden="true"/>
                                </button>
                            </div>
                        </div>

                        <section aria-labelledby="products-heading" className="pb-24 pt-6">
                            <h2 id="products-heading" className="sr-only">
                                Products
                            </h2>

                            <div className="grid grid-cols-1 gap-x-8 gap-y-10 lg:grid-cols-4">
                                {/* Filters */}
                                <ShopFilter
                                    category={category}
                                    allCategories={allCategories}
                                    filters={filters}
                                    sort={sort}
                                    mobileFiltersOpen={mobileFiltersOpen}
                                    setMobileFiltersOpen={setMobileFiltersOpen}
                                />

                                {/* Product grid */}
                                <div className="lg:col-span-3">
                                    <ProductList products={products}/>
                                    <Pagination data={products}/>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </MasterLayout>
    )
}
