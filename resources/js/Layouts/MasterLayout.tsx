import { useState, PropsWithChildren, ReactNode } from 'react';
import { User } from '@/types';
import SubcribeForm from "@/Components/Layout/SubcribeForm";
import CartModal from "@/Components/Layout/CartModal";
import Header from "@/Components/Layout/Header";

export default function MasterLayout({ user, children }: PropsWithChildren<{ user: User }>) {
    const [showingNavigationDropdown, setShowingNavigationDropdown] = useState(false);

    return (
        <div className="min-h-screen bg-gray-100">
            <Header />
            <main>{children}</main>
            <SubcribeForm/>
            <CartModal/>
        </div>
    );
}
