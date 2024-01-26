import {Block, GridBlock} from "@/types/blocks";
import PageBlock from "@/Components/PageBlocks/Index";
import Container from "@/Components/Layout/Container";

export default function Grid({ block }: { block: GridBlock }) {
    return (
        <div>
            <Container>
                <div className={`grid grid-cols-${block.columns.length} gap-2`}>
                    {
                        block.columns.map((column: Block[], index: any) => (
                            <div>
                                {
                                    column.map((item: Block, index: any) => (
                                        <div>
                                            <PageBlock block={item}/>
                                        </div>
                                    ))
                                }
                            </div>
                        ))
                    }
                </div>
            </Container>
        </div>
    )
}
