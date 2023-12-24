import {Swiper, SwiperSlide} from 'swiper/react';
import {Autoplay, Controller, Lazy, Navigation, Thumbs} from 'swiper/modules';
import {imageStorageUrl} from "@/Utils/Helper";
import * as React from "react";
import ProductCard from "@/Components/Products/ProductCard";
import {useState} from "react";
import {Swiper as SwiperClass} from "swiper/types";

interface ProductSliderProps {
    images: object[]
}

export default function ProductGallery({images}: ProductSliderProps) {
    const [thumbsSwiper, setThumbsSwiper] = useState<SwiperClass | null>(null);
    const [index, setIndex] = useState(0);

    return (
        <div className={"relative product-gallery"}>
            <Swiper
                modules={[Navigation, Thumbs]}
                thumbs={{ swiper: thumbsSwiper }}
                slidesPerView={1}
                effect={"creative"}
                grabCursor={true}
            >
                {images.map((image, index) => {
                    return (
                        <SwiperSlide key={"image_" + index} className={"w-full"}>
                            <img src={image.original_url} alt={image.name} className="w-full"/>
                        </SwiperSlide>
                    );
                })}
            </Swiper>

            <Swiper
                modules={[Thumbs]}
                effect={"creative"}
                grabCursor={true}
                slideActiveClass={'outline-black'}
                onSwiper={setThumbsSwiper}
                onActiveIndexChange={(swiper) => setIndex(swiper.activeIndex)}
                slidesPerView={5}
            >
                {images.map((image, idx) => {
                    return (
                        <SwiperSlide key={"thumb_" + idx}>
                            <img src={image.preview_url} alt={image.name} className="w-full"/>
                        </SwiperSlide>
                    );
                })}
            </Swiper>
        </div>
    )
}
