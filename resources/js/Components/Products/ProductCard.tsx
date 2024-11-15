import * as React from "react";
import CustomCurrencyFormat from "@/Components/CurrencyFormat";
import {Link, router, usePage} from "@inertiajs/react";
import axios from "axios";
import {CartContext} from "@/Contexts/CartContext";
import {useContext} from "react";
import {classNames, getDiscountedPercent} from "@/Utils/Helper";
import {HeartIcon} from "@heroicons/react/24/solid";
import {HeartIcon as OutlineHeartIcon, ShoppingBagIcon} from "@heroicons/react/24/outline";
import {PageProps, Product} from "@/types";
import Stars from "@/Components/Common/Stars";
import {useTranslation} from "react-i18next";
type ProductCardProps = { product: Product, className?: string, onRemoveFromWishList?: any, showCartButton?: boolean }
export default function ProductCard({product, className = '', onRemoveFromWishList, showCartButton = false}: ProductCardProps) {
    const {openCart} = useContext(CartContext);
    const {auth, wishlist = []} = usePage<PageProps>().props;
    const {t} = useTranslation()
    const addProductToCart = (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
        e.preventDefault();
        e.stopPropagation();

        axios.post(route('cart.add-to-cart', {id: product.id, qty: 1})).then((response) => {
            router.reload({only: ['cart']})
            openCart();
        });
    }

    const addToWishlist = (e: any) => {
        e.preventDefault();
        e.stopPropagation();

        if (!auth.user) {
            alert(t('You must login first'));
            return;
        }

        if (wishlist.includes(product.id)) {
            let confirmed = confirm(t('Are you sure to remove this product from wishlist?'));
            if (confirmed) {
                axios.delete(route('profile.remove-wishlist', {id: product.id})).then((response) => {
                    alert(t('Product removed from wishlist'));
                    onRemoveFromWishList && onRemoveFromWishList();
                    router.reload({only: ['wishlist']})
                });
            }
            return;
        }

        axios.post(route('profile.add-wishlist', {id: product.id})).then((response) => {
            alert(t('Product added to wishlist'));
            router.reload({only: ['wishlist']})
        });
    }

    const renderProductBadge = () => {
        if(product.featured){
            return (
                <div className={"text-green-800 text-sm font-bold bg-green-200 absolute top-2 left-2 rounded-lg px-2 py-1"}>Featured</div>
            )
        }
        return null;
    }

    // @ts-ignore
    return (
        <div className={classNames("product-card bg-white", className)}>
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
                        <button type={"button"} onClick={addToWishlist}>
                            {
                                wishlist.includes(product.id) ? <HeartIcon className={"w-6 h-6 text-red-500"}/> :
                                    <OutlineHeartIcon className={"w-6 h-6"}/>
                            }
                        </button>
                    </div>
                    {
                        product.old_price > product.price &&
                        <div className={"text-green-800 text-sm font-bold bg-green-200 absolute top-2 left-2 rounded-lg px-2 py-1"}>-{getDiscountedPercent(product.old_price, product.price)}%</div>
                    }
                </div>
                <Link href={route('products.detail', {slug: product.slug})} className={"block p-[20px] pt-0"}>
                    {renderProductBadge()}
                    <h3 className="mt-4 font-bold line-clamp-2">{product.name}</h3>
                    <Stars rating={2} className={"my-4"}/>
                    {/*<p className="text-gray-400 inline-flex items-center my-2">*/}
                    {/*    <svg className="mr-1" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">*/}
                    {/*        <path*/}
                    {/*            d="M3.11826 17.1289C4.11794 18.3335 5.97853 18.3335 9.6997 18.3335H10.3007C14.0219 18.3335 15.8825 18.3335 16.8821 17.1289M3.11826 17.1289C2.11857 15.9244 2.46146 14.0956 3.14723 10.4382C3.63491 7.83722 3.87875 6.53673 4.8045 5.76842M3.11826 17.1289C3.11826 17.1289 3.11826 17.1289 3.11826 17.1289ZM16.8821 17.1289C17.8818 15.9244 17.5389 14.0956 16.8532 10.4382C16.3655 7.83722 16.1216 6.53673 15.1959 5.76842M16.8821 17.1289C16.8821 17.1289 16.8821 17.1289 16.8821 17.1289ZM15.1959 5.76842C14.2701 5.00012 12.947 5.00012 10.3007 5.00012H9.69971C7.0534 5.00012 5.73025 5.00012 4.8045 5.76842M15.1959 5.76842C15.1959 5.76842 15.1959 5.76842 15.1959 5.76842ZM4.8045 5.76842C4.8045 5.76842 4.8045 5.76842 4.8045 5.76842Z"*/}
                    {/*            stroke="currentColor" stroke-width="1.5"/>*/}
                    {/*        <path d="M8.3335 11.9166C8.76741 12.3071 9.01069 12.526 9.44461 12.9166L11.6668 10.4166"*/}
                    {/*              stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>*/}
                    {/*        <path*/}
                    {/*            d="M7.5 4.99996V4.16663C7.5 2.78591 8.61929 1.66663 10 1.66663C11.3807 1.66663 12.5 2.78591 12.5 4.16663V4.99996"*/}
                    {/*            stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>*/}
                    {/*    </svg>*/}
                    {/*    200 Sales*/}
                    {/*</p>*/}
                    <p className="mt-1 text-lg font-bold text-main-500">
                        {
                            product.old_price > product.price &&
                            <span className={"text-gray-400 text-sm line-through mr-2"}><CustomCurrencyFormat
                                value={product.old_price}/></span>
                        }
                        <CustomCurrencyFormat value={product.price}/>
                    </p>
                    {
                        showCartButton ? (
                            <button type={"button"} onClick={(e) => addProductToCart(e)}
                                    className={"mt-3 w-full py-1 text-center text-black text-sm bg-yellow-400 hover:bg-yellow-500 rounded-full"}>
                                {t('Add to cart')}
                            </button>
                        ) : null
                    }

                </Link>
            </div>
        </div>
    )
}
