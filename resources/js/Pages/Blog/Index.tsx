import {BlogCategory, BlogPost, BlogTag, PageProps, Slider} from '@/types';
import Authenticated from "@/Layouts/MasterLayout";
import AppHead from "@/Components/Layout/AppHead";
import WideBlogCard from "@/Components/Blog/WideBlogCard";
import Pagination from "@/Components/Other/Pagination";
import BlogSidebar from "@/Components/Blog/BlogSidebar";

interface Props {
    posts: {data: BlogPost[], links: any[]},
    featuredPosts: BlogPost[],
    tags: string[],
    categories: BlogCategory[],
    category: BlogCategory | null,
    tag: string | null
}
export default function BlogIndex({posts, featuredPosts, tags, categories, category, tag}: Props) {
    console.log(tag, tags)
    return (
        <Authenticated>
            <AppHead title={category ? category.name : 'Blog' } />
            <div className="container mx-auto px-4 sm:px-6 lg:px-8">
                <h1 className="text-4xl font-bold text-gray-900 mt-12">
                    {tag ? 'Tag: ' + tag :( category ? 'Category: ' + category.name : 'Blog') }
                </h1>
                <div className={"grid grid-cols-1 md:grid-cols-3 gap-4"}>
                    <div className="col-span-2">
                        {
                            posts.data.map((post, key) => (
                                <WideBlogCard post={post} key={key}/>
                            ))
                        }
                        <div className={"my-10"}>
                            <Pagination data={posts}/>
                        </div>
                    </div>
                    <BlogSidebar featuredPosts={featuredPosts} tags={tags} categories={categories}/>
                </div>
            </div>
        </Authenticated>
    );
}
