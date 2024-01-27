import {Link} from "@inertiajs/react";
import Container from "@/Components/Layout/Container";
import {CollectionBlock} from "@/types/blocks";
import ProductSlider from "@/Components/Products/ProductSlider";

export default function Collection({block}: { block: CollectionBlock }) {
    return (
        <Container>
            <div className="flex items-center justify-between mb-3 mt-10">
                <div>
                    <h3 className="font-semibold text-4xl capitalize">
                        <a href={block.collection.slug}>
                            {block.collection.name.toLowerCase()}
                        </a>
                    </h3>
                    <p className="text-sm text-gray-900">{block.collection.description}</p>
                </div>
                <Link href={route('shop.index', {collection: block.collection.id})} className="border border-gray-150 px-5 py-2 rounded-full text-sm">
                    View all
                </Link>
            </div>
            <ProductSlider products={block.collection.home_products}/>
        </Container>
    )
}
