import {
    Block,
    CardsBlock,
    CategoriesBlock,
    CollectionBlock,
    ContactFormBlock,
    GridBlock,
    SliderBlock,
    TextBlock
} from "@/types/blocks";
import BannerSlider from "@/Components/PageBlocks/BannerSlider";
import Categories from "@/Components/PageBlocks/Categories";
import Grid from "@/Components/PageBlocks/Grid";
import Collection from "@/Components/PageBlocks/Collection";
import {classNames} from "@/Utils/Helper";
import Cards from "@/Components/PageBlocks/Cards";
import Text from "@/Components/PageBlocks/Text";
import ContactForm from "@/Components/PageBlocks/ContactForm";

export default function PageBlock({ block }: { block: Block }) {
    const renderBlock = (block: Block) => {
        switch (block.name) {
            case 'Text':
                return (
                    <Text block={block as TextBlock}/>
                )
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
            case 'Cards':
                return (
                    <Cards block={block as CardsBlock}/>
                )
            case 'Contact Form':
                return (
                    <ContactForm block={block as ContactFormBlock}/>
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
