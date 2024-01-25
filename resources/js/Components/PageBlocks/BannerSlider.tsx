import * as React from 'react';

import { Swiper, SwiperSlide } from 'swiper/react';
import {Autoplay, Navigation, Pagination, Parallax} from 'swiper/modules';
import {classNames, imageStorageUrl} from "@/Utils/Helper";
import {Link} from "@inertiajs/react";
import {SliderItems} from "@/types";
import {SliderBlock} from "@/types/blocks";

export default function BannerSlider({block} : {block: SliderBlock}) {
    if(!block.slider) return (<></>);
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
                className={"home-slider"}
            >
                {block.slider.items.map((slide, index) => {
                    return (
                        <SwiperSlide key={index}>
                            <div className={classNames("w-full relative slide-item", slide.is_alt_style ? "slide-item-alt" : "")}>
                                <img src={imageStorageUrl(slide.image)} alt="" className="w-full"/>
                                <div className="absolute top-0 left-0 h-full w-full flex items-center justify-center"  data-swiper-parallax="-1000">
                                    <div className={"container mx-auto px-10"}>
                                        <div className="text-center">
                                            <h2 className="text-6xl font-bold slide-title mb-3" dangerouslySetInnerHTML={{__html: slide.title}}></h2>
                                            <p className="text-lg mt-3  mb-3 slide-subtitle" dangerouslySetInnerHTML={{__html: slide.subtitle}}></p>
                                            <Link href={slide.link} className={"slide-button shadow rounded-full px-3 bg-white text-black py-2 inline-block"}>
                                                Shop now
                                            </Link>
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
