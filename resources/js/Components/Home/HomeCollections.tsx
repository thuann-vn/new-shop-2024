import { ReactElement, JSXElementConstructor, ReactNode, Key, ReactPortal } from "react"
import ProductSlider from "@/Components/Products/ProductSlider";

const callouts = [
    {
        name: 'Desk and Office',
        description: 'Work from home accessories',
        imageSrc: 'https://tailwindui.com/img/ecommerce-images/home-page-02-edition-01.jpg',
        imageAlt: 'Desk with leather desk pad, walnut desk organizer, wireless keyboard and mouse, and porcelain mug.',
        href: '#',
    },
    {
        name: 'Self-Improvement',
        description: 'Journals and note-taking',
        imageSrc: 'https://tailwindui.com/img/ecommerce-images/home-page-02-edition-02.jpg',
        imageAlt: 'Wood table with porcelain mug, leather journal, brass pen, leather key ring, and a houseplant.',
        href: '#',
    },
    {
        name: 'Travel',
        description: 'Daily commute essentials',
        imageSrc: 'https://tailwindui.com/img/ecommerce-images/home-page-02-edition-03.jpg',
        imageAlt: 'Collection of four insulated travel bottles on wooden shelf.',
        href: '#',
    },
]

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
                        <a className="border border-gray-150 px-5 py-2 rounded-full text-sm">
                            View all
                        </a>
                    </div>

                    <ProductSlider products={collection.home_products}/>
                </div>
            </div>
        ))
    )
}
