import {MagnifyingGlassIcon} from "@heroicons/react/24/outline";

export default function SearchForm() {
    return (
        <form className="flex-1 lg:w-0 ms-8" action="#" method="GET">
            <div className="relative w-full text-gray-400 focus-within:text-gray-600">
                <label htmlFor="search" className="sr-only">Search</label>
                <input id="search" name="search"
                       className="block w-full bg-white py-3 pr-10 pl-3 border border-transparent rounded-full leading-5 text-gray-900 placeholder-gray-500 focus:outline-none focus:bg-white focus:border-transparent focus:ring-0 sm:text-sm"
                       placeholder="Search for your products..." type="search"/>
                <div className="absolute inset-y-0 right-4 flex items-center pointer-events-none">
                    <MagnifyingGlassIcon className="h-6 w-6" aria-hidden="true"/>
                </div>
            </div>
        </form>
    )
}
