import {classNames} from "@/Utils/Helper";
import {Link, useForm} from "@inertiajs/react";
import {HeartIcon} from "@heroicons/react/24/solid";
import {useTranslation} from "react-i18next";

export default function AccountNav({activeTab}: { activeTab: string }) {
    const {t} = useTranslation();
    return (
        <div className="border-b border-gray-200">
            <ul className="flex flex-wrap -mb-px text-sm font-medium text-center text-gray-500">
                <li className="me-2">
                    <Link href={route('profile.edit')}
                       className={
                           classNames("inline-flex items-center justify-center p-4 border-b-2 rounded-t-lg active group",
                               activeTab === 'profile' ? "text-blue-600 border-blue-600" : "text-gray-400 hover:text-gray-600 hover:border-gray-300")
                       }
                    >
                        <svg
                            className="w-4 h-4 me-2"
                            aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                            viewBox="0 0 20 20">
                            <path
                                d="M10 0a10 10 0 1 0 10 10A10.011 10.011 0 0 0 10 0Zm0 5a3 3 0 1 1 0 6 3 3 0 0 1 0-6Zm0 13a8.949 8.949 0 0 1-4.951-1.488A3.987 3.987 0 0 1 9 13h2a3.987 3.987 0 0 1 3.951 3.512A8.949 8.949 0 0 1 10 18Z"/>
                        </svg>
                        {t('Profile')}
                    </Link>
                </li>
                <li className="me-2">
                    <Link href={route('profile.orders')}
                       className={
                           classNames("inline-flex items-center justify-center p-4 border-b-2 rounded-t-lg active group",
                               activeTab === 'orders' ? "text-blue-600 border-blue-600" : "text-gray-400 hover:text-gray-600 hover:border-gray-300")
                       }
                    >
                        <svg
                            className="w-4 h-4 me-2"
                            aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                            viewBox="0 0 20 20">
                            <path
                                d="M5 11.424V1a1 1 0 1 0-2 0v10.424a3.228 3.228 0 0 0 0 6.152V19a1 1 0 1 0 2 0v-1.424a3.228 3.228 0 0 0 0-6.152ZM19.25 14.5A3.243 3.243 0 0 0 17 11.424V1a1 1 0 0 0-2 0v10.424a3.227 3.227 0 0 0 0 6.152V19a1 1 0 1 0 2 0v-1.424a3.243 3.243 0 0 0 2.25-3.076Zm-6-9A3.243 3.243 0 0 0 11 2.424V1a1 1 0 0 0-2 0v1.424a3.228 3.228 0 0 0 0 6.152V19a1 1 0 1 0 2 0V8.576A3.243 3.243 0 0 0 13.25 5.5Z"/>
                        </svg>
                        {t('Orders')}
                    </Link>
                </li>
                <li className="me-2">
                    <Link href={route('profile.wishlist')}
                          className={
                              classNames("inline-flex items-center justify-center p-4 border-b-2 rounded-t-lg active group",
                                  activeTab === 'wishlist' ? "text-blue-600 border-blue-600" : "text-gray-400 hover:text-gray-600 hover:border-gray-300")
                          }
                    >
                        <HeartIcon className={"w-4 h-4 me-2"}/>
                        {t('Wishlist')}
                    </Link>
                </li>
                <li>
                    <Link href={route('logout')}
                          className={
                              classNames("inline-flex items-center justify-center p-4 rounded-t-lg active text-red-500 hover:text-red-600",)
                          }>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-4 h-4 me-2 ">
                            <path strokeLinecap="round" strokeLinejoin="round" d="M8.25 9V5.25A2.25 2.25 0 0 1 10.5 3h6a2.25 2.25 0 0 1 2.25 2.25v13.5A2.25 2.25 0 0 1 16.5 21h-6a2.25 2.25 0 0 1-2.25-2.25V15M12 9l3 3m0 0-3 3m3-3H2.25" />
                        </svg>
                        {t('Logout')}</Link>
                </li>
            </ul>
        </div>
    )
}
