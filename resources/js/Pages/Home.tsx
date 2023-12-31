import {BlogPost, Collection, PageProps, Slider} from '@/types';
import Authenticated from "@/Layouts/Layout";
import HomeBlog from "@/Components/Home/HomeBlog";
import HomeCollections from "@/Components/Home/HomeCollections";
import HomeBanner from "@/Components/Home/HomeBanner";
import AppHead from "@/Components/Layout/AppHead";
import HomeSaleBanner from "@/Components/Home/HomeSaleBanner";

export default function Home({ homeSlider, homeSaleSlider1, homeSaleSlider2, collections, homePosts}: PageProps<{ homeSlider:Slider, homeSaleSlider1:Slider, homeSaleSlider2:Slider, collections: Collection[], homePosts: BlogPost[] }>) {
    return (
        <>
            <AppHead title="Welcome" />
            <HomeBanner slides={homeSlider?.items}/>

            <div className="container mx-auto">
                <div className={"grid grid-cols-1 lg:grid-cols-2 gap-x-3 mt-5"}>
                    <HomeSaleBanner slides={homeSaleSlider1?.items ?? []}/>
                    <HomeSaleBanner slides={homeSaleSlider2?.items ?? []}/>
                </div>
            </div>
            <HomeCollections collections={collections}/>
            <HomeBlog posts={homePosts}/>
        </>
    );
}
