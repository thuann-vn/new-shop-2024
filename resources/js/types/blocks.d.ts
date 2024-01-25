import {ProductCategory, Slider} from "@/types/index";

export interface Block {
    name: string;
    attributes: any;
    blockData: any;
    blockStyle: any
}

export interface TopCategoriesBlock extends Block {
    categoryIds: number[];
    categories: ProductCategory[];
}

export interface SliderBlock extends Block {
    sliderId: number;
    slider: Slider
}
