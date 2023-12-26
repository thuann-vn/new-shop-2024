import * as React from "react";
import CustomCurrencyFormat from "@/Components/CurrencyFormat";
import CheckoutItems from "@/Components/Checkout/CheckoutItems";
import {imageStorageUrl} from "@/Utils/Helper";

export default function PaymentMethods({methods, onChange} : {methods:any[], onChange: any}) {
    return (
        <div>
            <p className="mt-8 text-lg font-medium">Payment Methods</p>
            <div className="mt-5 gap-6">
                {
                    methods.map((method, index) => (
                        <div className="relative mb-3" key={index}>
                            <input className="peer hidden"
                                   id={`payment_method_${index}`}
                                   type="radio"
                                   name="payment_method"
                                   value={method.code}
                                   onClick={(e)=> onChange(method.code)}
                            />
                            <span className="peer-checked:border-main-700 absolute right-4 top-1/2 box-content block h-3 w-3 -translate-y-1/2 rounded-full border-8 border-gray-300 bg-white"></span>
                            <label className="peer-checked:border-2 peer-checked:border-main-700 peer-checked:bg-main-50 flex cursor-pointer select-none rounded-lg border border-gray-300 p-4 pr-20"
                                   htmlFor={`payment_method_${index}`}>
                                <img className="h-12 w-12 rounded-md object-cover object-center" src={imageStorageUrl(method.image)} alt="" />
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
