import Layout from "@/Layouts/Layout";
import {Head, Link} from "@inertiajs/react";
import * as React from "react";
import CheckoutSteps from "@/Components/Checkout/CheckoutSteps";
import CustomCurrencyFormat from "@/Components/CurrencyFormat";
import {Order} from "@/types";
export default function OrderSummary({order}:{ order:Order }) {
    return (
        <>
            <Head title={"Checkout"}/>
            <div className="pb-10 container mx-auto  px-4 sm:px-6 lg:px-8">
                <div className="flex flex-col items-center border-b bg-white py-4 sm:flex-row">
                    <a href="#" className="text-2xl font-bold text-gray-800">Checkout</a>
                    <div className="mt-4 py-2 text-xs sm:mt-0 sm:ml-auto sm:text-base">
                        <CheckoutSteps step={3}/>
                    </div>
                </div>
                <div className="mt-6">
                    <h1 className="text-sm font-semibold uppercase tracking-wide text-main-600">Thank you!</h1>
                    <p className="mt-2 text-4xl font-extrabold tracking-tight sm:text-5xl">Your order is placed!</p>
                    <p className="mt-2 text-base text-gray-500">Your order #{order.number} has been placed and will be processed as soon as possible.</p>

                    <dl className="mt-12 text-sm font-medium">
                        <dt className="text-gray-900">Tracking number</dt>
                        <dd className="text-main-600 mt-2">{order.number}</dd>
                    </dl>
                </div>

                <section aria-labelledby="order-heading" className="mt-10 border-t border-gray-200">
                    <h2 id="order-heading" className="sr-only">
                        Your order
                    </h2>

                    <h3 className="sr-only">Items</h3>
                    {order.items.map((item) => (
                        <div key={item.id} className="py-10 border-b border-gray-200 flex space-x-6">
                            <img
                                src={item.product.featured_image_url}
                                alt={item.product.name}
                                className="flex-none w-20 h-20 object-center object-cover bg-gray-100 rounded-lg sm:w-40 sm:h-40"
                            />
                            <div className="flex-auto flex flex-col">
                                <div>
                                    <h4 className="font-medium text-gray-900">
                                        <Link target={"_blank"} href={route('products.detail', {slug: item.product.slug})}>{item.product.name}</Link>
                                    </h4>
                                    {
                                        item.shop_variant_name ? (
                                            <p className="text-sm text-gray-400">{item.shop_variant_name}</p>
                                        ) : null
                                    }
                                    <p className="mt-2 text-sm text-gray-600">{item.product.description}</p>
                                </div>
                                <div className="mt-6 flex-1 flex items-end">
                                    <dl className="flex text-sm divide-x divide-gray-200 space-x-4 sm:space-x-6">
                                        <div className="flex">
                                            <dt className="font-medium text-gray-900">Quantity</dt>
                                            <dd className="ml-2 text-gray-700">{item.qty}</dd>
                                        </div>
                                        <div className="pl-4 flex sm:pl-6">
                                            <dt className="font-medium text-gray-900">Price</dt>
                                            <dd className="ml-2 text-gray-700">
                                                <CustomCurrencyFormat value={item.unit_price}/>
                                            </dd>
                                        </div>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    ))}

                    <div className="sm:ml-40 sm:pl-6">
                        <h3 className="sr-only">Your information</h3>

                        <h4 className="sr-only">Addresses</h4>
                        <dl className="grid grid-cols-2 gap-x-6 text-sm py-10">
                            <div>
                                <dt className="font-medium text-gray-900">Shipping address</dt>
                                <dd className="mt-2 text-gray-700">
                                    <address className="not-italic">
                                        <span className="block">{order.address[0]?.name}</span>
                                        <span className="block">{order.address[0]?.street}</span>
                                        <span className="block">{[order.address[0]?.ward, order.address[0]?.district, order.address[0]?.province].join(', ')}</span>
                                    </address>
                                </dd>
                            </div>
                        </dl>

                        <h4 className="sr-only">Payment</h4>
                        <dl className="grid grid-cols-2 gap-x-6 border-t border-gray-200 text-sm py-10">
                            <div>
                                <dt className="font-medium text-gray-900">Payment method</dt>
                                <dd className="mt-2 text-gray-700">
                                    <p>{order.payment_method_detail?.name}</p>
                                    <p>{order.payment_method_detail?.description}</p>
                                </dd>
                            </div>
                            <div>
                                <dt className="font-medium text-gray-900">Shipping method</dt>
                                <dd className="mt-2 text-gray-700">
                                    <p>{order.shipping_method_detail?.name}</p>
                                    <p>{order.shipping_method_detail?.description}</p>
                                </dd>
                            </div>
                        </dl>

                        <h3 className="sr-only">Summary</h3>

                        <dl className="space-y-6 border-t border-gray-200 text-sm pt-10">
                            <div className="flex justify-between">
                                <dt className="font-medium text-gray-900">Subtotal</dt>
                                <dd className="text-gray-700">
                                    <CustomCurrencyFormat value={order.total_price}/>
                                </dd>
                            </div>
                            {
                                order.discount > 0 && (
                                    <div className="flex justify-between">
                                        <dt className="flex font-medium text-gray-900">
                                            Discount
                                            <span className="rounded-full bg-gray-200 text-xs text-gray-600 py-0.5 px-2 ml-2">STUDENT50</span>
                                        </dt>
                                        <dd className="text-gray-700">-$18.00 (50%)</dd>
                                    </div>
                                )
                            }

                            <div className="flex justify-between">
                                <dt className="font-medium text-gray-900">Shipping</dt>
                                <dd className="text-gray-700">
                                    <CustomCurrencyFormat value={order.shipping_price}/>
                                </dd>
                            </div>

                            <div className="flex justify-between">
                                <dt className="font-medium text-gray-900">Tax</dt>
                                <dd className="text-gray-700">
                                    <CustomCurrencyFormat value={order.tax}/>
                                </dd>
                            </div>
                            <div className="flex justify-between">
                                <dt className="font-medium text-gray-900">Total</dt>
                                <dd className="text-gray-900">
                                    <CustomCurrencyFormat value={parseFloat(String(order.tax)) + parseFloat(String(order.shipping_price)) + parseFloat(String(order.total_price))}/>
                                </dd>
                            </div>
                        </dl>
                    </div>
                </section>
            </div>
        </>
    )
}
