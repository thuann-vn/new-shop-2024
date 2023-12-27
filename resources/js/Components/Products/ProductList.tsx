import ProductCard from "@/Components/Products/ProductCard";
import { Key } from "react";
import {ProductCollection} from "@/types";

export default function ProductList({products}: { products: ProductCollection }) {
    return (
        <div className="grid
            grid-cols-1
            sm:grid-cols-2
            lg:grid-cols-3
            xl:grid-cols-4
            xl:gap-x-8
            border
            border-gray-150
            border-b-0
            rounded-lg
            bg-white
            overflow-hidden
            [&>*:nth-child(3)]:border-r-transparent
            "
        >
            {products.data.map((product: { id: Key | null | undefined; }) => (
                <ProductCard product={product} key={product.id} className={"border-b-gray-200"}/>
            ))}
        </div>
    )
}
