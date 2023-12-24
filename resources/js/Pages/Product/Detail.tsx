import {useContext, useEffect, useState} from 'react'
import MasterLayout from "@/Layouts/MasterLayout";
import {PageProps} from "@/types";
import ProductGallery from "@/Components/Products/ProductGallery";
import {Head, Link} from "@inertiajs/react";
import StarRating from "@/Components/Other/StarRating";
import ProductTabs from "@/Components/Products/ProductTabs";
import CustomCurrencyFormat from "@/Components/CurrencyFormat";
import * as React from "react";
import ProductCartForm from "@/Components/Products/ProductCartForm";

export default function ProductDetail({product, images}: PageProps) {
    const breadcrumbs = [
        {id: 1, name: 'Home', href: '/'},
        {id: 2, name: 'Products', href: '#'},
    ]

    return (
        <MasterLayout>
            <Head title={product.name}/>
            <div className="bg-gray-100">
                <div className="pt-6">
                    <div className={'container mx-auto px-4 sm:px-6 lg:px-8'}>
                        <nav aria-label="Breadcrumb">
                            <ol role="list"
                                className="mx-auto flex items-center space-x-2">
                                {breadcrumbs.map((breadcrumb) => (
                                    <li key={breadcrumb.id}>
                                        <div className="flex items-center">
                                            <Link href={breadcrumb.href} className="mr-2 text-sm font-medium text-gray-900">
                                                {breadcrumb.name}
                                            </Link>
                                            <svg
                                                width={16}
                                                height={20}
                                                viewBox="0 0 16 20"
                                                fill="currentColor"
                                                aria-hidden="true"
                                                className="h-5 w-4 text-gray-300"
                                            >
                                                <path d="M5.697 4.34L8.98 16.532h1.327L7.025 4.341H5.697z"/>
                                            </svg>
                                        </div>
                                    </li>
                                ))}
                                <li className="text-sm">
                                    <a href={product.href} aria-current="page"
                                       className="font-medium text-gray-500 hover:text-gray-600">
                                        {product.name}
                                    </a>
                                </li>
                            </ol>
                        </nav>

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
                                className="pb-16 pt-10 lg:grid lg:grid-cols-2 lg:grid-rows-[auto,auto,1fr] lg:gap-x-8 lg:pb-24 lg:pt-16">
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
                                    <span className="inline-flex mt-3 items-center text-xs uppercase rounded-full bg-green-100 px-2 py-0 text-green-600 leading-6">
                                        In stock
                                    </span>

                                    {/*Add to cart*/}
                                    <ProductCartForm product={product}/>
                                </div>
                            </div>
                        </div>

                        <ProductTabs />
                    </div>

                </div>
            </div>
        </MasterLayout>
    )
}
