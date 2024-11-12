import {PageProps} from '@/types';
import AppHead from "@/Components/Layout/AppHead";
import {Block} from "@/types/blocks";
import PageBlock from "@/Components/PageBlocks/PageBlock";

export default function PageSingle({ pageTitle, content, blocks}: PageProps<{ pageTitle: string, content: string, blocks: Block[] }>) {
    console.log(blocks);
    return (
        <>
            <AppHead title= {pageTitle}/>
            <div>
                {
                    blocks.map((block, index) => (
                        <PageBlock block={block} key={index}/>
                    ))
                }
            </div>
        </>
    );
}
