import {Fragment} from 'react'
import {Link, usePage} from '@inertiajs/react';
import {classNames, imageStorageUrl} from "@/Utils/Helper";
import {MenuItem, PageProps} from "@/types";
import {Menu, Transition} from "@headlessui/react";
import {
    ChevronUpIcon, ChevronDownIcon, ListBulletIcon,
} from '@heroicons/react/24/outline'

export default function CategoryDropdown() {
    const {category_navigation} = usePage<PageProps>().props;
    return (
        <Menu as="div" className="flex-shrink-0 relative me-4">
            {({open}) => (
                <>
                    <div>
                        <Menu.Button
                            className={
                                classNames("flex items-center text-md font-medium bg-main-500 text-white px-4 py-3 rounded-full"
                                )
                            }>

                            <ListBulletIcon className={"w-6 h-6 me-2"}/>
                            Categories
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
                            className="origin-top-left absolute left-0 mt-4 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 py-1 focus:outline-none">
                            {Object.keys(category_navigation.items).map((key, index) => {
                                const item = category_navigation.items[key];
                                const isLastItem = index === Object.keys(category_navigation.items).length - 1;
                                return (
                                    <Menu.Item key={item.label}>
                                        {({active}) => (
                                            <Link
                                                href={item.data.url}
                                                className={classNames(
                                                    active ? 'bg-gray-100' : '',
                                                    'flex items-center py-3 px-4 text-md text-gray-700',
                                                    !isLastItem ? 'border-b' : ''
                                                )}
                                            >
                                                {
                                                    item.data.icon ? (
                                                        <img
                                                            src={imageStorageUrl(item.data.icon)}
                                                            alt=""
                                                            className="h-6 w-6 mr-2"/>
                                                    ) : null
                                                }
                                                {item.label}
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
