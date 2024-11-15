import Layout from '@/Layouts/Layout';
import {Head, Link, router} from '@inertiajs/react';
import {Order, OrderCollection, PageProps, Product} from '@/types';
import AccountNav from "@/Components/Account/AccountNav";
import OrderItem from "@/Components/Account/OrderItem";
import Pagination from "@/Components/Other/Pagination";
import AppHead from "@/Components/Layout/AppHead";
import {useTranslation} from "react-i18next";

export default function Orders({orders, links}: { orders: OrderCollection, links: any }) {
    const {t} = useTranslation();
    return (
        <>
            <AppHead title={t("Dashboard")}/>

            <div className="py-12">
                <div className="container mx-auto px-4 sm:px-6 lg:px-8">
                    <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <AccountNav activeTab={'orders'}/>
                        <div className="py-6 bg-white">
                            <h1 className="text-2xl font-extrabold tracking-tight text-gray-900 sm:text-3xl">
                                {t('Order history')}</h1>
                            <p className="mt-2 text-sm text-gray-500">
                                {t('Check the status of recent orders, manage returns, and discover similar products.')}
                            </p>

                            <div className="mt-6">
                                <h2 className="sr-only">{t('Recent orders')}</h2>
                                <div>
                                    {orders.data.map((order) => (
                                        <OrderItem order={order} key={order.id}/>
                                    ))}
                                </div>

                                <div className={"mt-3"}>
                                    <Pagination data={links} meta={orders.meta}/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}
