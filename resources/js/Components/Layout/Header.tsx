import {useContext, useState} from 'react'
import { Popover } from '@headlessui/react'
import { Bars3Icon, MagnifyingGlassIcon, ShoppingBagIcon, XMarkIcon } from '@heroicons/react/24/outline'
import {classNames, imageStorageUrl} from "@/Utils/Helper";
import MobileMenu from "@/Components/Layout/MobileMenu";
import {Link, usePage} from "@inertiajs/react";
import {CartContext} from "@/Contexts/CartContext";

export default function Header() {
    const [open, setOpen] = useState(false)
    const { general_settings, cart, navigation } = usePage().props;
    const {openCart} = useContext(CartContext);

    const isCurrentPage = (url: string) => {
        var currentUrl = window.location.pathname;
        if(url == '/' ) return currentUrl =='/';
        return url && currentUrl.startsWith(url);
    }

    return (
        <div className="bg-transparent relative z-20">
            {/* Mobile menu */}
            <MobileMenu />

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
                            <span className="absolute -inset-0.5" />
                            <span className="sr-only">Open menu</span>
                            <Bars3Icon className="h-6 w-6" aria-hidden="true" />
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
                            <div className="flex space-x-0">
                                {Object.keys(navigation.items).map((key) => {
                                    var page = navigation.items[key];
                                    return (
                                        <a
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
                                                    <img src={imageStorageUrl(page.data.icon)} alt="" className="h-5 w-5 mr-1" />
                                                ) :null
                                            }
                                            {page.label}
                                        </a>
                                    )
                                })}
                            </div>
                        </Popover.Group>

                        <div className="ml-auto flex items-center">
                            <div className="hidden lg:flex lg:flex-1 lg:items-center lg:justify-end lg:space-x-6">
                                <Link href={route('login')} className="text-sm font-medium text-gray-700 hover:text-gray-800 uppercase">
                                    Sign in
                                </Link>
                            </div>


                            {/* Search */}
                            <div className="flex lg:ml-6">
                                <a href="#" className="p-2 text-gray-400 hover:text-gray-500">
                                    <span className="sr-only">Search</span>
                                    <MagnifyingGlassIcon className="h-6 w-6" aria-hidden="true" />
                                </a>
                            </div>

                            {/* Cart */}
                            <div className="ml-4 flow-root lg:ml-6">
                                <a onClick={()=>openCart()} href="#" className="group -m-2 flex items-center p-2">
                                    <ShoppingBagIcon
                                        className="h-6 w-6 flex-shrink-0 text-gray-400 group-hover:text-gray-500"
                                        aria-hidden="true"
                                    />
                                    <span className="ml-2 text-sm font-medium text-gray-700 group-hover:text-gray-800">{cart.count ?? 0}</span>
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
