import {CardsBlock} from "@/types/blocks";
import {classNames} from "@/Utils/Helper";
import Card from "@/Components/PageBlocks/Card";

export default function Cards({ block }: { block: CardsBlock }) {
    return (
        <div className="relative py-12 {{ $getBackgroundColourClass() }}">
            <div className="container px-4 mx-auto">
                {
                    block.title ? (
                        <div className="mb-6 prose max-w-none">
                            <h2>{block.title}</h2>
                        </div>
                    ) : null
                }
                <div className={
                    classNames("grid sm:grid-cols-2 gap-4",
                       `md:grid-cols-${block.gridColumns ?? 3}`)
                }>
                    {
                        block.cards.map((card: any, index: any) => (
                            <Card card={card}/>
                        ))
                    }
            </div>
        </div>
</div>

)
}
