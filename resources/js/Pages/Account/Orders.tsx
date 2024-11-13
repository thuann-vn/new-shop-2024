import Layout from '@/Layouts/Layout';
import {Head, Link, router} from '@inertiajs/react';
import {Order, OrderCollection, PageProps, Product} from '@/types';
import AccountNav from "@/Components/Account/AccountNav";
import OrderItem from "@/Components/Account/OrderItem";
import Pagination from "@/Components/Other/Pagination";
import AppHead from "@/Components/Layout/AppHead";

export default function Orders({orders}: { orders: OrderCollection }) {
    return (
        <>
            <AppHead title="Dashboard"/>

            <div className="py-12">
                <div className="container mx-auto px-4 sm:px-6 lg:px-8">
                    <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <AccountNav activeTab={'orders'}/>
                        <div className="py-6 bg-white">
                            <h1 className="text-2xl font-extrabold tracking-tight text-gray-900 sm:text-3xl">Order
                                history</h1>
                            <p className="mt-2 text-sm text-gray-500">
                                Check the status of recent orders, manage returns, and discover similar products.
                            </p>

                            <div className="mt-6">
                                <h2 className="sr-only">Recent orders</h2>
                                <div>
                                    {orders.data.map((order) => (
                                        <OrderItem order={order} key={order.id}/>
                                    ))}
                                </div>

                                <div className={"mt-3"}>
                                    <Pagination data={orders} meta={orders.meta}/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}
