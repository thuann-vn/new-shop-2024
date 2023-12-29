import { Fragment, useState } from 'react'
import { Dialog, Popover, Tab, Transition } from '@headlessui/react'
import { Bars3Icon, MagnifyingGlassIcon, ShoppingBagIcon, XMarkIcon } from '@heroicons/react/24/outline'
import {classNames, imageStorageUrl} from "@/Utils/Helper";
import {Link} from "@inertiajs/react";

export default function MobileMenu({open, setOpen, navigation} : {open: boolean, setOpen: any, navigation:any}) {
    return (
        <Transition.Root show={open} as={Fragment}>
            <Dialog as="div" className="relative z-40 lg:hidden" onClose={setOpen}>
                <Transition.Child
                    as={Fragment}
                    enter="transition-opacity ease-linear duration-300"
                    enterFrom="opacity-0"
                    enterTo="opacity-100"
                    leave="transition-opacity ease-linear duration-300"
                    leaveFrom="opacity-100"
                    leaveTo="opacity-0"
                >
                    <div className="fixed inset-0 bg-black bg-opacity-25" />
                </Transition.Child>

                <div className="fixed inset-0 z-40 flex">
                    <Transition.Child
                        as={Fragment}
                        enter="transition ease-in-out duration-300 transform"
                        enterFrom="-translate-x-full"
                        enterTo="translate-x-0"
                        leave="transition ease-in-out duration-300 transform"
                        leaveFrom="translate-x-0"
                        leaveTo="-translate-x-full"
                    >
                        <Dialog.Panel className="relative flex w-full max-w-xs flex-col overflow-y-auto bg-white pb-12 shadow-xl">
                            <div className="flex px-4 pb-2 pt-5">
                                <button
                                    type="button"
                                    className="relative -m-2 inline-flex items-center justify-center rounded-md p-2 text-gray-400"
                                    onClick={() => setOpen(false)}
                                >
                                    <span className="absolute -inset-0.5" />
                                    <span className="sr-only">Close menu</span>
                                    <XMarkIcon className="h-6 w-6" aria-hidden="true" />
                                </button>
                            </div>
                            <div className="space-y-6 border-t border-gray-200 px-4 py-6">
                                {Object.keys(navigation.items).map((key) => {
                                    var page = navigation.items[key];
                                    return (
                                        <div key={page.name} className="flow-root">
                                            <a href={page.data.url} className="-m-2 block p-2 font-medium text-gray-900 flex items-center">
                                                {
                                                    page.data.icon ? (
                                                        <img src={imageStorageUrl(page.data.icon)} alt="" className="h-5 w-5 mr-1" />
                                                    ) :null
                                                }
                                                {page.label}
                                            </a>
                                        </div>
                                    )
                                })}
                            </div>
                        </Dialog.Panel>
                    </Transition.Child>
                </div>
            </Dialog>
        </Transition.Root>
    )
}
