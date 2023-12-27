import {ChevronLeftIcon, ChevronRightIcon} from '@heroicons/react/20/solid'
import {Link} from "@inertiajs/react";

const items = [
    {id: 1, title: 'Back End Developer', department: 'Engineering', type: 'Full-time', location: 'Remote'},
    {id: 2, title: 'Front End Developer', department: 'Engineering', type: 'Full-time', location: 'Remote'},
    {id: 3, title: 'User Interface Designer', department: 'Design', type: 'Full-time', location: 'Remote'},
]

export default function Pagination({data}: { data: any }) {
    return (
        <div className="bg-white px-4 py-3 sm:px-6">
            <div className="flex flex-col content-center items-center">
                <div className={"mt-3 mb-3"}>
                    <p className="text-sm text-gray-500">
                        Showing <span className="font-medium">{(data.current_page - 1) * data.per_page + 1}</span> to <span
                        className="font-medium">{Math.min(data.current_page * data.per_page + data.per_page, data.total)}</span> of{' '}
                        <span className="font-medium">{data.total}</span> results
                    </p>
                </div>
                <div>
                    <nav className="isolate inline-flex -space-x-px rounded-md shadow-sm" aria-label="Pagination">
                        {
                            data.links.map((link: any) => {
                                if (link.active) {
                                    return (
                                        <a
                                            href="#"
                                            aria-current="page"
                                            className="relative rounded-full z-10 inline-flex items-center bg-indigo-600 px-4 py-2 text-sm font-semibold text-white focus:z-20 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                                            dangerouslySetInnerHTML={{__html: link.label}}
                                        >
                                        </a>
                                    )
                                } else {
                                    return (
                                        <Link
                                            href={link.url}
                                            className="relative rounded-full inline-flex items-center px-4 py-2 text-sm font-semibold text-gray-600 hover:bg-gray-50 focus:z-20 focus:outline-offset-0"
                                            dangerouslySetInnerHTML={{__html: link.label}}
                                        >
                                        </Link>
                                    )
                                }
                            })
                        }
                    </nav>
                </div>
            </div>
        </div>
    )
}
