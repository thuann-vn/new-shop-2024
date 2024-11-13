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
            <div className="container mx-auto px-4 sm:px-6 lg:px-8 mt-20">
                <div className={"grid grid-cols-1 md:grid-cols-3 gap-4"}>
                    <div className={
                        classNames("col-span-2",
                            !featuredPosts.length && !tags.length && !categories.length ? 'col-span-full' : ''
                        )
                    }>
                        <h1 className="text-4xl font-bold text-gray-900">
                            {tag ? t('Tag: ') + tag : (category ? category.name : t('Blog'))}
                        </h1>
                        {
                            posts.data.length === 0 ? (
                                <div className="mt-20 text-center">
                                    <h2 className="text-2xl font-bold text-gray-500">{t('No posts found')}</h2>
                                </div>
                            ) : (
                                <div>
                                    {
                                        posts.data.map((post, key) => (
                                            <WideBlogCard post={post} key={key}/>
                                        ))
                                    }
                                    <div className={"my-10"}>
                                        <Pagination data={links} meta={posts.meta}/>
                                    </div>
                                </div>
                            )
                        }

                    </div>
                    <BlogSidebar featuredPosts={featuredPosts} tags={tags} categories={categories}/>
                </div>
            </div>
        </>
    );
}
