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

export interface TextBlock extends Block {
    title: string;
    content: string
}

export interface ContactFormBlock extends Block {
    title: string;
    content: string
}

export interface CategoriesBlock extends Block {
    title?: string;
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

export interface CardsBlock extends Block, HasBackgroundStyle, HasTitle {
    cards: Card[];
    gridColumns: number;
}

export interface Card {
    blockStyles: string;
    title: string;
    text: string;
    imageUrl: string;
    callToActions: CallToAction[];
}

export interface CallToAction{
    buttonStyle: string;
    label: string;
    openNewWindow: boolean;
    url: string;
}
