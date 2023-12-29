import * as React from "react";
import {classNames} from "@/Utils/Helper";

export default function CheckoutSteps({step = 2}: { step: number }){
    return (
        <div className="relative">
            <ul className="relative flex w-full items-center justify-between space-x-2 sm:space-x-4">
                <li className="flex items-center space-x-3 text-left sm:space-x-4">
                    <span className="flex h-6 w-6 items-center justify-center rounded-full bg-emerald-200 text-xs font-semibold text-emerald-700"
                    >
                        <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M5 13l4 4L19 7"/>
                        </svg>
                    </span>
                    <span className="font-semibold text-gray-900">Shop</span>
                </li>
                <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4 text-gray-400"
                     fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"/>
                </svg>
                <li className="flex items-center space-x-3 text-left sm:space-x-4">
                    <span className={
                        classNames("flex h-6 w-6 items-center justify-center rounded-full",
                            step == 2 ? 'bg-gray-600 text-xs font-semibold text-white ring ring-gray-600 ring-offset-2' : '',
                            step > 2 ? 'bg-emerald-200 text-xs font-semibold text-emerald-700' : '',
                            )
                    }>
                        {
                            step == 2 ? 2 : <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4" fill="none"
                                                 viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M5 13l4 4L19 7"/>
                            </svg>
                        }
                    </span>
                    <span className="font-semibold text-gray-900">Place Order</span>
                </li>
                <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4 text-gray-400"
                     fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"/>
                </svg>
                <li className="flex items-center space-x-3 text-left sm:space-x-4">
                    <span className={
                        classNames("flex h-6 w-6 items-center justify-center rounded-full",
                            step == 3 ? 'bg-gray-600 text-xs font-semibold text-white ring ring-gray-600 ring-offset-2' : '',
                            )
                    }>3</span>
                    <span className="font-semibold text-gray-500">Summary</span>
                </li>
            </ul>
        </div>
    )
}
