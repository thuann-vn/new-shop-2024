import * as React from "react";
import CustomCurrencyFormat from "@/Components/CurrencyFormat";
import CheckoutItems from "@/Components/Checkout/CheckoutItems";
import {useTranslation} from "react-i18next";

export default function ShippingMethods({methods, onChange} : {methods:any[], onChange: any}) {
    const {t} = useTranslation()
    return (
        <div>
            <p className="mt-8 text-lg font-medium">{t('Shipping Method')}</p>
            <div className="mt-5 grid grid-cols-2 gap-6">
                {
                    methods.map((method, index) => (
                        <div className="relative" key={index}>
                            <input className="peer hidden"
                                   id={`shipping_method_${index}`}
                                   type="radio"
                                   name="shipping_method"
                                   value={method.code}
                                   onClick={(e)=> onChange(method)}
                            />
                            <span className="peer-checked:border-main-700 absolute right-4 top-1/2 box-content block h-3 w-3 -translate-y-1/2 rounded-full border-8 border-gray-300 bg-white"></span>
                            <label className="peer-checked:border-2 peer-checked:border-main-700 peer-checked:bg-main-50 flex cursor-pointer select-none rounded-lg border border-gray-300 p-4 pr-10"
                                   htmlFor={`shipping_method_${index}`}>
                                <div className="ml-5">
                                    <span className="mt-2 font-semibold">{method.name}</span>
                                    <p className="text-slate-500 text-sm leading-6">{method.description}</p>
                                </div>
                            </label>
                        </div>
                    ))
                }
            </div>
        </div>
    )
}
