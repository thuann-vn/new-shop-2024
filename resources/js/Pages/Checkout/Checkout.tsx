import MasterLayout from "@/Layouts/MasterLayout";
import ProductGallery from "@/Components/Products/ProductGallery";
import {Head, Link} from "@inertiajs/react";
import StarRating from "@/Components/Other/StarRating";
import ProductTabs from "@/Components/Products/ProductTabs";
import CustomCurrencyFormat from "@/Components/CurrencyFormat";
import * as React from "react";
import ProductCartForm from "@/Components/Products/ProductCartForm";
import ProductSlider from "@/Components/Products/ProductSlider";
import CheckoutItems from "@/Components/Checkout/CheckoutItems";
import ShippingMethods from "@/Components/Checkout/ShippingMethods";
import CheckoutForm from "@/Components/Checkout/CheckoutForm";

export default function Checkout({items, subtotal, total, shippingFee, tax}: { items: any, subtotal: number, total: number, shippingFee: number, tax: number }) {
    const breadcrumbs = [
        {id: 1, name: 'Home', href: '/'},
        {id: 2, name: 'Checkout', href: '#'},
    ]

    return (
        <MasterLayout>
            <Head title={"Checkout"}/>
            <div className="pb-10 container mx-auto">
                <div className="flex flex-col items-center border-b bg-white py-4 sm:flex-row">
                    <a href="#" className="text-2xl font-bold text-gray-800">Checkout</a>
                    <div className="mt-4 py-2 text-xs sm:mt-0 sm:ml-auto sm:text-base">
                        <div className="relative">
                            <ul className="relative flex w-full items-center justify-between space-x-2 sm:space-x-4">
                                <li className="flex items-center space-x-3 text-left sm:space-x-4">
                                    <a className="flex h-6 w-6 items-center justify-center rounded-full bg-emerald-200 text-xs font-semibold text-emerald-700" href="#"
                                    ><svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" /></svg
                                    ></a>
                                    <span className="font-semibold text-gray-900">Shop</span>
                                </li>
                                <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                                </svg>
                                <li className="flex items-center space-x-3 text-left sm:space-x-4">
                                    <a className="flex h-6 w-6 items-center justify-center rounded-full bg-gray-600 text-xs font-semibold text-white ring ring-gray-600 ring-offset-2" href="#">2</a>
                                    <span className="font-semibold text-gray-900">Shipping</span>
                                </li>
                                <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                                </svg>
                                <li className="flex items-center space-x-3 text-left sm:space-x-4">
                                    <a className="flex h-6 w-6 items-center justify-center rounded-full bg-gray-400 text-xs font-semibold text-white" href="#">3</a>
                                    <span className="font-semibold text-gray-500">Payment</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div className="grid lg:grid-cols-2">
                    <div className="px-4 pt-8">
                        <CheckoutItems items={items}/>
                        <ShippingMethods items={items}/>
                    </div>
                    <CheckoutForm subtotal={subtotal} total={total} shippingFee={shippingFee} tax={tax}/>
                </div>
            </div>
        </MasterLayout>
    )
}
