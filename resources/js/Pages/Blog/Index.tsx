import {BlogCategory, BlogPost, BlogTag, PageProps, Slider} from '@/types';
import AppHead from "@/Components/Layout/AppHead";
import WideBlogCard from "@/Components/Blog/WideBlogCard";
import Pagination from "@/Components/Other/Pagination";
import BlogSidebar from "@/Components/Blog/BlogSidebar";
import {useTranslation} from "react-i18next";
import {classNames} from "@/Utils/Helper";

interface Props {
    links: any[],
    posts: {data: BlogPost[], meta: any},
    featuredPosts: BlogPost[],
    tags: string[],
    categories: BlogCategory[],
    category: BlogCategory | null,
    tag: string | null
}
export default function BlogIndex({links, posts, featuredPosts, tags, categories, category, tag}: Props) {
    const {t} = useTranslation()
    return (
        <>
            <AppHead title={category ? category.name : 'Blog' } />
            <div className="container mx-auto px-4 sm:px-6 lg:px-8">
                <h1 className="text-4xl font-bold text-gray-900 mt-12">
                    {tag ? t('Tag: ') + tag :( category ? t('Category: ') + category.name : t('Blog')) }
                </h1>
                <div className={"grid grid-cols-1 md:grid-cols-3 gap-4"}>
                    <div className={
                        classNames("col-span-2",
                            !featuredPosts.length && !tags.length  && !categories.length ? 'col-span-full' : ''
                            )
                    }>
                        {
                            posts.data.map((post, key) => (
                                <WideBlogCard post={post} key={key}/>
                            ))
                        }
                        <div className={"my-10"}>
                            <Pagination data={links} meta={posts.meta}/>
                        </div>
                    </div>
                    <BlogSidebar featuredPosts={featuredPosts} tags={tags} categories={categories}/>
                </div>
            </div>
        </>
    );
}
