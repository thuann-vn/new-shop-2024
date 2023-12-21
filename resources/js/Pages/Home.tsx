import { Link, Head } from '@inertiajs/react';
import { PageProps } from '@/types';
import Authenticated from "@/Layouts/MasterLayout";
import Hero from "@/Components/Home/Hero";
import HomeBlog from "@/Components/Home/HomeBlog";
import HomeTestimonials from "@/Components/Home/HomeTestimonials";
import HomeCollections from "@/Components/Home/HomeCollections";
import HomeBanner from "@/Components/Home/HomeBanner";

export default function Home({ homeSlider}: PageProps<{ homeSlider:object }>) {
    console.log(homeSlider);
    return (
        <Authenticated>
            <Head title="Welcome" />
            <HomeBanner slides={homeSlider?.items}/>
            {/*<Hero/>*/}
            <HomeCollections/>
            <HomeTestimonials/>
            <HomeBlog/>
        </Authenticated>
    );
}
