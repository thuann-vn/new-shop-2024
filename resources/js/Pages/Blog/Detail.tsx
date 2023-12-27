import {BlogPost, PageProps, Slider} from '@/types';
import Authenticated from "@/Layouts/MasterLayout";
import AppHead from "@/Components/Layout/AppHead";
import WideBlogCard from "@/Components/Blog/WideBlogCard";
import Pagination from "@/Components/Other/Pagination";
import {formatDate, imageStorageUrl} from "@/Utils/Helper";
import BlogCard from "@/Components/Blog/BlogCard";

export default function BlogSingle({post, relatedPosts}: PageProps<{ post: BlogPost, relatedPosts: BlogPost[] }>) {
    console.log(post);
    return (
        <Authenticated>
            <AppHead title={post.title}/>
            <article>
                <header className="mx-auto max-w-screen-xl pt-28 text-center">
                    <p className="text-gray-500">Published {formatDate(post.created_at)}</p>
                    <h1 className="mt-2 text-3xl font-bold text-gray-900 sm:text-5xl">{post.title}</h1>
                    <div className="mt-6 flex flex-wrap justify-center gap-2" aria-label="Tags">
                        {
                            post.tags.map((tag, key) => (
                                <div key={key}
                                     className="rounded-lg bg-gray-100 px-2 py-1 font-medium text-gray-600 hover:bg-gray-200">{tag.name}</div>
                            ))
                        }
                    </div>
                    <img className="sm:h-[34rem] mt-10 w-full object-contain" src={imageStorageUrl(post.image)}
                         alt="Featured Image"/>
                </header>

                <div
                    className="mx-auto mt-10 max-w-screen-md space-y-12 px-4 py-10 font-serif text-lg tracking-wide text-gray-700"
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
        </Authenticated>
    );
}
