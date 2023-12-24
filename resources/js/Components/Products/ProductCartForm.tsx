import CounterInput from "@/Components/Other/CounterInput";
import PrimaryButton from "@/Components/Form/PrimaryButton";
import * as React from "react";
import {useContext, useEffect, useState} from "react";
import {CartContext} from "@/Contexts/CartContext";
import axios from "axios";
import {router} from "@inertiajs/react";

export default function ProductCartForm({product} : {product: any}){
    const {openCart} = useContext(CartContext);
    const [quantity, setQuantity] = useState(1)
    const [addToCartLoading, setAddToCartLoading] = useState(false);
    const _addProductToCart = (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
        e.preventDefault();
        e.stopPropagation();
        setAddToCartLoading(true)
        axios.post(route('cart.add-to-cart', {id: product.id, qty: quantity}))
            .then((response) => {
                openCart();
                router.reload({only: ['cart']})
            }).finally(() => {
            setAddToCartLoading(false)
        })
    }
    return (
        <form className="mt-10">
            <div className="flex items-center mt-10">
                <CounterInput value={quantity} onValueChange={setQuantity}/>
                <PrimaryButton className={"w-full rounded-full text-center justify-center py-3 ms-5"}
                               loading={addToCartLoading}
                               disabled={addToCartLoading}
                               onClick={_addProductToCart}>
                    Add to bag
                </PrimaryButton>
            </div>
        </form>
    )
}
