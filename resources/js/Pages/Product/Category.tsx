import { Fragment, Key, useState} from 'react'
import {Dialog, Disclosure, Menu, Transition} from '@headlessui/react'
import {XMarkIcon} from '@heroicons/react/24/outline'
import {ChevronDownIcon, FunnelIcon, MinusIcon, PlusIcon, Squares2X2Icon} from '@heroicons/react/20/solid'
import Authenticated from "@/Layouts/MasterLayout";
import ProductList from "@/Components/Products/ProductList";
import Pagination from "@/Components/Other/Pagination";
import Breadcrumb from "@/Components/Other/Breadcrumb";
import {Head, Link, router} from "@inertiajs/react";
import {classNames} from "@/Utils/Helper";

const sortOptions = [
    {name: 'Newest', code: 'newest', current: false},
    {name: 'Price: Low to High', code: 'price_asc', current: false},
    {name: 'Price: High to Low', code: 'price_desc', current: false},
    {name: 'Name: A-Z', code: 'name_asc', current: false},
    {name: 'Name: Z-A', code: 'name_desc', current: false},
]

export default function Category({category, allCategories, products, filters, sort}: { category: any, allCategories: any, products: any[], filters: any[], sort: string }) {
    const [mobileFiltersOpen, setMobileFiltersOpen] = useState(false)
    const breadcrumbs = [
        {id: 1, name: 'Home', href: '/'},
        {id: 2, name: 'Shop'},
    ]

    const onFilterClick = (filters: any[]) => {
        console.log('filter clicked', filters);
        //Generate url
        var filteredParams = {};
        filters.map((section) => {
            var selectedValues: any[] = [];
            section.options.map((option: { checked: any; value: any; }) => {
                if (option.checked) {
                    selectedValues.push(option.value);
                }
            })
            filteredParams[section.id] = selectedValues;
        })
        var url = new URL(window.location.href);
        Object.keys(filteredParams).map((key) => {
            if(filteredParams[key].length == 0) {
                url.searchParams.delete(key);
            }else{
                url.searchParams.set(key, filteredParams[key].join(','));
            }
            url.searchParams.set('page', '1');
        });
        router.visit(url.toString());
    }

    const onSortClick = (sortOption: any) => {
        console.log('filter clicked', sortOption);
        //Generate url
        var url = new URL(window.location.href);
        url.searchParams.set('sort', sortOption.code);
        url.searchParams.set('page', '1');
        router.visit(url.toString());
    }

    return (
        <Authenticated>
            <Head title={category?.name ?? 'Shop'}/>
            <div className="bg-white">
                <div className="container mx-auto px-4 sm:px-6 lg:px-8 pt-6">
                    {/* Mobile filter dialog */}
                    <Transition.Root show={mobileFiltersOpen} as={Fragment}>
                        <Dialog as="div" className="relative z-40 lg:hidden" onClose={setMobileFiltersOpen}>
                            <Transition.Child
                                as={Fragment}
                                enter="transition-opacity ease-linear duration-300"
                                enterFrom="opacity-0"
                                enterTo="opacity-100"
                                leave="transition-opacity ease-linear duration-300"
                                leaveFrom="opacity-100"
                                leaveTo="opacity-0"
                            >
                                <div className="fixed inset-0 bg-black bg-opacity-25"/>
                            </Transition.Child>

                            <div className="fixed inset-0 z-40 flex">
                                <Transition.Child
                                    as={Fragment}
                                    enter="transition ease-in-out duration-300 transform"
                                    enterFrom="translate-x-full"
                                    enterTo="translate-x-0"
                                    leave="transition ease-in-out duration-300 transform"
                                    leaveFrom="translate-x-0"
                                    leaveTo="translate-x-full"
                                >
                                    <Dialog.Panel
                                        className="relative ml-auto flex h-full w-full max-w-xs flex-col overflow-y-auto bg-white py-4 pb-12 shadow-xl">
                                        <div className="flex items-center justify-between px-4">
                                            <h2 className="text-lg font-medium text-gray-900">Filters</h2>
                                            <button
                                                type="button"
                                                className="-mr-2 flex h-10 w-10 items-center justify-center rounded-md bg-white p-2 text-gray-400"
                                                onClick={() => setMobileFiltersOpen(false)}
                                            >
                                                <span className="sr-only">Close menu</span>
                                                <XMarkIcon className="h-6 w-6" aria-hidden="true"/>
                                            </button>
                                        </div>

                                        {/* Filters */}
                                        <form className="mt-4 border-t border-gray-200">
                                            <h3 className="sr-only">Categories</h3>
                                            <ul role="list" className="px-2 py-3 font-medium text-gray-900">
                                                <li >
                                                    <Link href={route('shop.index')} className="block px-2 py-3">
                                                        All
                                                    </Link>
                                                </li>
                                                {allCategories.map((cat:any) => (
                                                    <li key={cat.name}>
                                                        <Link href={cat.href} className="block px-2 py-3">
                                                            {cat.name}
                                                        </Link>
                                                    </li>
                                                ))}
                                            </ul>

                                            {filters.map((section) => (
                                                <Disclosure as="div" key={section.id}
                                                            className="border-t border-gray-200 px-4 py-6">
                                                    {({open}) => (
                                                        <>
                                                            <h3 className="-mx-2 -my-3 flow-root">
                                                                <Disclosure.Button
                                                                    className="flex w-full items-center justify-between bg-white px-2 py-3 text-gray-400 hover:text-gray-500">
                                                                    <span
                                                                        className="font-medium text-gray-900">{section.name}</span>
                                                                    <span className="ml-6 flex items-center">
                                                                      {open ? (
                                                                          <MinusIcon className="h-5 w-5" aria-hidden="true"/>
                                                                      ) : (
                                                                          <PlusIcon className="h-5 w-5" aria-hidden="true"/>
                                                                      )}
                                                                    </span>
                                                                </Disclosure.Button>
                                                            </h3>
                                                            <Disclosure.Panel className="pt-6">
                                                                <div className="space-y-6">
                                                                    {section.options.map((option, optionIdx) => (
                                                                        <div key={option.value}
                                                                             className="flex items-center">
                                                                            <input
                                                                                id={`filter-mobile-${section.id}-${optionIdx}`}
                                                                                name={`${section.id}[]`}
                                                                                defaultValue={option.value}
                                                                                type="checkbox"
                                                                                defaultChecked={option.checked}
                                                                                className="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500"
                                                                            />
                                                                            <label
                                                                                htmlFor={`filter-mobile-${section.id}-${optionIdx}`}
                                                                                className="ml-3 min-w-0 flex-1 text-gray-500"
                                                                            >
                                                                                {option.label}
                                                                            </label>
                                                                        </div>
                                                                    ))}
                                                                </div>
                                                            </Disclosure.Panel>
                                                        </>
                                                    )}
                                                </Disclosure>
                                            ))}
                                        </form>
                                    </Dialog.Panel>
                                </Transition.Child>
                            </div>
                        </Dialog>
                    </Transition.Root>

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
                                                                href={option.href}
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
                                <form className="hidden lg:block">
                                    <h3 className="sr-only">Categories</h3>
                                    <ul role="list"
                                        className="space-y-4 border-b border-gray-200 pb-6 text-sm font-medium text-gray-900">
                                        <li >
                                            <Link href={route('shop.index')} className={classNames("capitalize", !category?.id ? 'font-bold text-main-900' : '')}>
                                                All
                                            </Link>
                                        </li>

                                        {allCategories.map((cat: { name: Key | null | undefined; slug: any; id: any; }) => (
                                            <li key={cat.name}>
                                                <Link
                                                    href={route('shop.category', {slug: cat.slug, sort})}
                                                    className={classNames("capitalize", cat.id == category?.id ? 'font-bold text-main-900' : '')}>{cat.name.toLowerCase()}</Link>
                                            </li>
                                        ))}
                                    </ul>

                                    {filters.map((section, sectionIdx) => (
                                        <Disclosure as="div" key={section.id} className="border-b border-gray-200 py-6" defaultOpen={section.open}>
                                            {({ open }) => (
                                                <>
                                                    <h3 className="-my-3 flow-root">
                                                        <Disclosure.Button className="flex w-full items-center justify-between bg-white py-3 text-sm text-gray-400 hover:text-gray-500">
                                                            <span className="font-medium text-gray-900">{section.name}</span>
                                                            <span className="ml-6 flex items-center">
                                                              {open ? (
                                                                  <MinusIcon className="h-5 w-5" aria-hidden="true" />
                                                              ) : (
                                                                  <PlusIcon className="h-5 w-5" aria-hidden="true" />
                                                              )}
                                                            </span>
                                                        </Disclosure.Button>
                                                    </h3>
                                                    <Disclosure.Panel className="pt-6">
                                                        <div className="space-y-4">
                                                            {section.options.map((option, optionIdx) => (
                                                                <div key={option.value} className="flex items-center">
                                                                    <input
                                                                        id={`filter-${section.id}-${optionIdx}`}
                                                                        name={`${section.id}[]`}
                                                                        defaultValue={option.value}
                                                                        type="checkbox"
                                                                        defaultChecked={option.checked}
                                                                        className="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500"
                                                                        onClick={() => {
                                                                            filters[sectionIdx].options[optionIdx].checked = !section.options[optionIdx].checked;
                                                                            onFilterClick(filters);
                                                                        }}
                                                                    />
                                                                    <label
                                                                        htmlFor={`filter-${section.id}-${optionIdx}`}
                                                                        className="ml-3 text-sm text-gray-600"
                                                                    >
                                                                        {option.label}
                                                                    </label>
                                                                </div>
                                                            ))}
                                                        </div>
                                                    </Disclosure.Panel>
                                                </>
                                            )}
                                        </Disclosure>
                                    ))}
                                </form>

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
        </Authenticated>
    )
}
