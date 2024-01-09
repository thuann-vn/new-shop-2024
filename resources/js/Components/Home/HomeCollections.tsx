import ProductSlider from "@/Components/Products/ProductSlider";
import {Link} from "@inertiajs/react";
import {Collection, ProductCollection} from "@/types";
import {imageStorageUrl} from "@/Utils/Helper";

export default function HomeCollections({collections}: { collections: Collection[] }) {
    return (
        collections.map((collection) => (
            <div key={collection.name} className="group relative">
                <div className="container mx-auto mt-10">
                    {/*    Show image */}
                    {
                        collection.image ? (
                            <Link href={route('shop.index', {collection: collection.id})} className="block w-full h-full mb-3 bg-white transition duration-500 ease-in-out hover:opacity-90">
                                <img src={imageStorageUrl(collection.image)} alt={collection.name}
                                     className="w-full h-full object-cover"/>
                            </Link>
                        ) : null
                    }

                    <div className="flex items-center justify-between mb-3">
                        <div>
                            <h3 className="font-semibold text-4xl capitalize">
                                <a href={collection.slug}>
                                    {collection.name.toLowerCase()}
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
