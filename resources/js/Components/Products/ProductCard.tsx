import * as React from "react";
import CustomCurrencyFormat from "@/Components/CurrencyFormat";
export default function ProductCard({product}) {
    return (
        <div className="bg-white border border-transparent border-r-gray-200 ">
            <div className={"relative d-flex flex-column justify-content-center align-items-center"}>
                <div className={"relative p-[20px]"}>
                    <img src={product.imageSrc} alt="" className="w-full"/>
                    <div className="absolute top-0 left-0 h-full w-full flex items-center justify-center">
                        <svg xmlns="http://www.w3.org/2000/svg" className={"w-[14px]"} viewBox="0 0 512 512"><path d="M128 32V0H16C7.163 0 0 7.163 0 16v112h32V54.56L180.64 203.2l22.56-22.56L54.56 32H128zM496 0H384v32h73.44L308.8 180.64l22.56 22.56L480 54.56V128h32V16c0-8.837-7.163-16-16-16zM480 457.44L331.36 308.8l-22.56 22.56L457.44 480H384v32h112c8.837 0 16-7.163 16-16V384h-32v73.44zM180.64 308.64L32 457.44V384H0v112c0 8.837 7.163 16 16 16h112v-32H54.56L203.2 331.36l-22.56-22.72z"></path></svg>
                    </div>
                </div>
                <div className={"p-[20px] pt-0"}>
                    <h3 className="mt-4 font-bold text-gray-600 line-clamp-2 min-h-[48px]">{product.name}</h3>
                    <p className="mt-1 text-lg font-medium text-red-600">
                        <span className={"text-gray-400 text-sm line-through mr-2"}>{product.oldPrice}</span>
                        <CustomCurrencyFormat  value={product.price}/>
                    </p>
                    <button className={"mt-3 w-full py-1 text-center text-black text-sm bg-yellow-400 hover:bg-yellow-700 rounded-full"}>
                        Add to cart
                    </button>
                </div>
            </div>
        </div>
    )
}
