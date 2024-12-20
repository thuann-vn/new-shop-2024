import * as React from "react";
import CustomCurrencyFormat from "@/Components/CurrencyFormat";
import {useTranslation} from "react-i18next";

export default function CheckoutItems({items} : {items:any[]}) {
    const {t} = useTranslation();
    return (
        <>
            <p className="text-xl font-medium">{t('Order Summary')}</p>
            <p className="text-gray-400">
                {t('Review items in your cart.')}
            </p>
            <div className="mt-3 space-y-2 bg-white">
                {
                    items.map((item, index) => {
                        return (
                            <div className="flex flex-col rounded-lg bg-white sm:flex-row" key={index}>
                                <img className="h-24 w-28 rounded-md border object-cover object-center" src={item.options.image} alt="" />
                                <div className="flex w-full flex-col px-4 py-4">
                                    <a href={item.options.href} className="font-semibold">{item.name}</a>
                                    {
                                        item.options.variant_description ? (
                                            <p className="text-sm text-gray-400">{item.options.variant_description}</p>
                                        ) : null
                                    }
                                    <p className="text-lg font-bold">
                                        <CustomCurrencyFormat value={item.price} /> <span className={'text-sm text-gray-400'}>x {item.qty}</span>
                                    </p>
                                </div>
                            </div>
                        )
                    })
                }
            </div>
        </>
    )
}
