import * as React from 'react';

import { Swiper, SwiperSlide } from 'swiper/react';
import {Autoplay, Navigation, Pagination, Parallax} from 'swiper/modules';
import {imageStorageUrl} from "@/Utils/Helper";

export default function HomeBanner({slides} : {slides: any[]}) {
    return (
        <section className="bg-white">
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
            >
                {slides.map((slide, index) => {
                    return (
                        <SwiperSlide key={index}>
                            <div className={"w-full relative"}>
                                <img src={imageStorageUrl(slide.image)} alt="" className="w-full"/>
                                <div className="absolute top-0 left-0 h-full w-full flex items-center justify-center"  data-swiper-parallax="-1000">
                                    <div className={"container"}>
                                        <div className="max-w-sm">
                                            <h2 className="text-5xl font-bold">{slide.title}</h2>
                                            <p className="text-lg mt-3">{slide.subtitle}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </SwiperSlide>
                    );
                })}
            </Swiper>
        </section>
    );
}
