import {BlogCategory, BlogPost, PageProps, Slider} from '@/types';
import AppHead from "@/Components/Layout/AppHead";
import {formatDate, imageStorageUrl} from "@/Utils/Helper";
import BlogCard from "@/Components/Blog/BlogCard";
import BlogSidebar from "@/Components/Blog/BlogSidebar";

export default function BlogSingle({post, relatedPosts, tags, categories, featuredPosts }: PageProps<{ post: BlogPost, relatedPosts: BlogPost[], tags: string[],categories: BlogCategory[], featuredPosts: BlogPost[] }>) {
    return (
        <>
            <AppHead title={post.title}/>
            <div className="container mx-auto px-4 sm:px-6 lg:px-8">
                <div className={"grid grid-cols-1 md:grid-cols-3 gap-4 mt-12"}>
                    <div className={"col-span-2"}>
                        <article>
                            <header className="mx-auto text-center">
                                <p className="text-gray-500">Published {formatDate(post.created_at)}</p>
                                <h1 className="mt-2 text-2xl font-bold text-gray-900 sm:text-4xl">{post.title}</h1>
                                <img className="sm:h-[34rem] mt-10 w-full object-cover" src={imageStorageUrl(post.image)}
                                     alt="Featured Image"/>
                            </header>

                            <div
                                className="mx-auto mt-10 space-y-12 py-10 font-serif text-lg tracking-wide text-gray-700"
                                dangerouslySetInnerHTML={{__html: post.content}}>
                            </div>
                        </article>

                        {
                            relatedPosts.length > 0 ? (
                                <>
                                    <div className="w-fit mx-auto mt-10 flex space-x-2">
                                        <div className="h-0.5 w-2 bg-gray-600"></div>
                                        <div className="h-0.5 w-32 bg-gray-600"></div>
                                        <div className="h-0.5 w-2 bg-gray-600"></div>
                                    </div>

                                    <aside aria-label="Related Articles" className="mx-auto mt-10 max-w-screen-xl py-20">
                                        <h2 className="mb-8 text-center text-5xl font-bold text-gray-900">More Blogs</h2>
                                        <div
                                            className="mx-auto grid max-w-screen-lg justify-center px-4 sm:grid-cols-2 sm:gap-6 sm:px-8 md:grid-cols-3">
                                            {
                                                relatedPosts.map((post, key) => (
                                                    <BlogCard post={post} key={key}/>
                                                ))
                                            }
                                        </div>
                                    </aside>
                                </>
                            ): null
                        }
                    </div>
                    <BlogSidebar featuredPosts={featuredPosts} tags={tags} categories={categories}/>
                </div>
            </div>

        </>
    );
}
