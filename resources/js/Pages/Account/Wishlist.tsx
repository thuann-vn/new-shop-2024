import {PageProps, WishList, WishListItem} from '@/types';
import AccountNav from "@/Components/Account/AccountNav";
import {Key, useEffect, useState} from "react";
import ProductCard from "@/Components/Products/ProductCard";
import Pagination from "@/Components/Other/Pagination";
import EmptyState from "@/Components/Other/EmptyState";
import {HeartIcon} from "@heroicons/react/24/solid";
import AppHead from "@/Components/Layout/AppHead";
import {useTranslation} from "react-i18next";

export default function Dashboard({myWishList, links}: { myWishList: WishList, links:any }) {
    const [items, setItems] = useState<WishListItem[]>([])
    const {t} = useTranslation();
    useEffect(() => {
        setItems(myWishList.data);
    }, []);
    return (
        <>
            <AppHead title={t("Your Wishlist")}/>
            <div className="py-12">
                <div className="container mx-auto sm:px-6 lg:px-8">
                    <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <AccountNav activeTab={'wishlist'}/>

                        {
                            items.length == 0 ? <EmptyState title={"Your wish list is empty"}
                                                            description={"You have no items in your wish list."}>
                                    <HeartIcon className={"w-12 h-12 text-main-600 mx-auto mt-12"}/>
                                </EmptyState> :
                                (
                                    <div className="mt-6">
                                        <h1 className="text-2xl font-extrabold tracking-tight text-gray-900 sm:text-3xl">
                                            {t('Your Wishlist')}</h1>
                                        <div className="mt-3
                                                        grid
                                                        grid-cols-1
                                                        sm:grid-cols-2
                                                        lg:grid-cols-4
                                                        xl:grid-cols-5
                                                        xl:gap-x-8
                                                        border
                                                        border-gray-150
                                                        border-b-0
                                                        rounded-lg
                                                        bg-white
                                                        overflow-hidden
                                                        [&>*:nth-child(3)]:border-r-transparent"
                                        >
                                            {items.map((item) => (
                                                <ProductCard product={item.product}
                                                             key={item.product.id}
                                                             onRemoveFromWishList={() => {
                                                                 setItems(items.filter((i) => i.product.id != item.product.id))
                                                             }}
                                                             className={"border-b-gray-200"}/>
                                            ))}
                                        </div>

                                        <Pagination data={links} meta={myWishList.meta}/>
                                    </div>
                                )
                        }

                    </div>
                </div>
            </div>
        </>
    );
}
