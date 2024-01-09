import defaultTheme from 'tailwindcss/defaultTheme';
import forms from '@tailwindcss/forms';
import aspectRatio from '@tailwindcss/aspect-ratio';

/** @type {import('tailwindcss').Config} */
export default {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
        './resources/js/**/*.tsx',
    ],

    theme: {
        extend: {
            fontFamily: {
                sans: ['Figtree', ...defaultTheme.fontFamily.sans],
            },
            gridTemplateRows: {
                '[auto,auto,1fr]': 'auto auto 1fr',
            },
            colors: {
                'main': {
                    '50': '#eef5ff',
                    '100': '#dae8ff',
                    '200': '#bdd8ff',
                    '300': '#90c0ff',
                    '400': '#5b9dff',
                    '500': '#3578fc',
                    '600': '#1e58f2',
                    '700': '#1640d6',
                    '800': '#1936b4',
                    '900': '#1a338e',
                    '950': '#152156',
                },
                'secondary': {
                    '50': '#fefce8',
                    '100': '#fffac2',
                    '200': '#fff288',
                    '300': '#ffe344',
                    '400': '#fecf10',
                    '500': '#eeb604',
                    '600': '#cd8c01',
                    '700': '#a46304',
                    '800': '#874d0c',
                    '900': '#733f10',
                    '950': '#432005',
                },
            }
        },
    },

    plugins: [forms, aspectRatio],
};
