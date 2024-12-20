import {useState} from 'react'
import {Product, ProductCategory, ProductVariant} from "@/types";
import ProductGallery from "@/Components/Products/ProductGallery";
import ProductTabs from "@/Components/Products/ProductTabs";
import CustomCurrencyFormat from "@/Components/CurrencyFormat";
import * as React from "react";
import ProductCartForm from "@/Components/Products/ProductCartForm";
import ProductSlider from "@/Components/Products/ProductSlider";
import Breadcrumb from "@/Components/Other/Breadcrumb";
import AppHead from "@/Components/Layout/AppHead";
import {useTranslation} from "react-i18next";

export default function ProductDetail({product, productVariants, productOptions, productAttributes, images, relatedProducts, firstCategory}: { product: Product, productOptions:any, productVariants: any, productAttributes:any, images: any, relatedProducts: any, firstCategory: ProductCategory }) {
    const {t} = useTranslation();
    let breadcrumbs = [
        {id: 1, name: t('Home'), href: '/'},
    ]
    if (firstCategory) {
        breadcrumbs.push({id: 2, name: firstCategory.name, href: route('shop.category', {slug: firstCategory.slug})})
    }
    breadcrumbs.push({id: 3, name: product.name, href: ''})
    const [selectedVariant, setSelectedVariant] = useState<ProductVariant | null>(null)

    return (
        <>
            <AppHead title={product.name}/>
            <div className="bg-gray-100 pb-10">
                <div className="pt-6">
                    <div className={'container mx-auto px-4 sm:px-6 lg:px-8'}>
                        <Breadcrumb breadcrumbs={breadcrumbs}/>

                        <div className="bg-white p-4 mt-5 rounded-lg">
                            {/* Product name */}
                            <h1 className="text-2xl font-bold tracking-tight text-gray-900 sm:text-3xl">{product.name}</h1>

                            {/* Product extra info */}
                            <div className={"flex items-center text-sm leading-4 mt-3"}>
                                <div className="text-gray-500 border-r border-r-gray-200 pr-3 mr-3">{t('Brand')}: <span className={"text-black"}>{product.brand?.name}</span></div>
                                {/*<div className="flex items-center border-r border-r-gray-200 pr-3 mr-3">*/}
                                {/*    <StarRating value={4}/> <span className={"text-gray-500"}>(117)</span>*/}
                                {/*</div>*/}
                                {
                                    (selectedVariant?.sku || product.sku) && <div className="text-gray-500">{t('SKU')}: <span
                                        className={"text-black"}>{selectedVariant?.sku || product.sku}</span></div>
                                }
                            </div>

                            {/* Product info */}
                            <div
                                className="lg:grid lg:grid-cols-2 lg:grid-rows-[auto,auto,1fr] lg:gap-x-8">
                                {/* Product gallery */}
                                <ProductGallery images={selectedVariant?.media || images}/>

                                {/* Options */}
                                <div className="mt-4 lg:row-span-3 lg:mt-0">
                                    <h2 className="sr-only">{
                                        t('Product information')
                                    }</h2>
                                    <p className="text-3xl tracking-tight text-red-600">
                                        {
                                            product.old_price > product.price &&
                                            <span className={"text-gray-400 text-sm line-through mr-2"}>
                                                <CustomCurrencyFormat value={selectedVariant?.old_price ? selectedVariant.old_price : product.old_price}/>
                                            </span>
                                        }
                                        <CustomCurrencyFormat value={selectedVariant ? selectedVariant.price : product.price} />
                                    </p>
                                    {
                                        (product.has_variants && selectedVariant) || (!product.has_variants && product.qty) ?
                                            <p className="inline-flex mt-3 items-center text-xs uppercase rounded-full bg-green-100 px-2 py-0 text-green-600 leading-6">
                                                {t('In stock')}
                                            </p> :  <p className="inline-flex mt-3 items-center text-xs uppercase rounded-full bg-red-100 px-2 py-0 text-red-600 leading-6">
                                                {t('Out of stock')}
                                        </p>
                                    }


                                    {/*Description*/}
                                    <p className="text-base text-gray-500 mt-3">{product.description}</p>

                                    {/*Add to cart*/}
                                    <ProductCartForm
                                        product={product}
                                        variants={productVariants}
                                        attributes={productAttributes}
                                        options={productOptions}
                                        selectedVariant={selectedVariant}
                                        setSelectedVariant={setSelectedVariant}
                                    />
                                </div>
                            </div>
                        </div>

                        {/* Product tabs */}
                        <ProductTabs product={product}/>

                        {/* Related products */}
                        <ProductSlider products={relatedProducts} title={t("Related Products")} className={"mt-7"}/>
                    </div>
                </div>
            </div>
        </>
    )
}
