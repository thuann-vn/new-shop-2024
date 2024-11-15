import Layout from "@/Layouts/Layout";
import {Head, Link, router} from "@inertiajs/react";
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
import {useTranslation} from "react-i18next";

export default function Checkout({items, subtotal, total, tax, shippingMethods, paymentMethods}:
                                     { items: any, subtotal: number, total: number, tax: number, shippingMethods: object[], paymentMethods: object[] }) {
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
    const [shippingFee, setShippingFee] = React.useState(0)

    const {t} = useTranslation();
    const onSubmit = (e: FormEvent<HTMLFormElement>) => {
        e.preventDefault()
        setSubmitting(true)
        setErrors(null)
        //Post
        axios.post(route('checkout.place-order'), formData)
            .then(response => {
                if (response.data.id) {
                    router.visit(route('checkout.order-summary'))
                } else {
                    setErrors(response.data.message)
                    setSubmitting(false)
                }
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
        <>
            <Head title={t("Checkout")}/>
            {
                items.length > 0 ? (
                    <div className="mt-10 pb-10 container mx-auto  px-4 sm:px-6 lg:px-8">
                        <div className="flex flex-col items-center border-b bg-white py-4 sm:flex-row">
                            <a href="#" className="text-2xl font-bold text-gray-800">
                                {t('Checkout')}
                            </a>
                            <div className="mt-4 py-2 text-xs sm:mt-0 sm:ml-auto sm:text-base">
                                <CheckoutSteps step={2}/>
                            </div>
                        </div>
                        <form onSubmit={onSubmit}>
                            <div className="grid lg:grid-cols-2 space-x-0 lg:space-x-10">
                                <div className="pt-8">
                                    <div>
                                        {errors ? <Alert title={"Please check your input information:"}
                                                         message={errors}/> : null}
                                        <CheckoutForm
                                            formData={formData}
                                            setFormData={setFormData}
                                        />
                                        <ShippingMethods methods={shippingMethods} onChange={(value: any) => {
                                            setFormData({
                                                ...formData,
                                                shipping_method: value.code
                                            })
                                            setShippingFee(value.price)
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
                                            <p className="text-sm font-medium text-gray-900">{t('Subtotal')}</p>
                                            <p className="font-semibold text-gray-900">
                                                <CustomCurrencyFormat value={subtotal}/>
                                            </p>
                                        </div>
                                        <div className="flex items-center justify-between">
                                            <p className="text-sm font-medium text-gray-900">{t('Shipping')}</p>
                                            <p className="font-semibold text-gray-900">
                                                <CustomCurrencyFormat value={shippingFee ?? 0}/>
                                            </p>
                                        </div>
                                        {
                                            tax > 0 ? (
                                                <div className="flex items-center justify-between">
                                                    <p className="text-sm font-medium text-gray-900">Tax</p>
                                                    <p className="font-semibold text-gray-900">
                                                        <CustomCurrencyFormat value={tax ?? 0}/>
                                                    </p>
                                                </div>
                                            ) : null
                                        }
                                    </div>
                                    <div className="mt-6 flex items-center justify-between">
                                        <p className="text-sm font-medium text-gray-900">Total</p>
                                        <p className="text-2xl font-semibold text-gray-900">
                                            <CustomCurrencyFormat
                                                value={parseFloat(String(total)) + parseFloat(String(shippingFee))}/>
                                        </p>
                                    </div>
                                    <PrimaryButton type={"submit"}
                                                   className={"w-full rounded-full items-center justify-center py-3 mt-3 text-[14px]"}
                                                   loading={submitting}>{t('Place Order')}</PrimaryButton>
                                </div>
                            </div>
                        </form>
                    </div>
                ) : (
                    <div className="flex flex-col items-center justify-center py-[100px] min-h-full">
                        <div
                            className={"bg-gray-200 rounded-full w-[148px] h-[148px] p-[20px] inline-flex items-end overflow-hidden"}>
                            <img src={"/svg/empty-cart.svg"} alt={"Empty cart"} className={"w-full h-full"}/>
                        </div>
                        <h1 className="font-bold text-main-500 mt-5">{t('YOUR CART IS CURRENTLY EMPTY.')}</h1>
                        <Link href={"/"} className="mt-4 px-8 py-3 bg-main-500 text-white rounded-full">{t('Return to shop')}</Link>
                    </div>
                )
            }
        </>
    )
}
