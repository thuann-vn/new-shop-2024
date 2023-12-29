import {formatDate, imageStorageUrl} from "@/Utils/Helper";
import {BlogPost} from "@/types";
import {Link} from "@inertiajs/react";

export default function WideBlogCard({post, key} : {post: BlogPost, key: number}) {
    return (
    <article className="mx-auto my-6">
        <Link href={route('blog.detail', {slug: post.slug})} className="">
            <img className="rounded-2xl w-full h-[200px]  lg:h-[400px] object-cover" src={imageStorageUrl(post.image)} alt={post.title} />
        </Link>
        <div className="py-4 sm:py-8">
            <div className="flex items-center mb-3">
                <p className="w-56">
                    <strong className="block font-medium text-gray-700">{post.author?.name}</strong>
                    <span className="text-sm text-gray-400">{formatDate(post.created_at)}</span>
                </p>
            </div>
            <Link href={route('blog.detail', {slug: post.slug})} className="mb-3 block text-2xl font-medium text-gray-700">{post.title}</Link>
            <p className="mb-6 text-gray-500 line-clamp-3">{post.content}</p>
            <Link href={route('blog.detail', {slug: post.slug})} className="px-6 py-2 bg-main-900 text-white hover:bg-main-950 rounded-lg">Read more</Link>
        </div>
    </article>
    )
}
