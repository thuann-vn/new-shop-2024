import {Head, usePage} from '@inertiajs/react'
import {PageProps} from "@/types";

const AppHead = ({ title } : {title: string}) => {
    const { general_settings } = usePage<PageProps>().props;
    return (
        <Head>
            <title>{title ? `${title}` : general_settings.site_name}</title>
            <meta name="description" content={general_settings.site_description} />
            <meta name="keywords" content={general_settings.site_keywords} />
            <link rel="icon" href={general_settings.site_favicon} />
        </Head>
    )
}

export default AppHead
