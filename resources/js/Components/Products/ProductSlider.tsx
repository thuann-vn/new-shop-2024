import { Swiper, SwiperSlide } from 'swiper/react';
import {Autoplay, Navigation} from 'swiper/modules';
import {imageStorageUrl} from "@/Utils/Helper";
import * as React from "react";
import ProductCard from "@/Components/Products/ProductCard";

interface ProductSliderProps {
    products: object[]
}

export default function ProductSlider({products}: ProductSliderProps) {
    const randomId = Math.floor(Math.random() * 1000);
    return (
        <div className={"relative product-slider"}>
            <Swiper
                modules={[Navigation]}
                navigation={{
                    nextEl: '.swiper-button-next_' + randomId,
                    prevEl: '.swiper-button-prev_' + randomId,
                }}
                slidesPerView={5}
                effect={"creative"}
                grabCursor={true}
                className={"pt-5 border border-gray-150 border-r-0 rounded-lg"}
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
                        slidesPerView: 5,
                    },
                    1536: {
                        slidesPerView: 8,
                    },
                }}
            >
                {products.map((product, index) => {
                    return (
                        <SwiperSlide key={index}>
                            <ProductCard product={product}/>
                        </SwiperSlide>
                    );
                })}
            </Swiper>


            <div className={`swiper-button-prev swiper-button-prev_${randomId}`}></div>
            <div className={`swiper-button-next swiper-button-next_${randomId}`}></div>
        </div>
)
}
