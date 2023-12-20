import { Link, Head } from '@inertiajs/react';
import { PageProps } from '@/types';
import Navbar from "@/Components/Layout/Header";
import Authenticated from "@/Layouts/AuthenticatedLayout";
import Hero from "@/Components/Home/Hero";
import HomeBlog from "@/Components/Home/HomeBlog";
import HomeTestimonials from "@/Components/Home/HomeTestimonials";
import HomeCollections from "@/Components/Home/HomeCollections";

export default function Home({ auth }: PageProps) {
    return (
        <Authenticated user={auth.user}>
            <Head title="Welcome" />
            <Hero/>
            <HomeCollections/>
            <HomeTestimonials/>
            <HomeBlog/>
        </Authenticated>
    );
}
