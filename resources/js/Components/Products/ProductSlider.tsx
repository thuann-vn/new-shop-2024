import { Swiper, SwiperSlide } from 'swiper/react';
import {Autoplay, Navigation} from 'swiper/modules';
import {imageStorageUrl} from "@/Utils/Helper";
import * as React from "react";
import ProductCard from "@/Components/Products/ProductCard";
import {Product} from "@/types";
import {useTranslation} from "react-i18next";

interface ProductSliderProps {
    products: Product[],
    title?: string,
    className?: string,
    viewMoreUrl?: string
}

export default function ProductSlider({products, title, className = '', viewMoreUrl = ''}: ProductSliderProps) {
    const randomId = Math.floor(Math.random() * 1000);
    const {t} = useTranslation();
    return (
        <div className={"relative product-slider " + className}>
            {
                title ? (
                    <div className={"flex items-center justify-between mb-3"}>
                        <h2 className={"text-2xl font-bold uppercase"}>{title}</h2>
                        {
                            viewMoreUrl && (
                                <a href={viewMoreUrl} className={"text-sm text-gray-500"}>{t('See all')}</a>
                            )
                        }

                    </div>
                ) : ''
            }
            <Swiper
                modules={[Navigation]}
                navigation={{
                    nextEl: '.swiper-button-next_' + randomId,
                    prevEl: '.swiper-button-prev_' + randomId,
                }}
                slidesPerView={4}
                effect={"creative"}
                grabCursor={true}
                className={"pt-5  bg-white"}
                slideActiveClass={'slide-active'}
                breakpoints={{
                    // when window width is >= 640px
                    640: {
                        slidesPerView: 1,
                    },
                    // when window width is >= 768px
                    768: {
                        slidesPerView: 2,
                    },
                    1024: {
                        slidesPerView: 4,
                    },
                    1536: {
                        slidesPerView: 8,
                    },
                }}
            >
                {products.map((product, index) => {
                    return (
                        <SwiperSlide key={index}>
                            <ProductCard product={product} onRemoveFromWishList={()=>{}}/>
                        </SwiperSlide>
                    );
                })}
            </Swiper>


            <div className={`swiper-button-prev swiper-button-prev_${randomId}`}></div>
            <div className={`swiper-button-next swiper-button-next_${randomId}`}></div>
        </div>
)
}
