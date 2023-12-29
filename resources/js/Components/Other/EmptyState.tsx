import {Link} from "@inertiajs/react";
import {ArrowRightIcon} from "@heroicons/react/24/solid";

export default function EmptyState({title, description, children}: { title: string, description: string, children?: any }) {
    return (
        <div className="text-center">
            {children}
            <h3 className="mt-2 text-sm font-medium text-gray-900">
                {title}
            </h3>
            <p className="mt-1 text-sm text-gray-500">
                {description}
            </p>
            <div className="mt-6">
                <Link
                    href={route('home')}
                    className="inline-flex items-center px-4 py-2 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                >
                    Shop now <ArrowRightIcon className={"w-4 h-4 ms-2"}/>
                </Link>
            </div>
        </div>
    )
}
