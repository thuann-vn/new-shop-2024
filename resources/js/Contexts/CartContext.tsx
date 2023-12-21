import {createContext, useState} from "react";

export const CartContext = createContext({
    quantity: 0,
    isOpen: false,
    addToCart: (q:number) => {},
    openCart: () => {},
    closeCart: () => {}
});

export function CartProvider({children} : {children: any}) {
    const [quantity, setQuantity] = useState(0);
    const [isOpen, setOpen] = useState(false);

    const addToCart = (q:number) => {
        setQuantity(prevQuantity => prevQuantity + q);
    };

    const openCart = () => {
        setOpen(true);
    }

    const closeCart = () => {
        setOpen(false);
    }

    return (
        <CartContext.Provider value={{ quantity, isOpen, addToCart, openCart, closeCart }}>
            {children}
        </CartContext.Provider>
    );
}
