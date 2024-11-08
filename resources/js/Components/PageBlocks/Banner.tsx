import {classNames, imageStorageUrl} from "@/Utils/Helper";
import {Link} from "@inertiajs/react";
import * as React from "react";
import {SliderItems} from "@/types";

export default function Banner({slide}: {slide: SliderItems}){
    return (
        <div className={classNames("w-full relative slide-item", slide.is_alt_style ? "slide-item-alt" : "")}>
            <img src={slide.image_url} alt="" className="w-full"/>
            {
                !slide.is_image_only ? (
                    <div className="absolute top-0 left-0 h-full w-full flex items-center justify-center"
                         data-swiper-parallax="-1000">
                        <div className={"container mx-auto px-10"}>
                            <div className="text-center">
                                <h2 className="text-6xl font-bold slide-title mb-3"
                                    dangerouslySetInnerHTML={{__html: slide.title}}></h2>
                                <p className="text-lg mt-3  mb-3 slide-subtitle"
                                   dangerouslySetInnerHTML={{__html: slide.subtitle}}></p>
                                <Link href={slide.link}
                                      className={"slide-button shadow rounded-full px-3 bg-white text-black py-2 inline-block"}>
                                    Shop now
                                </Link>
                            </div>
                        </div>
                    </div>
                ) : null
            }
        </div>
    )
}
