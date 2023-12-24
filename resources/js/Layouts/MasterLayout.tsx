import { useState, PropsWithChildren, ReactNode } from 'react';
import { User } from '@/types';
import SubcribeForm from "@/Components/Layout/SubcribeForm";
import CartModal from "@/Components/Layout/CartModal";
import Header from "@/Components/Layout/Header";

// Import Swiper styles
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';
import 'swiper/css/scrollbar';
import 'swiper/css/thumbs';
import 'swiper/css/effect-coverflow';
import 'swiper/css/mousewheel';
import 'swiper/css/autoplay';
import 'swiper/css/effect-fade';
import 'swiper/css/grid';
import {CartProvider} from "@/Contexts/CartContext";

export default function MasterLayout({ children }: PropsWithChildren<{  }>) {
    return (
        <div className="min-h-screen">
            <CartProvider>
                <Header />
                <main>{children}</main>
                <SubcribeForm/>
                <CartModal/>
            </CartProvider>
        </div>
    );
}
