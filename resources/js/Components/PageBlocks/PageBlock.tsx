import {Block, CategoriesBlock, CollectionBlock, GridBlock, SliderBlock} from "@/types/blocks";
import BannerSlider from "@/Components/PageBlocks/BannerSlider";
import Categories from "@/Components/PageBlocks/Categories";
import Grid from "@/Components/PageBlocks/Grid";
import Collection from "@/Components/PageBlocks/Collection";
import {classNames} from "@/Utils/Helper";

export default function PageBlock({ block }: { block: Block }) {
    const renderBlock = (block: Block) => {
        switch (block.name) {
            case 'Slider':
                return (
                    <BannerSlider block={block as SliderBlock}/>
                )
            case 'Categories':
                return (
                    <Categories block={block as CategoriesBlock}/>
                )
            case 'Grid':
                return (
                    <Grid block={block as GridBlock}/>
                )
            case 'Product Collection':
                return (
                    <Collection block={block as CollectionBlock}/>
                )
        }
    }

    return (
        <div className={
            classNames(block.containerWidth === 'container' ? 'container mx-auto px-4 sm:px-6 lg:px-8' : '',
                block.customClasses,
            )
        }>
            {renderBlock(block)}
        </div>
    )
}
