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
                                {/*<div className="absolute top-0 left-0 h-full w-full flex items-center justify-center"  data-swiper-parallax="-1000">*/}
                                {/*    <div className={"container mx-auto"}>*/}
                                {/*        <div className="w-full relative pl-[50%]">*/}
                                {/*            <h2 className="text-xl font-extralight [&>strong]:text-3xl [&>strong]:block [&>strong]:font-bold" dangerouslySetInnerHTML={{"__html": slide.title}}></h2>*/}
                                {/*            <p className="text-sm font-light mt-3 text-gray-400">{slide.subtitle}</p>*/}
                                {/*            <PrimaryButton className={"rounded-full mt-5"}>*/}
                                {/*                Shop Now*/}
                                {/*            </PrimaryButton>*/}
                                {/*        </div>*/}
                                {/*    </div>*/}
                                {/*</div>*/}
                            </div>
                        </SwiperSlide>
                    );
                })}
            </Swiper>
        </section>
    );
}
