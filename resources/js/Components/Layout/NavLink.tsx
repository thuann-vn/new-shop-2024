import {Link, InertiaLinkProps} from '@inertiajs/react';
import {classNames, imageStorageUrl} from "@/Utils/Helper";

type NavLinkProps = {
    active: boolean,
    icon: string | null,
    label: string,
    href: string,
    isExternalLink: boolean,
    className?: string,
    target?: string
}
export default function NavLink({
                                    active = false,
                                    className = '',
                                    icon = '',
                                    label = '',
                                    target = '_self',
                                    isExternalLink = false,
                                    href = '',
                                    ...props
                                }: NavLinkProps) {
    if (isExternalLink) {
        return (
            <a
                {...props}
                href={href}
                target={target}
                className={
                    classNames("flex items-center text-[16px] font-bold text-[#D9D9D9] px-2 py-3 uppercase hover:text-white transition-colors duration-200 ease-in-out",
                        className,
                        active ? 'text-[#fff]' : ''
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
            </a>
        );
    }

    return (
        <Link
            {...props}
            href={href}
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
