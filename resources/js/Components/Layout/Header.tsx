import {Fragment, useContext, useState} from 'react'
import {Menu, Popover, Transition} from '@headlessui/react'
import {
    Bars3Icon, ChevronUpIcon, ChevronDownIcon,
    MagnifyingGlassIcon,
    ShoppingBagIcon,
    UserIcon
} from '@heroicons/react/24/outline'
import {classNames, imageStorageUrl} from "@/Utils/Helper";
import MobileMenu from "@/Components/Layout/MobileMenu";
import {Link, usePage} from "@inertiajs/react";
import {CartContext} from "@/Contexts/CartContext";
import {PageProps} from "@/types";

export default function Header() {
    const [open, setOpen] = useState(false)
    const {general_settings, cart, navigation, auth} = usePage<PageProps>().props;
    const {openCart} = useContext(CartContext);

    const isCurrentPage = (url: string) => {
        return false;
        // var currentUrl = location ? location.pathname : '';
        // if (url == '/') return currentUrl == '/';
        // return url && currentUrl.startsWith(url);
    }

    const userNavigation = [
        { name: 'Your Profile', href: route('profile.edit') },
        { name: 'Orders', href: route('profile.orders') },
        { name: 'Wish List', href: route('profile.wishlist') },
        { name: 'Sign out', href: route('logout') },
    ]

    return (
        <div className="bg-transparent relative z-20">
            {/* Mobile menu */}
            <MobileMenu open={open} setOpen={setOpen} navigation={navigation}/>

            <header className="bg-transparent relative border-b border-gray-200">
                <p className="flex h-10 items-center justify-center bg-indigo-600 px-4 text-sm font-medium text-white sm:px-6 lg:px-8">
                    Get free delivery on orders over $100
                </p>

                <nav aria-label="Top" className="mx-auto container px-4 sm:px-6 lg:px-8">
                    <div className="flex h-16 items-center">
                        <button
                            type="button"
                            className="relative rounded-md bg-white p-2 text-gray-400 lg:hidden"
                            onClick={() => setOpen(true)}
                        >
                            <span className="absolute -inset-0.5"/>
                            <span className="sr-only">Open menu</span>
                            <Bars3Icon className="h-6 w-6" aria-hidden="true"/>
                        </button>

                        {/* Logo */}
                        <div className="ml-4 flex lg:ml-0">
                            <Link href={route('home')}>
                                <span className="sr-only">Your Company</span>
                                <img
                                    className="h-8 w-auto"
                                    src={general_settings.site_logo}
                                    alt=""
                                />
                            </Link>
                        </div>

                        {/* Flyout menus */}
                        <Popover.Group className="hidden lg:ml-8 lg:block">
                            <div className="flex space-x-2">
                                {Object.keys(navigation.items).map((key) => {
                                    var page = navigation.items[key];
                                    if(page.children && Object.keys(page.children).length > 0) {
                                        return (
                                            <Menu key={key} as="div" className="flex-shrink-0 relative ml-4">
                                                {({ open }) => (
                                                    <>
                                                        <div>
                                                            <Menu.Button
                                                                className={
                                                                    classNames("flex items-center text-sm font-medium text-gray-700 hover:text-main-500 hover:bg-main-100 px-4 py-3 rounded-full",
                                                                        page.data.classes ?? '',
                                                                        isCurrentPage(page.data.url) ? 'bg-main-100 text-main-500' : ''
                                                                    )
                                                                }>
                                                                {page.label} {open ? (<ChevronUpIcon className={"ms-1 w-3 h-3"}/>) : (<ChevronDownIcon className={"ms-1 w-3 h-3"}/>)}
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
                                                                {Object.keys(page.children).map((childKey) => {
                                                                    var child = page.children[childKey];
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
                                                                                            <img src={imageStorageUrl(child.data.icon)} alt=""
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
                                        )
                                    }else {
                                        return (
                                            <Link
                                                key={key}
                                                href={page.data.url}
                                                className={
                                                    classNames("flex items-center text-sm font-medium text-gray-700 hover:text-main-500 hover:bg-main-100 px-4 py-3 rounded-full",
                                                        page.data.classes ?? '',
                                                        isCurrentPage(page.data.url) ? 'bg-main-100 text-main-500' : ''
                                                    )
                                                }
                                            >
                                                {
                                                    page.data.icon ? (
                                                        <img src={imageStorageUrl(page.data.icon)} alt=""
                                                             className="h-5 w-5 mr-1"/>
                                                    ) : null
                                                }
                                                {page.label}
                                            </Link>
                                        )
                                    }
                                })}
                            </div>
                        </Popover.Group>

                        <div className="ml-auto flex items-center">
                            {
                                auth.user ? (
                                    <Menu as="div" className="flex-shrink-0 relative ml-4">
                                        <div>
                                            <Menu.Button
                                                className="bg-white rounded-full flex focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                                <span className="sr-only">Open user menu</span>
                                                <img className="h-8 w-8 rounded-full" src={auth.user.photo ? auth.user.photo : 'https://ui-avatars.com/api/?background=random&name=' + auth.user.name } alt=""/>
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
                                                className="origin-top-right absolute left-0 mt-2 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 py-1 focus:outline-none">
                                                {userNavigation.map((item) => (
                                                    <Menu.Item key={item.name}>
                                                        {({active}) => (
                                                            <a
                                                                href={item.href}
                                                                className={classNames(
                                                                    active ? 'bg-gray-100' : '',
                                                                    'block py-2 px-4 text-sm text-gray-700'
                                                                )}
                                                            >
                                                                {item.name}
                                                            </a>
                                                        )}
                                                    </Menu.Item>
                                                ))}
                                            </Menu.Items>
                                        </Transition>
                                    </Menu>
                                ) : (
                                    <div className="flex lg:ml-6">
                                        <Link href={route('login')} className="p-2 text-gray-400 hover:text-gray-500">
                                            <UserIcon className="h-6 w-6" aria-hidden="true"/>
                                        </Link>
                                    </div>
                                )
                            }

                            {/* Search */}
                            <div className="flex lg:ml-6">
                                <a href="#" className="p-2 text-gray-400 hover:text-gray-500">
                                    <span className="sr-only">Search</span>
                                    <MagnifyingGlassIcon className="h-6 w-6" aria-hidden="true"/>
                                </a>
                            </div>

                            {/* Cart */}
                            <div className="ml-4 flow-root lg:ml-6">
                                <a onClick={() => openCart()} href="#" className="group -m-2 flex items-center p-2">
                                    <ShoppingBagIcon
                                        className="h-6 w-6 flex-shrink-0 text-gray-400 group-hover:text-gray-500"
                                        aria-hidden="true"
                                    />
                                    <span
                                        className="ml-2 text-sm font-medium text-gray-700 group-hover:text-gray-800">{cart.count ?? 0}</span>
                                    <span className="sr-only">items in cart, view bag</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </nav>
            </header>
        </div>
    )
}
