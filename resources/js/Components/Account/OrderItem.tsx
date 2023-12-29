import {classNames, formatDate} from "@/Utils/Helper";
import {Link, router, useForm} from "@inertiajs/react";
import {Fragment, MouseEvent, useContext} from "react";
import {Order, Product} from "@/types";
import axios from "axios";
import {CartContext} from "@/Contexts/CartContext";
import {Menu, Transition} from "@headlessui/react";
import {EllipsisVerticalIcon, ClockIcon} from "@heroicons/react/24/outline";
import {CheckCircleIcon, } from "@heroicons/react/24/solid";
import CustomCurrencyFormat from "@/Components/CurrencyFormat";

export default function OrderItem({order, ...props}: { order:Order }) {
    const {openCart} = useContext(CartContext);
    const _addToCart = (event: React.MouseEvent<HTMLButtonElement>, product: Product) => {
        event.preventDefault();
        axios.post(route('cart.add-to-cart', {id: product.id, qty: 1})).then((response) => {
            router.reload({only: ['cart']})
            openCart();
        });
    }

    const _renderStatusIcon = () =>{
        switch (order.status) {
            case 'pending':
                return  <CheckCircleIcon className="w-5 h-5 text-green-500"
                                         aria-hidden="true"/>
            case 'processing':
                return <CheckCircleIcon className="w-5 h-5 text-green-500"
                                        aria-hidden="true"/>
            case 'completed':
                return <CheckCircleIcon className="w-5 h-5 text-green-500"
                                        aria-hidden="true"/>
            case 'cancelled':
                return <CheckCircleIcon className="w-5 h-5 text-green-500"
                                        aria-hidden="true"/>
            default:
                return <ClockIcon className="w-5 h-5 text-gray-500"
                                        aria-hidden="true"/>
        }
    }

    const _renderStatus = () =>{
        switch (order.status) {
            case 'pending':
                return <p className="ml-2 text-sm font-medium text-gray-500">
                    Pending
                </p>
            case 'processing':
                return <span className="ml-2 text-sm font-medium text-gray-500">
                    Processing
                </span>
            case 'completed':
                return <p className="ml-2 text-sm font-medium text-gray-500">
                    Delivered on <time
                    dateTime={order.created_at}>{formatDate(order.created_at)}</time>
                </p>
            case 'cancelled':
                return <p className="ml-2 text-sm font-medium text-red-500">
                   Cancelled
                </p>
            default:
                return <p className="ml-2 text-sm font-medium text-gray-500">
                    Pending
                </p>
        }
    }

    return (
        <div
            key={order.number}
            className="bg-white border-t border-b border-gray-200 shadow-sm sm:rounded-lg sm:border"
            {...props}
        >
            <h3 className="sr-only">
                Order placed on <time
                dateTime={order.created_at}>{order.created_at}</time>
            </h3>

            <div
                className="flex items-center p-4 border-b border-gray-200 sm:p-6 sm:grid sm:grid-cols-4 sm:gap-x-6">
                <dl className="flex-1 grid grid-cols-2 gap-x-6 text-sm sm:col-span-3 sm:grid-cols-3 lg:col-span-2">
                    <div>
                        <dt className="font-medium text-gray-900">Order number</dt>
                        <dd className="mt-1 text-gray-500">{order.number}</dd>
                    </div>
                    <div className="hidden sm:block">
                        <dt className="font-medium text-gray-900">Date placed</dt>
                        <dd className="mt-1 text-gray-500">
                            <time
                                dateTime={order.created_at}>{formatDate(order.created_at)}</time>
                        </dd>
                    </div>
                    <div>
                        <dt className="font-medium text-gray-900">Total amount</dt>
                        <dd className="mt-1 font-medium text-gray-900">
                            <CustomCurrencyFormat value={order.total_price}/>
                        </dd>
                    </div>
                </dl>

                <Menu as="div" className="relative flex justify-end lg:hidden">
                    <div className="flex items-center">
                        <Menu.Button
                            className="-m-2 p-2 flex items-center text-gray-400 hover:text-gray-500">
                            <span
                                className="sr-only">Options for order {order.number}</span>
                            <EllipsisVerticalIcon className="w-6 h-6"
                                                  aria-hidden="true"/>
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
                            className="origin-bottom-right absolute right-0 mt-2 w-40 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none">
                            <div className="py-1">
                                <Menu.Item>
                                    {({active}) => (
                                        <Link
                                            href={route('profile.order-detail', {id: order.id})}
                                            className={classNames(
                                                active ? 'bg-gray-100 text-gray-900' : 'text-gray-700',
                                                'block px-4 py-2 text-sm'
                                            )}
                                        >
                                            View
                                        </Link>
                                    )}
                                </Menu.Item>
                            </div>
                        </Menu.Items>
                    </Transition>
                </Menu>

                <div
                    className="hidden lg:col-span-2 lg:flex lg:items-center lg:justify-end lg:space-x-4">
                    <Link
                        href={route('profile.order-detail', {id: order.id})}
                        className="flex items-center justify-center bg-white py-2 px-2.5 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                    >
                        <span>View Order</span>
                        <span className="sr-only">{order.number}</span>
                    </Link>
                </div>
            </div>

            {/* Products */}
            <h4 className="sr-only">Items</h4>
            <ul role="list" className="divide-y divide-gray-200">
                {order.items.map((item) => (
                    <li key={item.id} className="p-4 sm:p-6">
                        <div className="flex items-center sm:items-start">
                            <div
                                className="flex-shrink-0 w-20 h-20 bg-gray-200 rounded-lg overflow-hidden sm:w-40 sm:h-40">
                                <img
                                    src={item.product.featured_image_url}
                                    alt={item.product.name}
                                    className="w-full h-full object-center object-cover"
                                />
                            </div>
                            <div className="flex-1 ml-6 text-sm">
                                <div
                                    className="font-medium text-gray-900 sm:flex sm:justify-between">
                                    <h5>{item.product.name}</h5>
                                    <p className="mt-2 sm:mt-0">
                                        <span className={"text-sm text-gray-400"}>{item.qty} x</span> <CustomCurrencyFormat value={item.unit_price}/>
                                    </p>
                                </div>
                                <p className="hidden text-gray-500 sm:block sm:mt-2">{item.product.description}</p>
                            </div>
                        </div>

                        <div className="mt-6 sm:flex sm:justify-between">
                            <div className="flex items-center">
                                {
                                    _renderStatusIcon()
                                }
                                {
                                    _renderStatus()
                                }

                            </div>

                            <div
                                className="mt-6 border-t border-gray-200 pt-4 flex items-center space-x-4 divide-x divide-gray-200 text-sm font-medium sm:mt-0 sm:ml-4 sm:border-none sm:pt-0">
                                <div className="flex-1 flex justify-center">
                                    <Link
                                        href={route('products.detail', {slug: item.product.slug})}
                                        className="text-indigo-600 whitespace-nowrap hover:text-indigo-500"
                                        target="_blank"
                                    >
                                        View product
                                    </Link>
                                </div>
                                <div className="flex-1 pl-4 flex justify-center">
                                    <button type="button"
                                            onClick={(e) => _addToCart(e, item.product)}
                                            className="text-indigo-600 whitespace-nowrap hover:text-indigo-500">
                                        Buy again
                                    </button>
                                </div>
                            </div>
                        </div>
                    </li>
                ))}
            </ul>
        </div>
    )
}
