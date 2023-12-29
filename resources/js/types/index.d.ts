export interface User {
    id: number;
    name: string;
    email: string;
    email_verified_at: string;
}

export type PageProps<T extends Record<string, unknown> = Record<string, unknown>> = T & {
    auth: {
        user: User;
    };

    general_settings: GeneralSettings;
};

export interface GeneralSettings {
    site_name: string;
    site_description: string;
    site_keywords: string;
    site_logo: string;
    site_favicon: string;
    site_email: string;
    site_phone: string;
    site_address: string;
    site_facebook: string;
    site_instagram: string;
    site_twitter: string;
    site_linkedin: string;
    site_youtube: string;
}

export interface Tag{
    id: number;
    name: string;
    slug: string;
    created_at: string;
    updated_at: string;
}

export interface BlogCategory{
    id: number;
    name: string;
    slug: string;
    created_at: string;
    updated_at: string;
}

export interface BlogTag{
    id: number;
    name: string;
}
export interface BlogPost{
    id: number;
    title: string;
    slug: string;
    content: string;
    image: string;
    created_at: string;
    updated_at: string;
    author: User;
    comments: Comment[];
    tags: Tag[];
}

export interface Slider{
    id: number;
    code: string;
    name: string;
    items: SliderItems[]
}

export interface SliderItems{
    id: number;
    title: string;
    subtitle: string;
    image: string;
    created_at: string;
    updated_at: string;
}

export interface Product{
    id: number;
    name: string;
    slug: string;
    description: string;
    featured_image_url: string;
    price: number;
    created_at: string;
    updated_at: string;
}

export interface ProductCollection{
    data: Product[];
}

export interface ProductCategory{
    id: number;
    name: string;
    slug: string;
    description: string;
    image: string;
    created_at: string;
    updated_at: string;
}

export interface Address{
    id: number;
    name: string;
    phone: string;
    email: string;
    street: string;
    province: string;
    district: string;
    ward: string;
    created_at: string;
    updated_at: string;
}

export interface PaymentMethod{
    code: string;
    name: string;
    description: string;
}
export interface ShippingMethod{
    code: string;
    name: string;
    description: string;
}

export interface Order{
    id: number;
    number: string;
    total_price: number;
    tax: number;
    shipping_price:number;
    discount: number;
    shipping_method_detail: ShippingMethod;
    payment_method_detail: PaymentMethod;
    items: OrderItem[];
    address: Address[]
    status: string;
    created_at: string;
    updated_at: string;
}

export interface OrderItem{
    id: number;
    order_id: number;
    product_id: number;
    qty: number;
    unit_price: number;
    total_price: number;
    created_at: string;
    updated_at: string;
    product: Product;
}

export interface OrderCollection{
    data: Order[];
    links: any[]
}

export interface WishListItem{
    product_id: number;
    product: Product;
}

export interface WishList{
    data: WishListItem[];
    links: any[]
}
