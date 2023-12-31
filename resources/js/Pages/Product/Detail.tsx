import {useContext, useEffect, useState} from 'react'
import Layout from "@/Layouts/Layout";
import {PageProps} from "@/types";
import ProductGallery from "@/Components/Products/ProductGallery";
import StarRating from "@/Components/Other/StarRating";
import ProductTabs from "@/Components/Products/ProductTabs";
import CustomCurrencyFormat from "@/Components/CurrencyFormat";
import * as React from "react";
import ProductCartForm from "@/Components/Products/ProductCartForm";
import ProductSlider from "@/Components/Products/ProductSlider";
import Breadcrumb from "@/Components/Other/Breadcrumb";
import AppHead from "@/Components/Layout/AppHead";

export default function ProductDetail({product, images, relatedProducts, firstCategory}: { product: any, images: any, relatedProducts: any, firstCategory: any }) {
    let breadcrumbs = [
        {id: 1, name: 'Home', href: '/'},
    ]
    if (firstCategory) {
        breadcrumbs.push({id: 2, name: firstCategory.name, href: route('shop.category', {slug: firstCategory.slug})})
    }
    breadcrumbs.push({id: 3, name: product.name, href: ''})

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
                                <div className="text-gray-500 border-r border-r-gray-200 pr-3 mr-3">Brands: <span className={"text-black"}>{product.brand?.name}</span></div>
                                <div className="flex items-center border-r border-r-gray-200 pr-3 mr-3">
                                    <StarRating value={4}/> <span className={"text-gray-500"}>(117)</span>
                                </div>
                                <div className="text-gray-500">SKU: <span className={"text-black"}>{product.sku}</span></div>
                            </div>

                            {/* Product info */}
                            <div
                                className="lg:grid lg:grid-cols-2 lg:grid-rows-[auto,auto,1fr] lg:gap-x-8">
                                {/* Product gallery */}
                                <ProductGallery images={images}/>

                                {/* Options */}
                                <div className="mt-4 lg:row-span-3 lg:mt-0">
                                    <h2 className="sr-only">Product information</h2>
                                    <p className="text-3xl tracking-tight text-red-600">
                                        {
                                            product.old_price > product.price &&
                                            <span className={"text-gray-400 text-sm line-through mr-2"}><CustomCurrencyFormat
                                                value={product.old_price}/></span>
                                        }
                                        <CustomCurrencyFormat value={product.price} />
                                    </p>
                                    <p className="inline-flex mt-3 items-center text-xs uppercase rounded-full bg-green-100 px-2 py-0 text-green-600 leading-6">
                                        In stock
                                    </p>

                                    {/*Description*/}
                                    <p className="text-base text-gray-500 mt-3">{product.description}</p>

                                    {/*Add to cart*/}
                                    <ProductCartForm product={product}/>
                                </div>
                            </div>
                        </div>

                        {/* Product tabs */}
                        <ProductTabs product={product}/>

                        {/* Related products */}
                        <ProductSlider products={relatedProducts} title={"Related Products"} className={"mt-7"}/>
                    </div>
                </div>
            </div>
        </>
    )
}
