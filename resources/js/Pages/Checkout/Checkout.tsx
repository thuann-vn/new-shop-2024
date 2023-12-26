import MasterLayout from "@/Layouts/MasterLayout";
import {Head, Link} from "@inertiajs/react";
import CustomCurrencyFormat from "@/Components/CurrencyFormat";
import * as React from "react";
import CheckoutItems from "@/Components/Checkout/CheckoutItems";
import ShippingMethods from "@/Components/Checkout/ShippingMethods";
import CheckoutForm from "@/Components/Checkout/CheckoutForm";
import axios from "axios";
import {FormEvent} from "react";
import PrimaryButton from "@/Components/Form/PrimaryButton";
import PaymentMethods from "@/Components/Checkout/PaymentMethods";
import CheckoutSteps from "@/Components/Checkout/CheckoutSteps";
import Alert from "@/Components/Form/Alert";

export default function Checkout({items, subtotal, total, shippingFee, tax, shippingMethods, paymentMethods}:
                                     { items: any, subtotal: number, total: number, shippingFee: number, tax: number, shippingMethods: object[], paymentMethods: object[] }) {
    const breadcrumbs = [
        {id: 1, name: 'Home', href: '/'},
        {id: 2, name: 'Checkout', href: '#'},
    ]

    const [submitting, setSubmitting] = React.useState(false)
    const [formData, setFormData] = React.useState({
        full_name: '',
        email: '',
        phone: '',
        address: '',
        province: '',
        district: '',
        ward: '',
        shipping_method: '',
        payment_method: '',
        notes: ''
    })
    const [errors, setErrors] = React.useState(null);

    const onSubmit = (e: FormEvent<HTMLFormElement>) => {
        e.preventDefault()
        setSubmitting(true)
        setErrors(null)
        //Post
        axios.post(route('checkout.place-order'), formData)
        .then(response => {
            console.log(response)
        })
        .catch(error => {
            const errorMessage = error.response.data.message;
            setErrors(errorMessage)
            setSubmitting(false)
        }).finally(() => {
            setSubmitting(false)
        })
    }
    return (
        <MasterLayout>
            <Head title={"Checkout"}/>
            {
                items.length > 0 ? (
                    <div className="pb-10 container mx-auto  px-4 sm:px-6 lg:px-8">
                        <div className="flex flex-col items-center border-b bg-white py-4 sm:flex-row">
                            <a href="#" className="text-2xl font-bold text-gray-800">Checkout</a>
                            <div className="mt-4 py-2 text-xs sm:mt-0 sm:ml-auto sm:text-base">
                                <CheckoutSteps/>
                            </div>
                        </div>
                        <form onSubmit={onSubmit}>
                            <div className="grid lg:grid-cols-2 space-x-0 lg:space-x-10">
                                <div className="pt-8">
                                    <div>
                                        {  errors ? <Alert title={"Please check your input information:"} message={errors} />: null}
                                        <CheckoutForm
                                            formData={formData}
                                            setFormData={setFormData}
                                        />
                                        <ShippingMethods methods={shippingMethods} onChange={(value: any) => {
                                            setFormData({
                                                ...formData,
                                                shipping_method: value
                                            })
                                        }}/>

                                        <PaymentMethods methods={paymentMethods} onChange={(value: any) => {
                                            setFormData({
                                                ...formData,
                                                payment_method: value
                                            })
                                        }}/>
                                    </div>
                                </div>
                                <div className="pt-8">
                                    <CheckoutItems items={items}/>
                                    <div className="mt-6 border-t border-b py-2">
                                        <div className="flex items-center justify-between">
                                            <p className="text-sm font-medium text-gray-900">Subtotal</p>
                                            <p className="font-semibold text-gray-900">
                                                <CustomCurrencyFormat value={subtotal}/>
                                            </p>
                                        </div>
                                        <div className="flex items-center justify-between">
                                            <p className="text-sm font-medium text-gray-900">Shipping</p>
                                            <p className="font-semibold text-gray-900">
                                                <CustomCurrencyFormat value={shippingFee ?? 0}/>
                                            </p>
                                        </div>
                                        <div className="flex items-center justify-between">
                                            <p className="text-sm font-medium text-gray-900">Tax</p>
                                            <p className="font-semibold text-gray-900">
                                                <CustomCurrencyFormat value={tax ?? 0}/>
                                            </p>
                                        </div>
                                    </div>
                                    <div className="mt-6 flex items-center justify-between">
                                        <p className="text-sm font-medium text-gray-900">Total</p>
                                        <p className="text-2xl font-semibold text-gray-900">
                                            <CustomCurrencyFormat value={total}/>
                                        </p>
                                    </div>
                                    <PrimaryButton type={"submit"}
                                                   className={"w-full rounded-full items-center justify-center py-3 mt-3 text-[14px]"}
                                                   loading={submitting}>Place Order</PrimaryButton>
                                </div>
                            </div>
                        </form>
                    </div>
                ) : (
                    <div className="flex flex-col items-center justify-center py-[250px] min-h-full">
                        <div
                            className={"bg-gray-200 rounded-full w-[148px] h-[148px] inline-flex items-end overflow-hidden"}>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 280.028 280.028" width="280.028"
                                 height="80.028" className={'text-red-600'}>
                                <path className="c-01" d="M35.004 0h210.02v78.758H35.004V0z" fill="#b7343e"></path>
                                <path className="c-02"
                                      d="M262.527 61.256v201.27c0 9.626-7.876 17.502-17.502 17.502H35.004c-9.626 0-17.502-7.876-17.502-17.502V61.256h245.025z"
                                      fill="currentColor"></path>
                                <path className="c-03"
                                      d="M35.004 70.007h26.253V26.253L35.004 0v70.007zm183.767-43.754v43.754h26.253V0l-26.253 26.253z"
                                      fill="currentColor"></path>
                                <path className="c-04"
                                      d="M61.257 61.256V26.253L17.503 61.256h43.754zm157.514-35.003v35.003h43.754l-43.754-35.003z"
                                      fill="#ab212b"></path>
                                <path className="c-05"
                                      d="M65.632 105.01c-5.251 0-8.751 3.5-8.751 8.751s3.5 8.751 8.751 8.751 8.751-3.5 8.751-8.751c0-5.25-3.5-8.751-8.751-8.751zm148.764 0c-5.251 0-8.751 3.5-8.751 8.751s3.5 8.751 8.751 8.751 8.751-3.5 8.751-8.751c.001-5.25-3.501-8.751-8.751-8.751z"
                                      fill="#c13942"></path>
                                <path className="c-06"
                                      d="M65.632 121.637c5.251 0 6.126 6.126 6.126 6.126 0 39.379 29.753 70.882 68.257 70.882s68.257-31.503 68.257-70.882c0 0 .875-6.126 6.126-6.126s6.126 6.126 6.126 6.126c0 46.38-35.003 83.133-80.508 83.133s-80.508-37.629-80.508-83.133c-.001-.001.874-6.126 6.124-6.126z"
                                      fill="#c13942"></path>
                                <path className="c-07"
                                      d="M65.632 112.886c5.251 0 6.126 6.126 6.126 6.126 0 39.379 29.753 70.882 68.257 70.882s68.257-31.503 68.257-70.882c0 0 .875-6.126 6.126-6.126s6.126 6.126 6.126 6.126c0 46.38-35.003 83.133-80.508 83.133s-80.508-37.629-80.508-83.133c-.001 0 .874-6.126 6.124-6.126z"
                                      fill="#fdfbf7"></path>
                            </svg>
                        </div>
                        <h1 className="font-bold text-red-600 mt-5">YOUR CART IS CURRENTLY EMPTY.</h1>
                        <Link href={"/"} className="mt-4 px-8 py-3 bg-main-900 text-white rounded-full">Return to
                            shop</Link>
                    </div>
                )
            }
        </MasterLayout>
    )
}
