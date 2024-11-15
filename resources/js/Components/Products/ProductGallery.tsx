import {Swiper, SwiperSlide} from 'swiper/react';
import {Navigation, Thumbs} from 'swiper/modules';
import * as React from "react";
import {useState} from "react";
import {Swiper as SwiperClass} from "swiper/types";
import LightGallery from 'lightgallery/react';

// import styles
import 'lightgallery/css/lightgallery.css';
import 'lightgallery/css/lg-zoom.css';
import 'lightgallery/css/lg-thumbnail.css';

// import plugins if you need
import lgThumbnail from 'lightgallery/plugins/thumbnail';
import lgZoom from 'lightgallery/plugins/zoom';
import {Media} from "@/types";
interface ProductSliderProps {
    images: Media[]
}

export default function ProductGallery({images}: ProductSliderProps) {
    const [thumbsSwiper, setThumbsSwiper] = useState<SwiperClass | null>(null);
    const [index, setIndex] = useState(0);

    return (
        <div className={"relative product-gallery mt-3"}>
            <LightGallery
                speed={500}
                plugins={[lgThumbnail, lgZoom]}
                selector={"a"}
            >
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
                                <a href={image.original_url} data-src={image.original_url}>
                                    <img src={image.original_url} alt={image.name} className="w-full"/>
                                </a>
                            </SwiperSlide>
                        );
                    })}
                </Swiper>
            </LightGallery>

            <Swiper
                modules={[Thumbs]}
                effect={"creative"}
                grabCursor={true}
                slideActiveClass={'outline-black'}
                onSwiper={setThumbsSwiper}
                onActiveIndexChange={(swiper) => setIndex(swiper.activeIndex)}
                slidesPerView={4}
                className={"mt-3"}
                spaceBetween={10}
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
