import CounterInput from "@/Components/Other/CounterInput";
import PrimaryButton from "@/Components/Form/PrimaryButton";
import * as React from "react";
import {useContext, useEffect, useState} from "react";
import {CartContext} from "@/Contexts/CartContext";
import axios from "axios";
import {router} from "@inertiajs/react";
import ProductVariants from "@/Components/Products/ProductVariants";
import {Product} from "@/types";
import {useTranslation} from "react-i18next";

export default function ProductCartForm({product, selectedVariant, setSelectedVariant, variants, options, attributes}: {
    product: Product,
    variants: any,
    attributes: any,
    options: any,
    selectedVariant: any,
    setSelectedVariant: any
}) {
    const {openCart} = useContext(CartContext);
    const [quantity, setQuantity] = useState(1)
    const [addToCartLoading, setAddToCartLoading] = useState(false);
    const {t} = useTranslation();
    const _addProductToCart = (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
        e.preventDefault();
        e.stopPropagation();
        setAddToCartLoading(true)
        axios.post(route('cart.add-to-cart', {id: product.id, qty: quantity, variant_id: selectedVariant?.id ?? null}))
            .then((response) => {
                openCart();
                router.reload({only: ['cart']})
            }).finally(() => {
            setAddToCartLoading(false)
        })
    }
    return (
        <form className="mt-10">
            {
                product.has_variants ? (
                    <ProductVariants
                        product={product}
                        attributes={attributes}
                        options={options}
                        onVariantChange={(variant: any) => {
                            setSelectedVariant(variant)
                        }}/>
                ) : null
            }
            <div className="flex items-center mt-10">
                <CounterInput
                    value={quantity}
                    onValueChange={setQuantity}
                    max={product.has_variants ? (selectedVariant?.qty ?? 0) : product.qty}
                />
                <PrimaryButton className={"w-full rounded-full text-center justify-center py-3 ms-5"}
                               loading={addToCartLoading}
                               disabled={addToCartLoading || (product.has_variants && (!selectedVariant || !selectedVariant.qty)) || (!product.has_variants && !product.qty)}
                               onClick={_addProductToCart}>
                    {t('Add to bag')}
                </PrimaryButton>
            </div>
        </form>
    )
}
