import * as React from "react";
import CustomCurrencyFormat from "@/Components/CurrencyFormat";
import { Combobox } from '@headlessui/react'
import Select from "@/Components/Form/Select";
import axios from "axios";
import {useEffect} from "react";

export default function CheckoutForm({subtotal, total, shippingFee, tax}: { subtotal: number, total: number, shippingFee: number, tax: number }) {
    const [provinceCode, setProvinceCode] = React.useState(null)

    const [provinces, setProvinces] = React.useState([])
    const [selectedProvince, setSelectedProvince] = React.useState(null)

    const [districts, setDistricts] = React.useState([])
    const [selectedDistrict, setSelectedDistrict] = React.useState(null)

    const [wards, setWards] = React.useState([])
    const [selectedWard, setSelectedWard] = React.useState(null)

    useEffect(() => {
        loadProvinces()
    }, []);

    const loadProvinces = () => {
        axios.get(route('checkout.get-provinces'))
            .then(response => {
                console.log(response)
                setProvinces(response.data.data.map((province: { code: any; full_name: any; }) => {
                    return {
                        value: province.code,
                        label: province.full_name
                    }
                }))
            })
    }

    return (
        <form id={"checkoutForm"} className="mt-10 bg-gray-50 px-4 pt-8 lg:mt-0">
            <p className="text-xl font-medium">Payment Details</p>
            <p className="text-gray-400">Complete your order by providing your payment details.</p>
            <div className="">
                <label htmlFor="card-holder" className="mt-4 mb-2 block text-sm font-medium">Your name</label>
                <div className="relative">
                    <input type="text" id="card-holder" name="card-holder" className="w-full rounded-md border border-gray-200 px-4 py-3 pl-11 text-sm capitalize shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
                           placeholder="Your full name" />
                    <div className="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">
                        <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 9h3.75M15 12h3.75M15 15h3.75M4.5 19.5h15a2.25 2.25 0 002.25-2.25V6.75A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25v10.5A2.25 2.25 0 004.5 19.5zm6-10.125a1.875 1.875 0 11-3.75 0 1.875 1.875 0 013.75 0zm1.294 6.336a6.721 6.721 0 01-3.17.789 6.721 6.721 0 01-3.168-.789 3.376 3.376 0 016.338 0z" />
                        </svg>
                    </div>
                </div>
                <label htmlFor="phone" className="mt-4 mb-2 block text-sm font-medium">Phone number</label>
                <div className="relative">
                    <input type="text" id="phone" name="phone" className="w-full rounded-md border border-gray-200 px-4 py-3 pl-11 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500" placeholder="0901234567" />
                    <div className="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" className="h-4 w-4 text-gray-400">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 1.5H8.25A2.25 2.25 0 0 0 6 3.75v16.5a2.25 2.25 0 0 0 2.25 2.25h7.5A2.25 2.25 0 0 0 18 20.25V3.75a2.25 2.25 0 0 0-2.25-2.25H13.5m-3 0V3h3V1.5m-3 0h3m-3 18.75h3" />
                        </svg>
                    </div>
                </div>

                <label htmlFor="email" className="mt-4 mb-2 block text-sm font-medium">Email</label>
                <div className="relative">
                    <input type="text" id="email" name="email" className="w-full rounded-md border border-gray-200 px-4 py-3 pl-11 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500" placeholder="your.email@gmail.com" />
                    <div className="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">
                        <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207" />
                        </svg>
                    </div>
                </div>

                <label htmlFor="billing-address" className="mt-4 mb-2 block text-sm font-medium">Billing Address</label>
                <div className="flex flex-col sm:flex-row">
                    <div className="relative w-full">
                        <input type="text" id="billing-address" name="billing-address" className="w-full rounded-md border border-gray-200 px-4 py-3 pl-11 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500" placeholder="Street Address" />
                        <div className="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="h-4 w-4 text-gray-400">
                                <path strokeLinecap="round" strokeLinejoin="round" d="m2.25 12 8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25" />
                            </svg>
                        </div>
                    </div>
                </div>

                <div className="flex flex-col sm:flex-row mt-4 ">
                    <Select value={selectedProvince}
                            onChange={setSelectedProvince}
                            options={provinces}
                            className={'w-full'}
                            placeholder={'Select province'}
                    />

                    <Select value={selectedProvince}
                            onChange={setSelectedProvince}
                            options={provinces}
                            className={'w-full mx-2'}
                            placeholder={'Select district'}
                    />

                    <Select value={selectedProvince}
                            onChange={setSelectedProvince}
                            options={provinces}
                            className={'w-full'}
                            placeholder={'Select ward'}
                    />
                    {/*<Select value={selectedPerson}*/}
                    {/*        onChange={setSelectedPerson}*/}
                    {/*        options={people}*/}
                    {/*        className={'w-full mx-2'}*/}
                    {/*/>*/}
                    {/*<Select value={selectedPerson}*/}
                    {/*        onChange={setSelectedPerson}*/}
                    {/*        options={people}*/}
                    {/*        className={'w-full'}*/}
                    {/*/>*/}
                </div>

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
                            <CustomCurrencyFormat value={shippingFee}/>
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
            </div>
            <button className="mt-4 mb-8 w-full rounded-md bg-gray-900 px-6 py-3 font-medium text-white">Place Order</button>
        </form>
    )
}
