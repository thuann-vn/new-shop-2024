import './bootstrap';
import '../css/app.css';
import './i18n';

import { createRoot } from 'react-dom/client';
import { createInertiaApp } from '@inertiajs/react';
import { resolvePageComponent } from 'laravel-vite-plugin/inertia-helpers';
import Layout from "@/Layouts/Layout";
import i18n from "@/i18n";

const appName = import.meta.env.VITE_APP_NAME || 'Laravel';

createInertiaApp({
    title: (title) => `${title} - ${appName}`,
    resolve: (name) => {
        const pages = import.meta.glob('./Pages/**/*.tsx',  { eager: true })
        let page = pages[`./Pages/${name}.tsx`]
        // @ts-ignore
        page.default.layout = page.default.layout || (page => <Layout children={page} />)
        return page
    },
// @ts-ignore
    async setup({ el, App, props }) {
        const root = createRoot(el);
        try{
            const locale = props.initialPage.props?.locale || 'en';
            const jsonFile = (await import(`../lang/${locale}.json`)).default;
            if (typeof locale === "string") {
                i18n.addResourceBundle(locale, 'translation', jsonFile, true, true);
            }
            // @ts-ignore
            moment.locale(locale == 'no' ? 'nb' : locale);
        }catch (e){
            console.log(e)
        }

        root.render(<App {...props} />);
    },
    progress: {
        color: '#4B5563',
    },
});
