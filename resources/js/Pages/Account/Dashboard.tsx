import Layout from '@/Layouts/Layout';
import {Head} from '@inertiajs/react';
import {PageProps} from '@/types';
import AccountNav from "@/Components/Account/AccountNav";

export default function Dashboard({}: PageProps) {
    return (
        <>
            <Head title="Dashboard"/>

            <div className="py-12">
                <div className="container mx-auto sm:px-6 lg:px-8">
                    <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <AccountNav activeTab={'dashboard'}/>
                        <div className="p-6 bg-white border-b border-gray-200">
                            You're logged in!
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}
