import { PropsWithChildren } from 'react';
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
import Footer from "@/Components/Layout/Footer";

export default function Layout({ children }: PropsWithChildren<{  }>) {
    return (
        <div className="min-h-screen">
            <CartProvider>
                <Header />
                <main>{children}</main>
                <CartModal/>
                <Footer/>
            </CartProvider>
        </div>
    );
}
