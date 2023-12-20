import * as React from 'react';

import { Swiper, SwiperSlide } from 'swiper/react';
import { Navigation, Pagination } from 'swiper/modules';

const photos = [
    'https://images.pexels.com/photos/7469387/pexels-photo-7469387.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/7469289/pexels-photo-7469289.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/6213729/pexels-photo-6213729.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/6213739/pexels-photo-6213739.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
];

export default function HomeBanner() {
    return (
        <section className="bg-white">
            <Swiper
                modules={[Navigation, Pagination]}
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
                autoplay={true}
            >
                {photos.map((p, index) => {
                    return (
                        <SwiperSlide key={index}>
                            <img src={p} alt="" className="w-full"/>
                        </SwiperSlide>
                    );
                })}
            </Swiper>
        </section>
    );
}
