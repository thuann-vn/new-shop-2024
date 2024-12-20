import {Fragment, MouseEvent, useContext, useEffect, useState} from 'react'
import {Dialog, Transition} from '@headlessui/react'
import {XMarkIcon} from '@heroicons/react/24/outline'
import {CartContext} from "@/Contexts/CartContext";
import {Link, router, usePage} from "@inertiajs/react";
import CustomCurrencyFormat from "@/Components/CurrencyFormat";
import axios from "axios";
import CounterInput from "@/Components/Other/CounterInput";
import {PageProps} from "@/types";
import {useTranslation} from "react-i18next";

export default function CartModal() {
    const {isOpen, closeCart} = useContext(CartContext);
    const {cart} = usePage<PageProps>().props;
    const [items, setItems] = useState(Object.values(cart.items));
    const {t} = useTranslation();

    useEffect(() => {
        setItems(Object.values(cart.items));
    }, [cart]);

    const removeCartItem = (event: React.MouseEvent<HTMLButtonElement>, product: any) => {
        event.preventDefault();
        axios.delete(route('cart.remove-from-cart', {id: product.rowId})).then((response) => {
            router.reload({only: ['cart']})
        });
    }

    const updateCartItem = (product: any) => {
        axios.put(route('cart.update-cart-item'), {qty: product.qty, rowId: product.rowId}).then((response) => {
            router.reload({only: ['cart']})
        });
    }

    return (
        <Transition.Root show={isOpen} as={Fragment}>
            <Dialog as="div" className="relative z-20" onClose={()=>closeCart()}>
                <Transition.Child
                    as={Fragment}
                    enter="ease-in-out duration-500"
                    enterFrom="opacity-0"
                    enterTo="opacity-100"
                    leave="ease-in-out duration-500"
                    leaveFrom="opacity-100"
                    leaveTo="opacity-0"
                >
                    <div className="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" />
                </Transition.Child>

                <div className="fixed inset-0 overflow-hidden">
                    <div className="absolute inset-0 overflow-hidden">
                        <div className="pointer-events-none fixed inset-y-0 right-0 flex max-w-full pl-10">
                            <Transition.Child
                                as={Fragment}
                                enter="transform transition ease-in-out duration-500 sm:duration-700"
                                enterFrom="translate-x-full"
                                enterTo="translate-x-0"
                                leave="transform transition ease-in-out duration-500 sm:duration-700"
                                leaveFrom="translate-x-0"
                                leaveTo="translate-x-full"
                            >
                                <Dialog.Panel className="pointer-events-auto w-screen max-w-md">
                                    <div className="flex h-full flex-col overflow-y-scroll bg-white shadow-xl">
                                        <div className="flex-1 overflow-y-auto px-4 py-6 sm:px-6">
                                            <div className="flex items-start justify-between">
                                                <Dialog.Title className="text-lg font-medium text-gray-900">
                                                    {t('Shopping cart')}
                                                </Dialog.Title>
                                                <div className="ml-3 flex h-7 items-center">
                                                    <button
                                                        type="button"
                                                        className="relative -m-2 p-2 text-gray-400 hover:text-gray-500"
                                                        onClick={() => closeCart()}
                                                    >
                                                        <span className="absolute -inset-0.5" />
                                                        <span className="sr-only">Close panel</span>
                                                        <XMarkIcon className="h-6 w-6" aria-hidden="true" />
                                                    </button>
                                                </div>
                                            </div>

                                            <div className="mt-8">
                                                <div className="flow-root">
                                                    <ul role="list" className="-my-6 divide-y divide-gray-200">
                                                        {items.map((product, index) => (
                                                            <li key={"cart_product_" + product.rowId} className="flex py-6">
                                                                <div className="h-24 w-24 flex-shrink-0 overflow-hidden rounded-md border border-gray-200">
                                                                    <img
                                                                        src={product.options.image}
                                                                        alt={product.name}
                                                                        className="h-full w-full object-cover object-center"
                                                                    />
                                                                </div>

                                                                <div className="ml-4 flex flex-1 flex-col">
                                                                    <div>
                                                                        <div className="flex justify-between text-base font-medium text-gray-900">
                                                                            <div>
                                                                                <h3>
                                                                                    <Link href={product.options.href}>{product.name}</Link>
                                                                                </h3>
                                                                                {
                                                                                    product.options.variant_description ? (
                                                                                        <p className="mt-1 text-sm text-gray-500">{product.options.variant_description ?? ''}</p>
                                                                                    ) : null
                                                                                }
                                                                            </div>
                                                                            <p className="ml-4">
                                                                                <CustomCurrencyFormat value={product.price} />
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                    <div className="flex flex-1 items-center justify-between text-sm">
                                                                        <CounterInput size={"sm"} value={product.qty} max={100} onValueChange={(qty: number)=>{
                                                                            product.qty = qty;
                                                                            setItems([...items]);
                                                                            updateCartItem(product);
                                                                        }} />

                                                                        <div className="flex">
                                                                            <button
                                                                                type="button"
                                                                                className="font-medium text-red-600 hover:text-red-500"
                                                                                onClick={(event) => removeCartItem(event, product)}
                                                                            >
                                                                                Remove
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        ))}
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                        <div className="border-t border-gray-200 px-4 py-6 sm:px-6">
                                            <div className="flex justify-between text-base font-medium text-gray-900">
                                                <p>{t('Subtotal')}</p>
                                                <p>
                                                    <CustomCurrencyFormat value={cart.total} />
                                                </p>
                                            </div>
                                            <p className="mt-0.5 text-sm text-gray-500">
                                                {t('Shipping and taxes calculated at checkout.')}
                                            </p>
                                            <div className="mt-6">
                                                <Link
                                                    href={route('checkout')}
                                                    className="flex items-center justify-center rounded-md border border-transparent bg-indigo-600 px-6 py-3 text-base font-medium text-white shadow-sm hover:bg-indigo-700"
                                                    onClick={() => closeCart()}
                                                >
                                                    {t('Checkout')}
                                                </Link>
                                            </div>
                                            <div className="mt-6 flex justify-center text-center text-sm text-gray-500">
                                                <p>
                                                    {t('or')}{' '}
                                                    <button
                                                        type="button"
                                                        className="font-medium text-indigo-600 hover:text-indigo-500"
                                                        onClick={() => closeCart()}
                                                    >
                                                        {t('Continue Shopping')}
                                                        <span aria-hidden="true"> &rarr;</span>
                                                    </button>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </Dialog.Panel>
                            </Transition.Child>
                        </div>
                    </div>
                </div>
            </Dialog>
        </Transition.Root>
    )
}
