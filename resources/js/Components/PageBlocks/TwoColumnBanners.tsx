import * as React from 'react';

import { Swiper, SwiperSlide } from 'swiper/react';
import {Autoplay, Navigation, Pagination, Parallax} from 'swiper/modules';
import {imageStorageUrl} from "@/Utils/Helper";
import PrimaryButton from "@/Components/Form/PrimaryButton";

export default function HomeSaleBanner({slides} : {slides: any[]}) {
    if(!slides.length) return (<></>);
    return (
        <section className="bg-white">
            <Swiper
                modules={[Autoplay]}
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
                {slides.map((slide, index) => {
                    return (
                        <SwiperSlide key={index}>
                            <div className={"w-full relative"}>
                                <img src={imageStorageUrl(slide.image)} alt="" className="w-full rounded-lg"/>
                            </div>
                        </SwiperSlide>
                    );
                })}
            </Swiper>
        </section>
    );
}
