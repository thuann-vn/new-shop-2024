import BlogCard from "@/Components/Blog/BlogCard";
import {BlogPost} from "@/types";

export default function HomeBlog({posts} : {posts: BlogPost[]}) {
    return (
        <div className="bg-white my-10">
            <div className="mx-auto container">
                <div className="mx-auto max-w-2xl lg:mx-0">
                    <h2 className="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">From the blog</h2>
                    <p className="mt-2 text-lg leading-8 text-gray-600">
                        Learn how to grow your business with our expert advice.
                    </p>
                </div>
                <div className="mx-auto grid max-w-2xl grid-cols-1 gap-x-8 gap-y-16 sm:mt-5 sm:pt-5 lg:mx-0 lg:max-w-none lg:grid-cols-3">
                    {posts.map((post) => (
                        <BlogCard key={post.id} post={post}/>
                    ))}
                </div>
            </div>
        </div>
    )
}
