import * as React from "react";
import CustomCurrencyFormat from "@/Components/CurrencyFormat";
import {Link, router, usePage} from "@inertiajs/react";
import axios from "axios";
import {CartContext} from "@/Contexts/CartContext";
import {useContext} from "react";
import {classNames} from "@/Utils/Helper";
import {HeartIcon} from "@heroicons/react/24/solid";
import {HeartIcon as OutlineHeartIcon} from "@heroicons/react/24/outline";

export default function ProductCard({ product, className= '', onRemoveFromWishList }: { product: any, className?: string, onRemoveFromWishList: () => void }) {
    const {openCart} = useContext(CartContext);
    const {auth, wishlist = []} = usePage().props;
    const addProductToCart = (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
        e.preventDefault();
        e.stopPropagation();

        axios.post(route('cart.add-to-cart', {id: product.id, qty: 1})).then((response) => {
            router.reload({only: ['cart']})
            openCart();
        });
    }

    const addToWishlist = (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
        e.preventDefault();
        e.stopPropagation();

        if (!auth.user) {
            alert('You must login first');
            return;
        }

        if(wishlist.includes(product.id)) {
            let confirmed = confirm('Are you sure to remove this product from wishlist?');
            if(confirmed) {
                axios.delete(route('profile.remove-wishlist', {id: product.id})).then((response) => {
                    alert('Product removed from wishlist');
                    onRemoveFromWishList();
                    router.reload({only: ['wishlist']})
                });
            }
            return;
        }

        axios.post(route('profile.add-wishlist', {id: product.id})).then((response) => {
            alert('Product added to wishlist');
            router.reload({only: ['wishlist']})
        });
    }
    console.log(wishlist)

    return (
        <div className={classNames("product-card bg-white border border-transparent border-r-gray-200", className)}>
            <div className={"relative d-flex flex-column justify-content-center align-items-center"}>
                <div className={"relative p-[20px]"}>
                    <Link href={route('products.detail', {slug: product.slug})} className={"block"}>
                        <img src={product.featured_image_url} alt={product.name} className="w-full"/>
                    </Link>
                    <div className="product-buttons absolute top-[15px] right-[15px] z-10">
                        {/*<a className={""}>*/}
                        {/*    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5}*/}
                        {/*         stroke="currentColor" className="w-6 h-6">*/}
                        {/*        <path strokeLinecap="round" strokeLinejoin="round"*/}
                        {/*              d="M3.75 3.75v4.5m0-4.5h4.5m-4.5 0L9 9M3.75 20.25v-4.5m0 4.5h4.5m-4.5 0L9 15M20.25 3.75h-4.5m4.5 0v4.5m0-4.5L15 9m5.25 11.25h-4.5m4.5 0v-4.5m0 4.5L15 15"/>*/}
                        {/*    </svg>*/}
                        {/*</a>*/}
                        <Link href={route('profile.add-wishlist')} onClick={addToWishlist}>
                            {
                                wishlist.includes(product.id) ? <HeartIcon className={"w-6 h-6 text-red-500"}/> :
                                    <OutlineHeartIcon className={"w-6 h-6"}/>
                            }
                        </Link>
                    </div>
                </div>
                <Link href={route('products.detail', {slug: product.slug})} className={"block p-[20px] pt-0"}>
                    <h3 className="mt-4 font-bold text-gray-600 line-clamp-2 min-h-[48px]">{product.name}</h3>
                    <p className="mt-1 text-lg font-medium text-red-600">
                        {
                            product.old_price > product.price &&
                            <span className={"text-gray-400 text-sm line-through mr-2"}><CustomCurrencyFormat
                                value={product.old_price}/></span>
                        }
                        <CustomCurrencyFormat value={product.price}/>
                    </p>
                    <button type={"button"} onClick={(e) => addProductToCart(e)}
                            className={"mt-3 w-full py-1 text-center text-black text-sm bg-yellow-400 hover:bg-yellow-500 rounded-full"}>
                        Add to cart
                    </button>
                </Link>
            </div>
        </div>
    )
}
