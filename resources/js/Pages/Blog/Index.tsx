import {BlogPost, PageProps, Slider} from '@/types';
import Authenticated from "@/Layouts/MasterLayout";
import AppHead from "@/Components/Layout/AppHead";
import WideBlogCard from "@/Components/Blog/WideBlogCard";
import Pagination from "@/Components/Other/Pagination";

export default function BlogIndex({posts}: PageProps<{ posts: {data: BlogPost[], links: any[]} }>) {
    return (
        <Authenticated>
            <AppHead title="Blog" />
            <div className="container mx-auto">
                {
                    posts.data.map((post, key) => (
                        <WideBlogCard post={post} key={key}/>
                    ))
                }
                <div className={"my-10"}>
                    <Pagination data={posts}/>
                </div>
            </div>
        </Authenticated>
    );
}
