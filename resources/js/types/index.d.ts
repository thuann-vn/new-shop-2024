export interface User {
    id: number;
    name: string;
    email: string;
    email_verified_at: string;
    photo: string;
}

export interface Localized{
    [key: string]: string;
}

export type PageProps<T extends Record<string, unknown> = Record<string, unknown>> = T & {
    auth: {
        user: User;
    };
    cart: Cart;
    general_settings: GeneralSettings;
    wishlist: number[],
    navigation: MenuItems,
    category_navigation: MenuItems,
    footer_links: MenuItems,
    shop: ShopSettings,
    flash: {
        success: string;
        error: string;
    }
};

export interface ShopSettings{
    shop_currency_thousand_separator: string;
    shop_currency_decimal_separator: string;
    shop_currency_decimal_digit: number;
    shop_currency_symbol: string;
    shop_currency_symbol_position: string;
    shop_currency_symbol_space: boolean;
    shop_currency_code: string;
    shop_currency_name: string;
    shop_currency_decimal_number: number;
}
export interface Navigation{
    items: MenuItems;
}

export interface MenuItems{
    [key: string]: MenuItem
}

export interface MenuItem{
    label: string;
    children: MenuItems;
    data: MenuItemOptions;
    type: string;
}

export interface MenuItemOptions{
    icon: string;
    url: string;
    target: string;
    classes: string;
}

export interface Cart{
    items: CartItem[];
    count: number;
    total: number;
    total_items: number;
}

export interface CartItem{
    rowId: string;
    id: number;
    name: string;
    product_id: number;
    qty: number;
    price: number;
    created_at: string;
    updated_at: string;
    product: Product;
    options: CartItemOptions;
}
export interface CartItemOptions{
    [key: string]: string;
}

export interface GeneralSettings {
    site_name: string;
    site_description: string;
    site_keywords: string;
    site_logo: string;
    site_favicon: string;
    site_copyright: string;
    site_email: string;
    site_phone: string;
    site_address: string;
    site_facebook: string;
    site_instagram: string;
    site_twitter: string;
    site_linkedin: string;
    site_youtube: string;
    site_footer: any[];
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
    items: SliderItems[];
    display_type: string;
}

export interface SliderItems{
    id: number;
    title: string;
    subtitle: string;
    image_url: string;
    link: string;
    is_image_only: boolean;
    is_alt_style: boolean;
    is_visible: boolean;
    created_at: string;
    updated_at: string;
}

export interface Product{
    id: number;
    name: string;
    slug: string;
    sku: string;
    description: string;
    featured_image_url: string;
    price: number;
    old_price: number;
    created_at: string;
    updated_at: string;
    content: string;
    specifications: ProductSpecification[];
    brand: Brand,
    has_variants: boolean;
    qty: number;
    featured: boolean;
}

export interface ProductVariant{
    id: number;
    name: string;
    sku: string;
    price: number;
    old_price: number;
    qty: number;
    created_at: string;
    updated_at: string;
    specifications: ProductSpecification[];
}

export interface Brand{
    id: number;
    name: string;
    slug: string;
    description: string;
    image: string;
    created_at: string;
    updated_at: string;
}

export interface ProductSpecification{
    name: string;
    value: string;
}

export interface ProductCollection{
    data: Product[];
    meta: any;
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

export interface Collection{
    id: number;
    name: string;
    slug: string;
    description: string,
    image: string,
    items : Product[],
    home_products: Product[],
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
    shop_variant_name: string;
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

export interface Media{
    id: number;
    name: string;
    original_url: string;
    preview_url: string;
    created_at: string;
    updated_at: string;
}
