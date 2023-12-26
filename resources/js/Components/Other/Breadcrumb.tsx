import {Link} from "@inertiajs/react";
import * as React from "react";

export default function Breadcrumb({breadcrumbs}: { breadcrumbs: any[] }) {
    return (
        <nav aria-label="Breadcrumb">
            <ol role="list"
                className="mx-auto flex items-center space-x-2">
                {breadcrumbs.map((breadcrumb) => (
                    <li key={breadcrumb.id}>
                        {
                            breadcrumb.href ? (
                                <div className="flex items-center">
                                    <Link href={breadcrumb.href} className="mr-2 text-sm font-medium text-gray-900">
                                        {breadcrumb.name}
                                    </Link>
                                    <svg
                                        width={16}
                                        height={20}
                                        viewBox="0 0 16 20"
                                        fill="currentColor"
                                        aria-hidden="true"
                                        className="h-5 w-4 text-gray-300"
                                    >
                                        <path d="M5.697 4.34L8.98 16.532h1.327L7.025 4.341H5.697z"/>
                                    </svg>
                                </div>
                            ) : (
                                <span aria-current="page"
                                   className="text-sm font-medium text-gray-500 hover:text-gray-600">
                                    {breadcrumb.name}
                                </span>
                            )
                        }

                    </li>
                ))}
            </ol>
        </nav>
    )
}
