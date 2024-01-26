import {Block, CategoriesBlock, GridBlock, SliderBlock} from "@/types/blocks";
import BannerSlider from "@/Components/PageBlocks/BannerSlider";
import Categories from "@/Components/PageBlocks/Categories";
import Grid from "@/Components/PageBlocks/Grid";

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
        }
    }

    return (
        renderBlock(block)
    )
}
