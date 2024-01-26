import {PageProps} from '@/types';
import AppHead from "@/Components/Layout/AppHead";
import {Block} from "@/types/blocks";
import Categories from "@/Components/PageBlocks/Categories";
import BannerSlider from "@/Components/PageBlocks/BannerSlider";
import PageBlock from "@/Components/PageBlocks";

export default function PageSingle({ pageTitle, content, blocks}: PageProps<{ pageTitle: string, content: string, blocks: Block[] }>) {
    console.log(blocks);
    return (
        <>
            <AppHead title= {pageTitle}/>
            {
                blocks.map((block, index) => (
                    <PageBlock block={block} key={index}/>
                ))
            }
        </>
    );
}
