import {Collection, ProductCategory, ProductCollection, Slider} from "@/types/index";

export interface Block {
    name: string;
    attributes: any;
    blockData: any;
    containerWidth: string;
    customClasses: string;
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

export interface CollectionBlock extends Block {
    collectionId: number;
    collection: Collection
}

export interface GridBlock extends Block, HasBackgroundStyle, HasTitle {
    columns: [];
    gridColumns: number;
}

