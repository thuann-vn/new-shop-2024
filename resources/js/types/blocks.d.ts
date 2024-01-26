import {ProductCategory, Slider} from "@/types/index";

export interface Block {
    name: string;
    attributes: any;
    blockData: any;
    blockStyle: any
}

export interface HasBackgroundStyle {
    backgroundColourType: string;
}

export interface HasTitle{
    title: string;
}

export interface CategoriesBlock extends Block {
    categoryIds: number[];
    categories: ProductCategory[];
}

export interface SliderBlock extends Block {
    sliderId: number;
    slider: Slider
}

export interface GridBlock extends Block, HasBackgroundStyle, HasTitle {
    columns: [];
    gridColumns: number;
}

