import './bootstrap';
import '../css/app.css';
import './i18n';

import { createRoot } from 'react-dom/client';
import { createInertiaApp } from '@inertiajs/react';
import Layout from "@/Layouts/Layout";
import i18n from "@/i18n";
import 'moment/dist/locale/vi';

createInertiaApp({
    title: (title) => `${title}`,
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
            const locale = props.initialPage.props?.locale || 'vi';
            const jsonFile = (await import(`../lang/${locale}.json`)).default;
            if (typeof locale === "string") {
                i18n.addResourceBundle(locale, 'translation', jsonFile, true, true);
                await i18n.changeLanguage(locale)
            }
            // @ts-ignore
            moment.locale(locale);
        }catch (e){
            console.log(e)
        }

        root.render(<App {...props} />);
    },
    progress: {
        color: '#4B5563',
    },
});
