import * as React from 'react';

import { Swiper, SwiperSlide } from 'swiper/react';
import {Autoplay, Navigation, Pagination, Parallax} from 'swiper/modules';
import {classNames, imageStorageUrl} from "@/Utils/Helper";
import {Link} from "@inertiajs/react";
import {SliderItems} from "@/types";
import {SliderBlock} from "@/types/blocks";
import Container from "@/Components/Layout/Container";
import Banner from "@/Components/PageBlocks/Banner";

export default function BannerSlider({block} : {block: SliderBlock}) {
    if(!block.slider) return (<></>);
    if(block.slider.display_type == 'grid'){
        return (
            <div className={"grid grid-cols-1 lg:grid-cols-2 gap-x-3 mt-5"}>
                {
                    block.slider.items.map((slide, index) => {
                        return (
                            <Banner slide={slide} key={'slider_' + block.sliderId + '_slides_' + index}/>
                        );
                    })
                }
            </div>
        )
    }else{
        return (
            <Swiper
                modules={[Navigation, Pagination, Parallax, Autoplay]}
                navigation={true}
                loop={true}
                spaceBetween={0}
                slidesPerView={1}
                effect={"creative"}
                pagination={{
                    clickable: true,
                    dynamicBullets: true,
                }}
                centeredSlides={true}
                grabCursor={true}
                autoplay={{
                    delay: 5000,
                    disableOnInteraction: false,
                }}
                parallax={true}
                speed={600}
                className={"home-slider"}
            >
                {block.slider.items.map((slide, index) => {
                    return (
                        <SwiperSlide key={index}>
                            <Banner slide={slide}/>
                        </SwiperSlide>
                    );
                })}
            </Swiper>
        );
    }

}
