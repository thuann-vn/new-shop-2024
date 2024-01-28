import {classNames} from "@/Utils/Helper";
import {CallToAction as CallToActionType} from "@/types/blocks";

export default function CallToAction({data}: { data: CallToActionType }) {
    return (
        <div>
            <a href={data.url}
               title={data.label}
               className={classNames(data.buttonStyle)}
               target={data.openNewWindow ? "_blank" : "_self"}
               rel={data.openNewWindow ? "noopener noreferrer" : ""}
            >
                {data.label}
            </a>
        </div>
    )
}
