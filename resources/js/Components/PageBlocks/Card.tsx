import {Card as CardType} from "@/types/blocks";
import CallToAction from "@/Components/PageBlocks/CallToAction";

export default function Card({ card }: { card: CardType }) {
    return (
        <div
            className="relative transition-all duration-300 ease-out bg-white group card @if($isFullyClickable()) hover:shadow-md @endif">
            <div className="p-4 prose sm:p-6 max-w-none">
                {
                    card.imageUrl ? (
                        <img src={card.imageUrl} alt="" className="card__image"/>
                    ) : null
                }
                {
                    card.title ? (
                        <h3 className="card__title" dangerouslySetInnerHTML={{__html: card.title}}>
                        </h3>
                    ) : null
                }
                {
                    card.text ? (
                        <div
                            className="card__description" dangerouslySetInnerHTML={{__html: card.text}}></div>
                    ) : null
                }
                {
                    card.callToActions && card.callToActions.length ? (
                        <div className={"flex flex-wrap gap-4 mt-3 justify-center"}>
                            {
                                card.callToActions.map((callToAction: any, index: any) => (
                                    <CallToAction data={callToAction} key={index}/>
                                ))
                            }
                        </div>
                    ) : null
                }
        </div>
</div>

)
}
