import { Link, Head } from '@inertiajs/react';
import { PageProps } from '@/types';
import Authenticated from "@/Layouts/MasterLayout";
import HomeBlog from "@/Components/Home/HomeBlog";
import HomeTestimonials from "@/Components/Home/HomeTestimonials";
import HomeCollections from "@/Components/Home/HomeCollections";
import HomeBanner from "@/Components/Home/HomeBanner";

export default function Home({ homeSlider, collections}: PageProps<{ homeSlider:object, collections:array }>) {
    console.log(homeSlider);
    return (
        <Authenticated>
            <Head title="Welcome" />
            <HomeBanner slides={homeSlider?.items}/>
            <HomeCollections collections={collections}/>
            <HomeTestimonials/>
            <HomeBlog/>
        </Authenticated>
    );
}
