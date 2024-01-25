import {usePage} from "@inertiajs/react";
import React, { Key, SVGProps} from "react";
import {JSX} from "react/jsx-runtime";
import {PageProps} from "@/types";
import NewsLetterForm from "@/Components/Other/NewsLetterForm";
import {imageStorageUrl} from "@/Utils/Helper";

export default () => {
    const {general_settings, footer_links} = usePage<PageProps>().props;
    console.log(general_settings)
    const navigation = {
        social: [
            {
                name: 'Facebook',
                href: general_settings.site_facebook,
                icon: (props: JSX.IntrinsicAttributes & SVGProps<SVGSVGElement>) => (
                    <svg fill="currentColor" viewBox="0 0 24 24" {...props}>
                        <path
                            fillRule="evenodd"
                            d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z"
                            clipRule="evenodd"
                        />
                    </svg>
                ),
            },
            {
                name: 'Instagram',
                href: general_settings.site_instagram,
                icon: (props: JSX.IntrinsicAttributes & SVGProps<SVGSVGElement>) => (
                    <svg fill="currentColor" viewBox="0 0 24 24" {...props}>
                        <path
                            fillRule="evenodd"
                            d="M12.315 2c2.43 0 2.784.013 3.808.06 1.064.049 1.791.218 2.427.465a4.902 4.902 0 011.772 1.153 4.902 4.902 0 011.153 1.772c.247.636.416 1.363.465 2.427.048 1.067.06 1.407.06 4.123v.08c0 2.643-.012 2.987-.06 4.043-.049 1.064-.218 1.791-.465 2.427a4.902 4.902 0 01-1.153 1.772 4.902 4.902 0 01-1.772 1.153c-.636.247-1.363.416-2.427.465-1.067.048-1.407.06-4.123.06h-.08c-2.643 0-2.987-.012-4.043-.06-1.064-.049-1.791-.218-2.427-.465a4.902 4.902 0 01-1.772-1.153 4.902 4.902 0 01-1.153-1.772c-.247-.636-.416-1.363-.465-2.427-.047-1.024-.06-1.379-.06-3.808v-.63c0-2.43.013-2.784.06-3.808.049-1.064.218-1.791.465-2.427a4.902 4.902 0 011.153-1.772A4.902 4.902 0 015.45 2.525c.636-.247 1.363-.416 2.427-.465C8.901 2.013 9.256 2 11.685 2h.63zm-.081 1.802h-.468c-2.456 0-2.784.011-3.807.058-.975.045-1.504.207-1.857.344-.467.182-.8.398-1.15.748-.35.35-.566.683-.748 1.15-.137.353-.3.882-.344 1.857-.047 1.023-.058 1.351-.058 3.807v.468c0 2.456.011 2.784.058 3.807.045.975.207 1.504.344 1.857.182.466.399.8.748 1.15.35.35.683.566 1.15.748.353.137.882.3 1.857.344 1.054.048 1.37.058 4.041.058h.08c2.597 0 2.917-.01 3.96-.058.976-.045 1.505-.207 1.858-.344.466-.182.8-.398 1.15-.748.35-.35.566-.683.748-1.15.137-.353.3-.882.344-1.857.048-1.055.058-1.37.058-4.041v-.08c0-2.597-.01-2.917-.058-3.96-.045-.976-.207-1.505-.344-1.858a3.097 3.097 0 00-.748-1.15 3.098 3.098 0 00-1.15-.748c-.353-.137-.882-.3-1.857-.344-1.023-.047-1.351-.058-3.807-.058zM12 6.865a5.135 5.135 0 110 10.27 5.135 5.135 0 010-10.27zm0 1.802a3.333 3.333 0 100 6.666 3.333 3.333 0 000-6.666zm5.338-3.205a1.2 1.2 0 110 2.4 1.2 1.2 0 010-2.4z"
                            clipRule="evenodd"
                        />
                    </svg>
                ),
            },
            {
                name: 'Twitter',
                href: general_settings.site_twitter,
                icon: (props: JSX.IntrinsicAttributes & SVGProps<SVGSVGElement>) => (
                    <svg fill="currentColor" viewBox="0 0 24 24" {...props}>
                        <path
                            d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84"/>
                    </svg>
                ),
            }
        ],
    }
    return (
        <footer className="bg-white pt-14 border-t border-t-gray-200" aria-labelledby="footer-heading">
            <h2 id="footer-heading" className="sr-only">
                Footer
            </h2>

            <div className={"bg-main-900 relative overflow-hidden"}>
                <svg width="1365" height="449" viewBox="0 0 1365 449" fill="none"
                     xmlns="http://www.w3.org/2000/svg" className={"absolute left-0 right-0 bottom-0 top-0"}>
                    <path
                        d="M1086.55 65.4778C1086.78 64.2767 1086.9 63.0375 1086.9 61.7702C1086.9 50.8768 1078.09 42.0459 1067.23 42.0459C1060.59 42.0459 1054.71 45.3519 1051.15 50.4137C1047.73 47.536 1043.33 45.8029 1038.51 45.8029C1027.76 45.8029 1019.02 54.465 1018.85 65.2139H1018.85C1006.78 65.2139 997 75.0259 997 87.1299C997 99.2339 1006.78 109.046 1018.85 109.046H1083.15C1095.22 109.046 1105 99.2339 1105 87.1299C1105 76.1855 1097 67.1154 1086.55 65.4778Z"
                        fill="#2F80ED"/>
                    <path
                        d="M278.549 404.478C278.777 403.277 278.896 402.037 278.896 400.77C278.896 389.877 270.092 381.046 259.231 381.046C252.586 381.046 246.71 384.352 243.151 389.414C239.734 386.536 235.326 384.803 230.515 384.803C219.758 384.803 211.019 393.465 210.852 404.214H210.85C198.782 404.214 189 414.026 189 426.13C189 438.234 198.782 448.046 210.85 448.046H275.15C287.218 448.046 297 438.234 297 426.13C297 415.185 289.002 406.115 278.549 404.478Z"
                        fill="#2F80ED"/>
                    <path
                        d="M1346.55 189.478C1346.78 188.277 1346.9 187.037 1346.9 185.77C1346.9 174.877 1338.09 166.046 1327.23 166.046C1320.59 166.046 1314.71 169.352 1311.15 174.414C1307.73 171.536 1303.33 169.803 1298.51 169.803C1287.76 169.803 1279.02 178.465 1278.85 189.214H1278.85C1266.78 189.214 1257 199.026 1257 211.13C1257 223.234 1266.78 233.046 1278.85 233.046H1343.15C1355.22 233.046 1365 223.234 1365 211.13C1365 200.185 1357 191.115 1346.55 189.478Z"
                        fill="#2F80ED"/>
                    <path
                        d="M811.549 17.4778C811.777 16.2767 811.896 15.0375 811.896 13.7702C811.896 2.87679 803.092 -5.9541 792.231 -5.9541C785.586 -5.9541 779.71 -2.64808 776.151 2.4137C772.734 -0.463966 768.326 -2.19709 763.515 -2.19709C752.758 -2.19709 744.019 6.46498 743.852 17.2139H743.85C731.782 17.2139 722 27.0259 722 39.1299C722 51.2339 731.782 61.0459 743.85 61.0459H808.15C820.218 61.0459 830 51.2339 830 39.1299C830 28.1855 822.002 19.1154 811.549 17.4778Z"
                        fill="#2F80ED"/>
                    <path
                        d="M1167.55 404.478C1167.78 403.277 1167.9 402.037 1167.9 400.77C1167.9 389.877 1159.09 381.046 1148.23 381.046C1141.59 381.046 1135.71 384.352 1132.15 389.414C1128.73 386.536 1124.33 384.803 1119.51 384.803C1108.76 384.803 1100.02 393.465 1099.85 404.214H1099.85C1087.78 404.214 1078 414.026 1078 426.13C1078 438.234 1087.78 448.046 1099.85 448.046H1164.15C1176.22 448.046 1186 438.234 1186 426.13C1186 415.185 1178 406.115 1167.55 404.478Z"
                        fill="#2F80ED"/>
                    <path
                        d="M367.549 84.4778C367.777 83.2767 367.896 82.0375 367.896 80.7702C367.896 69.8768 359.092 61.0459 348.231 61.0459C341.586 61.0459 335.71 64.3519 332.151 69.4137C328.734 66.536 324.326 64.8029 319.515 64.8029C308.758 64.8029 300.019 73.465 299.852 84.2139H299.85C287.782 84.2139 278 94.0259 278 106.13C278 118.234 287.782 128.046 299.85 128.046H364.15C376.218 128.046 386 118.234 386 106.13C386 95.1855 378.002 86.1154 367.549 84.4778Z"
                        fill="#2F80ED"/>
                    <path
                        d="M186.549 149.478C186.777 148.277 186.896 147.037 186.896 145.77C186.896 134.877 178.092 126.046 167.231 126.046C160.586 126.046 154.71 129.352 151.151 134.414C147.734 131.536 143.326 129.803 138.515 129.803C127.758 129.803 119.019 138.465 118.852 149.214H118.85C106.782 149.214 97 159.026 97 171.13C97 183.234 106.782 193.046 118.85 193.046H183.15C195.218 193.046 205 183.234 205 171.13C205 160.185 197.002 151.115 186.549 149.478Z"
                        fill="#2F80ED"/>
                    <path
                        d="M89.549 16.4778C89.777 15.2767 89.8961 14.0375 89.8961 12.7702C89.8961 1.87679 81.0919 -6.9541 70.231 -6.9541C63.5859 -6.9541 57.7105 -3.64808 54.151 1.4137C50.7335 -1.46397 46.3258 -3.19709 41.5146 -3.19709C30.7582 -3.19709 22.0189 5.46498 21.8522 16.2139H21.8497C9.78236 16.2139 0 26.0259 0 38.1299C0 50.2339 9.78236 60.0459 21.8497 60.0459H86.1505C98.2175 60.0459 108 50.2339 108 38.1299C108 27.1855 100.002 18.1154 89.549 16.4778Z"
                        fill="#2F80ED"/>
                </svg>
                <div className={"container mx-auto px-4 sm:px-6 lg:px-8 relative z-10"}>
                    <div className={"py-20"}>
                        <h2 className={"text-center text-white text-3xl font-bold tracking-tight sm:text-4xl"}>
                            Why choose us?
                        </h2>
                        <div className={"grid lg:gap-4 grid-cols-1 md:grid-cols-2 lg:grid-cols-4 py-10"}>
                            {
                                general_settings.site_footer.map(item => {
                                    return (
                                        <div key={item.id}
                                             className={"bg-white p-4 py-10 flex flex-col items-center justify-center rounded-2xl"}>
                                            <img src={imageStorageUrl(item.image)} alt={item.text} className={"w-24"}/>
                                            <h3 className={"text-lg font-bold"}>{item.text}</h3>
                                        </div>
                                    )
                                })
                            }
                        </div>
                    </div>
                </div>
            </div>

            <div className="container mx-auto px-4 sm:px-6 lg:px-8">
                <div className="pb-8 xl:grid xl:grid-cols-5 xl:gap-8">
                    <div className="grid grid-cols-4 gap-8 xl:col-span-4">
                        {
                            Object.keys(footer_links.items).map((key: string, index: number) => {
                                const column = footer_links.items[key];
                                return (
                                    <div key={index}>
                                        <h3 className="text-sm font-semibold text-gray-400 tracking-wider uppercase">{column.label}</h3>
                                        <ul role="list" className="mt-4 space-y-4">
                                            {
                                                Object.keys(column.children).map((childKey: string, childIdx: number) => {
                                                    const child = column.children[childKey];
                                                    return (
                                                        <li key={childIdx}>
                                                            <a href={child.data.url}
                                                               className="text-base text-gray-500 hover:text-gray-900">
                                                                {child.label}
                                                            </a>
                                                        </li>
                                                    )
                                                })
                                            }
                                        </ul>
                                    </div>
                                )
                            })
                        }
                    </div>
                </div>
                <div className="border-t border-gray-200 pt-8 lg:flex lg:items-center lg:justify-between xl:mt-0">
                    <div>
                        <h3 className="text-sm font-semibold text-gray-400 tracking-wider uppercase">
                            Subscribe to our newsletter
                        </h3>
                        <p className="mt-2 text-base text-gray-500">
                            The latest news, articles, and resources, sent to your inbox weekly.
                        </p>
                    </div>
                    <NewsLetterForm/>
                </div>
                <div className="mt-8 border-t border-gray-200 pt-8 pb-8 md:flex md:items-center md:justify-between">
                    <div className="flex space-x-6 md:order-2">
                        {navigation.social.map((item) => (
                            <a key={item.name} href={item.href} target="_blank"
                               className="text-gray-400 hover:text-gray-500">
                                <span className="sr-only">{item.name}</span>
                                <item.icon className="h-6 w-6" aria-hidden="true"/>
                            </a>
                        ))}
                    </div>
                    <p className="mt-8 text-base text-gray-400 md:mt-0 md:order-1">
                        {general_settings.site_copyright}
                    </p>
                </div>
            </div>
        </footer>
    )
}
