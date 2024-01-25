import {PageProps} from '@/types';
import AppHead from "@/Components/Layout/AppHead";
import {Block} from "@/types/blocks";
import TopCategories from "@/Components/PageBlocks/TopCategories";
import BannerSlider from "@/Components/PageBlocks/BannerSlider";

export default function PageSingle({ pageTitle, content, blocks}: PageProps<{ pageTitle: string, content: string, blocks: Block[] }>) {
    console.log(blocks);
    const renderBlock = (block: Block) => {
        switch (block.name) {
            case 'Slider':
                return (
                    <BannerSlider block={block}/>
                )
            case 'Top Categories':
                return (
                    <TopCategories block={block}/>
                )
        }
    }
    return (
        <>
            <AppHead title= {pageTitle}/>
            <div dangerouslySetInnerHTML={{__html: content}} className={"page-content"}/>
            {
                blocks.map((block, index) => (
                    <div key={index}>
                        {renderBlock(block)}
                    </div>
                ))

            }
        </>
    );
}
