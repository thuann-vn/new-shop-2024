import {BlogCategory, BlogPost, BlogTag} from "@/types";
import SidebarBlogCard from "@/Components/Blog/SidebarBlogCard";
import {Link} from "@inertiajs/react";
import {useTranslation} from "react-i18next";

export default function BlogSidebar({featuredPosts, categories, tags}: { featuredPosts: BlogPost[], categories: BlogCategory[], tags: string[] }) {
    const {t} = useTranslation()

    if(!featuredPosts.length && !categories.length && !tags.length){
        return null
    }

    return (
        <div>
            {
                featuredPosts.length && (
                    <div className="bg-white rounded-lg p-6">
                        <h3 className="text-xl font-bold text-gray-900">{t('Featured Posts')}</h3>
                        <div className="mt-3">
                            {
                                featuredPosts.map((post, key) => (
                                    <SidebarBlogCard post={post} key={key}/>
                                ))
                            }
                        </div>
                    </div>
                )
            }


            {
                categories.length > 0 && (
                    <div className="bg-white rounded-lg p-6 mt-3">
                        <h3 className="text-xl font-bold text-gray-900">{t('Categories')}</h3>
                        <div className="mt-3  bg-gray-100 rounded-lg">
                            {
                                categories.map((category) => (
                                    <div key={category.id}>
                                        <Link
                                            href={route('blog.category', {category: category.slug})}
                                            className="block rounded-lg px-4 py-3 font-medium text-gray-600 hover:bg-gray-200">{category.name}
                                        </Link>
                                    </div>
                                ))
                            }
                        </div>
                    </div>
                )
            }

            {
                tags.length > 0 && (
                    <div className="bg-white rounded-lg p-6 mt-3">
                        <h3 className="text-xl font-bold text-gray-900">{t('Tags')}</h3>
                        <div className="mt-3 flex flex-wrap">
                            {
                                tags.map((tag, key) => (
                                    <Link href={route('blog.tag', {tag: tag})}
                                          key={key}
                                          className="block rounded-lg me-2 mb-1 bg-gray-100 px-2 py-1 font-medium text-gray-600 hover:bg-gray-200">{tag}
                                    </Link>
                                ))
                            }
                        </div>
                    </div>
                )
            }
        </div>
    )
}
