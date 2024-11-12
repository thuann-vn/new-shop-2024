import {Fragment, useContext, useState} from 'react'
import {Menu, Popover, Transition} from '@headlessui/react'
import {
    Bars3Icon,
    MagnifyingGlassIcon,
    ShoppingBagIcon,
    UserIcon
} from '@heroicons/react/24/outline'
import {
    PhoneIcon
} from '@heroicons/react/24/solid'
import {classNames, imageStorageUrl} from "@/Utils/Helper";
import MobileMenu from "@/Components/Layout/MobileMenu";
import {Link, usePage} from "@inertiajs/react";
import {CartContext} from "@/Contexts/CartContext";
import {PageProps} from "@/types";
import ApplicationLogo from "@/Components/Layout/ApplicationLogo";
import NavLink from "@/Components/Layout/NavLink";
import NavDropdown from "@/Components/Layout/NavDropdown";
import CategoryDropdown from "@/Components/Layout/CategoryDropdown";
import SearchForm from "@/Components/Layout/SearchForm";

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
        {name: 'Your Profile', href: route('profile.edit')},
        {name: 'Orders', href: route('profile.orders')},
        {name: 'Wish List', href: route('profile.wishlist')},
        {name: 'Sign out', href: route('logout')},
    ]

    console.log(navigation)
    return (
        <div className="bg-main-600 relative z-20">
            {/* Mobile menu */}
            <MobileMenu open={open} setOpen={setOpen} navigation={navigation}/>

            <header className="bg-main-600 relative border-b border-transparent">
                <nav aria-label="Top" className="mx-auto container px-4 sm:px-6 lg:px-8">
                    <div className="flex h-24 items-center">
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
                            <ApplicationLogo/>
                        </div>

                        {/*Search form*/}
                        <SearchForm/>

                        {/*Hotline*/}
                        <div className="flex items-center justify-center sm:items-stretch sm:justify-start">
                            <div className="hidden sm:block sm:ml-6">
                                <div className="flex space-x-2">
                                    <Link href={"tel:" + general_settings.site_phone} className="flex items-center text-sm font-medium text-white hover:text-gray-100 px-4 py-3 rounded-full">
                                        <PhoneIcon className="h-8 w-8 me-3" aria-hidden="true"/>
                                        <div className="leading-5">
                                            Need help? <br/>
                                            Call us at {general_settings.site_phone}
                                        </div>
                                    </Link>
                                </div>
                            </div>
                        </div>

                        {/* Right buttons */}
                        <div className="ml-auto flex items-center">
                            {
                                auth.user ? (
                                    <Menu as="div" className="flex-shrink-0 relative ml-4">
                                        <div>
                                            <Menu.Button
                                                className="bg-white rounded-full flex focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                                <span className="sr-only">Open user menu</span>
                                                <img className="h-10 w-h-10 rounded-full"
                                                     src={auth.user.photo ? auth.user.photo : 'https://ui-avatars.com/api/?background=random&name=' + auth.user.name}
                                                     alt=""/>
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
                                        <Link href={route('login')} className="p-2 text-white hover:opacity-90 rounded-full bg-main-400">
                                            <UserIcon className="h-6 w-6" aria-hidden="true"/>
                                        </Link>
                                    </div>
                                )
                            }

                            {/* Cart */}
                            <div className="ml-4 flow-root lg:ml-6">
                                <a onClick={() => openCart()} href="#" className="group hover:opacity-90 relative -m-2 flex items-center p-2 rounded-full bg-main-400">
                                    <ShoppingBagIcon
                                        className="h-6 w-6 flex-shrink-0 text-white"
                                        aria-hidden="true"
                                    />
                                    <span className="absolute bg-white rounded-full h-5 w-5 text-center right-0 top-0 -me-2 text-sm">{cart.count ?? 0}</span>
                                    <span className="sr-only">items in cart, view bag</span>
                                </a>
                            </div>
                        </div>
                    </div>


                    {/* Flyout menus */}
                    <Popover.Group className="hidden lg:block">
                        <div className="flex items-center space-x-2 bg-white rounded-full px-2 py-1 -mb-8 shadow">
                            <CategoryDropdown/>
                            {Object.keys(navigation).map((key, index) => {
                                var page = navigation[key];
                                if (page.children && Object.keys(page.children).length > 0) {
                                    return (
                                        <NavDropdown
                                            key={key}
                                            item={page}
                                            isActive={isCurrentPage(page.data.url)}
                                        />
                                    )
                                } else {
                                    return (
                                        <NavLink key={'main_menu_' + index}
                                                 href={page.type == 'route' ? route(page.data.url) : page.data.url}
                                                 isExternalLink={page.type == 'external-link'}
                                                 target={page.data.target ?? '_self'}
                                                 active={isCurrentPage(page.data.url)}
                                                 icon={page.data.icon ? imageStorageUrl(page.data.icon) : null}
                                                 label={page.label}
                                                 className={page.data.classes ?? ''}></NavLink>
                                    )
                                }
                            })}
                        </div>
                    </Popover.Group>
                </nav>
            </header>
        </div>
    )
}
