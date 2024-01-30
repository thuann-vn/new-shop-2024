import {CardsBlock, TextBlock} from "@/types/blocks";

export default function Text({ block }: { block: TextBlock }) {
    return (
        <>
            {
                block.title ? (
                    <h2 className="font-semibold text-3xl" dangerouslySetInnerHTML={{__html:block.title}}></h2>
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
