import {formatDate, imageStorageUrl} from "@/Utils/Helper";
import {BlogPost} from "@/types";
import {Link} from "@inertiajs/react";

export default function WideBlogCard({post, key} : {post: BlogPost, key: number}) {
    return (
    <article className="mx-auto my-3 flex max-w-md flex-colbg-white px-4 md:max-w-5xl md:flex-row md:items-center">
        <Link href={route('blog.detail', {slug: post.slug})} className="shrink-0 my-4 md:mr-8 md:max-w-sm">
            <img className="rounded-2xl" src={imageStorageUrl(post.image)} alt={post.title} />
        </Link>
        <div className="py-4 sm:py-8">
            <Link href={route('blog.detail', {slug: post.slug})} className="mb-6 block text-2xl font-medium text-gray-700">{post.title}</Link>
            <div className="mt-6 flex flex-wrap justify-center gap-2" aria-label="Tags">
                {
                    post.tags.map((tag, key) => (
                        <div key={key} className="rounded-lg bg-gray-100 px-2 py-1 font-medium text-gray-600 hover:bg-gray-200">{tag.name}</div>
                    ))
                }
            </div>
            <p className="mb-6 text-gray-500 line-clamp-3">{post.content}</p>
            <div className="flex items-center">
                <p className="w-56">
                    <strong className="block font-medium text-gray-700">{post.author?.name}</strong>
                    <span className="text-sm text-gray-400">{formatDate(post.created_at)}</span>
                </p>
            </div>
        </div>
    </article>
    )
}
