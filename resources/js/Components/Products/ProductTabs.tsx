import {Tab} from '@headlessui/react'
import {JSXElementConstructor, ReactElement, ReactNode, ReactPortal, useState} from "react";
import {classNames} from "@/Utils/Helper";
import ProductReviews from "@/Components/Products/ProductReviews";
import {Product, ProductSpecification} from "@/types";
import {useTranslation} from "react-i18next";

export default function ProductTabs({product}: { product: Product }) {
    const [activeTab, setActiveTab] = useState(0);
    const {t} = useTranslation()
    return (
        <div className={'bg-white border border-gray-200 mt-3 rounded-lg'}>
            <Tab.Group onChange={(index) => setActiveTab(index)}>
                <Tab.List className={"border-b"}>
                    <Tab
                        className={classNames("px-5 py-5 font-bold text-md uppercase outline-0", activeTab != 0 ? 'text-gray-400' : '')}>
                        {t('Description')}
                    </Tab>
                    <Tab
                        className={classNames("px-5 py-5 font-bold text-md uppercase outline-0", activeTab != 1 ? 'text-gray-400' : '')}>
                        {t('Additional Information')}
                    </Tab>
                    {/*<Tab*/}
                    {/*    className={classNames("px-5 py-5 font-bold text-md uppercase outline-0", activeTab != 2 ? 'text-gray-400' : '')}>Reviews</Tab>*/}
                </Tab.List>
                <Tab.Panels>
                    <Tab.Panel className={"px-5 py-5"}>
                        <div dangerouslySetInnerHTML={{__html: product.content}}></div>
                    </Tab.Panel>
                    <Tab.Panel className={"px-5 py-5"}>
                        {
                            (product.specifications || []).map((spec, idx) => {
                                return (
                                    <div key={"spec_" + idx} className={"flex flex-row"}>
                                        <div className={"w-1/3"}>{spec.name}</div>
                                        <div className={"w-2/3"}>{spec.value}</div>
                                    </div>
                                );
                            })
                        }
                    </Tab.Panel>
                    {/*<Tab.Panel className={"px-5 py-5"}>*/}
                    {/*    <ProductReviews/>*/}
                    {/*</Tab.Panel>*/}
                </Tab.Panels>
            </Tab.Group>
        </div>
    )
}
