import {createContext, useState} from "react";

export const CartContext = createContext({
    quantity: 0,
    isOpen: false,
    openCart: () => {},
    closeCart: () => {}
});

export function CartProvider({children} : {children: any}) {
    const [quantity, setQuantity] = useState(0);
    const [isOpen, setOpen] = useState(false);

    const openCart = () => {
        setOpen(true);
    }

    const closeCart = () => {
        setOpen(false);
    }

    return (
        <CartContext.Provider value={{ quantity, isOpen, openCart, closeCart }}>
            {children}
        </CartContext.Provider>
    );
}
