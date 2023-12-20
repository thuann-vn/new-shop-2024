import { Link, Head } from '@inertiajs/react';
import { PageProps } from '@/types';
import Navbar from "@/Components/Layout/Header";
import Authenticated from "@/Layouts/MasterLayout";
import Hero from "@/Components/Home/Hero";
import HomeBlog from "@/Components/Home/HomeBlog";
import HomeTestimonials from "@/Components/Home/HomeTestimonials";
import HomeCollections from "@/Components/Home/HomeCollections";
import HomeBanner from "@/Components/Home/HomeBanner";

export default function Home({ auth }: PageProps) {
    return (
        <Authenticated user={auth.user}>
            <Head title="Welcome" />
            <HomeBanner/>
            <Hero/>
            <HomeCollections/>
            <HomeTestimonials/>
            <HomeBlog/>
        </Authenticated>
    );
}
