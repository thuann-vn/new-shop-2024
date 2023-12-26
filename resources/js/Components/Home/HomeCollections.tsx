import ProductSlider from "@/Components/Products/ProductSlider";
import {Link} from "@inertiajs/react";

export default function HomeCollections({collections}: { collections: array }) {
    return (
        collections.map((collection: { name: string; slug: string; description: string, items : array}) => (
            <div key={collection.name} className="group relative">
                <div className="container mx-auto mt-10">
                    <div className="flex items-center justify-between mb-3">
                        <div>
                            <h3 className="font-semibold">
                                <a href={collection.slug}>
                                    {collection.name}
                                </a>
                            </h3>
                            <p className="text-sm text-gray-900">{collection.description}</p>
                        </div>
                        <Link href={route('shop.index', {collection: collection.id})} className="border border-gray-150 px-5 py-2 rounded-full text-sm">
                            View all
                        </Link>
                    </div>

                    <ProductSlider products={collection.home_products}/>
                </div>
            </div>
        ))
    )
}
