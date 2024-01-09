import {Fragment} from 'react'
import { Link } from '@inertiajs/react';
import {classNames, imageStorageUrl} from "@/Utils/Helper";
import {MenuItem} from "@/types";
import {Menu, Transition} from "@headlessui/react";
import {
    ChevronUpIcon, ChevronDownIcon,
} from '@heroicons/react/24/outline'

export default function NavDropdown({ item, isActive = false }: { item: MenuItem, isActive: boolean }) {
    return (
        <Menu as="div" className="flex-shrink-0 relative ml-4">
            {({open}) => (
                <>
                    <div>
                        <Menu.Button
                            className={
                                classNames("flex items-center text-sm font-medium text-gray-700 hover:text-main-500 hover:bg-main-100 px-4 py-3 rounded-full",
                                    item.data.classes ?? '',
                                    isActive ? 'bg-main-100 text-main-500' : ''
                                )
                            }>
                            {item.label} {open ? (
                            <ChevronUpIcon className={"ms-1 w-3 h-3"}/>) : (
                            <ChevronDownIcon className={"ms-1 w-3 h-3"}/>)}
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
                            className="origin-top-left absolute left-0 mt-2 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 py-1 focus:outline-none">
                            {Object.keys(item.children).map((childKey) => {
                                var child = item.children[childKey];
                                return (
                                    <Menu.Item key={child.label}>
                                        {({active}) => (
                                            <Link
                                                href={child.data.url}
                                                className={classNames(
                                                    active ? 'bg-gray-100' : '',
                                                    'flex items-center py-3 px-4 text-sm text-gray-700'
                                                )}
                                            >
                                                {
                                                    child.data.icon ? (
                                                        <img
                                                            src={imageStorageUrl(child.data.icon)}
                                                            alt=""
                                                            className="h-5 w-5 mr-1"/>
                                                    ) : null
                                                }
                                                {child.label}
                                            </Link>
                                        )}
                                    </Menu.Item>
                                )
                            })}
                        </Menu.Items>
                    </Transition>
                </>
            )}
        </Menu>
    );
}
