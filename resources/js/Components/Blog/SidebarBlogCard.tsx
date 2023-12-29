import {formatDate, imageStorageUrl} from "@/Utils/Helper";
import {Link} from "@inertiajs/react";
import {BlogPost} from "@/types";

export default function SidebarBlogCard({post, key} : {post: BlogPost, key: number}) {
    return (
        <div className="overflow-hidden rounded-lg bg-white group flex items-start py-2" key={key}>
            <Link href={route('blog.detail', {slug: post.slug})} className={"mr-4 flex-shrink-0 block relative w-[56px] h-[56px]  overflow-hidden rounded-full"}>
                <img
                    src={imageStorageUrl(post.image)}
                    className="object-center h-full w-full group-hover:scale-110 transition-all duration-500 ease-in-out"
                    alt={post.title}
                />
            </Link>

            <div >
                <h3 className="text-lg font-bold text-gray-900 group-hover:text-main-900 transition-all duration-500 ease-in-out">
                    <Link href={route('blog.detail', {slug: post.slug})}>
                        {post.title}
                    </Link>
                </h3>
                <p className="mt-2 text-sm text-primary-500">{post.author?.name} • <time>{formatDate(post.created_at)}</time></p>
            </div>
        </div>
    )
}
