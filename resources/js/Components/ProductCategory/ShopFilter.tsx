import {Link, router} from "@inertiajs/react";
import {ProductCategory} from "@/types";
import {classNames} from "@/Utils/Helper";
import {Dialog, Disclosure, Transition} from "@headlessui/react";
import {MinusIcon, PlusIcon} from "@heroicons/react/20/solid";
import {Fragment, useState} from "react";
import {XMarkIcon} from "@heroicons/react/24/outline";

export default function ShopFilter({category, allCategories, filters, sort, mobileFiltersOpen, setMobileFiltersOpen}: { category: ProductCategory, allCategories: ProductCategory[], filters: any[], sort: string, mobileFiltersOpen: boolean, setMobileFiltersOpen: any }) {
    const onFilterClick = (filters: any[]) => {
        //Generate url
        let filteredParams = {};
        filters.map((section) => {
            let selectedValues: any[] = [];
            section.options.map((option: { checked: any; value: any; }) => {
                if (option.checked) {
                    selectedValues.push(option.value);
                }
            })
            // @ts-ignore
            filteredParams[section.id] = selectedValues;
        })
        let url = new URL(window.location.href);
        Object.keys(filteredParams).map((key) => {
            // @ts-ignore
            if (filteredParams[key].length == 0) {
                url.searchParams.delete(key);
            } else {
                // @ts-ignore
                url.searchParams.set(key, filteredParams[key].join(','));
            }
            url.searchParams.set('page', '1');
        });
        router.visit(url.toString());
    }

    return (
        <>

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
                                        <li>
                                            <Link href={route('shop.index')}
                                                  className={classNames("capitalize block px-2 py-3", !category?.id ? 'font-bold text-main-900' : '')}
                                            >
                                                All
                                            </Link>
                                        </li>
                                        {allCategories.map((cat: any) => (
                                            <li key={cat.name}>
                                                <Link href={cat.href}
                                                      className={classNames("capitalize block px-2 py-3", cat.id == category?.id ? 'font-bold text-main-900' : '')}
                                                >
                                                    {cat.name.toLowerCase()}
                                                </Link>
                                            </li>
                                        ))}
                                    </ul>

                                    {filters.map((section, sectionIdx) => (
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
                                                                          <MinusIcon className="h-5 w-5"
                                                                                     aria-hidden="true"/>
                                                                      ) : (
                                                                          <PlusIcon className="h-5 w-5"
                                                                                    aria-hidden="true"/>
                                                                      )}
                                                                    </span>
                                                        </Disclosure.Button>
                                                    </h3>
                                                    <Disclosure.Panel className="pt-6">
                                                        <div className="space-y-6">
                                                            {section.options.map((option: { value: string; checked: boolean; label: string }, optionIdx: number) => (
                                                                <div key={option.value}
                                                                     className="flex items-center">
                                                                    <input
                                                                        id={`filter-mobile-${section.id}-${optionIdx}`}
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
                                                                        htmlFor={`filter-mobile-${section.id}-${optionIdx}`}
                                                                        className="ml-3 min-w-0 flex-1 text-gray-500 capitalize"
                                                                    >
                                                                        {option.label.toLowerCase()}
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
            <form className="hidden lg:block">
                <h3 className="sr-only">Categories</h3>
                <ul role="list"
                    className="space-y-4 border-b border-gray-200 pb-6 text-sm font-medium text-gray-900">
                    <li>
                        <Link href={route('shop.index')}
                              className={classNames("capitalize", !category?.id ? 'font-bold text-main-900' : '')}>
                            All
                        </Link>
                    </li>

                    {allCategories.map((cat: { name: string; slug: any; id: any; }) => (
                        <li key={cat.name}>
                            <Link
                                href={route('shop.category', {slug: cat.slug, sort})}
                                className={classNames("capitalize", cat.id == category?.id ? 'font-bold text-main-900' : '')}>
                                {cat.name.toLowerCase()}
                            </Link>
                        </li>
                    ))}
                </ul>

                {filters.map((section, sectionIdx) => (
                    <Disclosure as="div" key={section.id} className="border-b border-gray-200 py-6"
                                defaultOpen={section.open}>
                        {({open}) => (
                            <>
                                <h3 className="-my-3 flow-root">
                                    <Disclosure.Button
                                        className="flex w-full items-center justify-between bg-white py-3 text-sm text-gray-400 hover:text-gray-500">
                                        <span className="font-medium text-gray-900">{section.name}</span>
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
                                    <div className="space-y-4">
                                        {section.options.map((option: { value: string; checked: boolean, label: string }, optionIdx: number) => (
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
        </>
    )
}
