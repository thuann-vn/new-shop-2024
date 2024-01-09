import { Link, InertiaLinkProps } from '@inertiajs/react';
import {classNames, imageStorageUrl} from "@/Utils/Helper";

export default function NavLink({ active = false, className = '', icon = '', label = '', children, ...props }: InertiaLinkProps & { active: boolean, icon: string | null, label: string }) {
    return (
        <Link
            {...props}
            className={
                classNames("flex items-center text-sm font-medium text-gray-700 hover:text-main-500 hover:bg-main-100 px-4 py-3 rounded-full",
                    className,
                    active ? 'bg-main-100 text-main-500' : ''
                )
            }
        >
            {
                icon ? (
                    <img src={imageStorageUrl(icon)} alt={label}
                         className="h-5 w-5 mr-1"/>
                ) : null
            }
            {label}
        </Link>
    );
}
