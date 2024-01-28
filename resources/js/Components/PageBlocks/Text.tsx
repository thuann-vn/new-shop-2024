import {CardsBlock, TextBlock} from "@/types/blocks";

export default function Text({ block }: { block: TextBlock }) {
    return (
        <>
            {
                block.title ? (
                    <h2 dangerouslySetInnerHTML={{__html:block.title}}></h2>
                ) : null
            }
            {
                block.content ? (
                    <div dangerouslySetInnerHTML={{__html: block.content}}></div>
                ) : null
            }
        </>

)
}
