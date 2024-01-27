import {Block, GridBlock} from "@/types/blocks";
import PageBlock from "@/Components/PageBlocks/PageBlock";
import Container from "@/Components/Layout/Container";

export default function Grid({ block }: { block: GridBlock }) {
    return (
        <div className={`grid grid-cols-${block.columns.length} gap-x-2`}>
            {
                block.columns.map((column: Block[], index: any) => (
                    <div>
                        {
                            column.map((item: Block, index: any) => (
                                <PageBlock block={item}/>
                            ))
                        }
                    </div>
                ))
            }
        </div>
    )
}
