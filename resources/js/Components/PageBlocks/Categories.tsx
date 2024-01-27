import {Link} from "@inertiajs/react";
import {imageStorageUrl} from "@/Utils/Helper";
import Container from "@/Components/Layout/Container";
import {ProductCategory} from "@/types";
import {CategoriesBlock} from "@/types/blocks";

    export default function Categories({block}: { block: CategoriesBlock }) {
    return (
        <div className="bg-white py-10">
            <Container>
                <h2 className="text-center text-4xl font-semibold leading-8 text-gray-900">
                    Top Categories
                </h2>
                <div className="mx-auto mt-10 grid max-w-lg grid-cols-4 items-center gap-x-8 gap-y-10 sm:max-w-xl sm:grid-cols-6 sm:gap-x-10 lg:mx-0 lg:max-w-none lg:grid-cols-5">
                    {
                        block.categories.map((category:ProductCategory) => (
                            <Link href={route('shop.category', {slug: category.slug})}
                               className="flex flex-col justify-center items-center text-sm font-medium text-gray-900 group">
                                <div className="flex-shrink-0">
                                    <img className="rounded-full transition duration-500 ease-in-out transform group-hover:-translate-y-1 group-hover:scale-110"
                                         src={imageStorageUrl(category.image)}
                                         alt={category.name}/>
                                </div>
                                <span className="mt-4 text-center font-bold">{category.name}</span>
                            </Link>
                        ))
                    }
                </div>
            </Container>
        </div>
    )
}
