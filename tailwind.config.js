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
                    '50': '#eff5ff',
                    '100': '#dce8fd',
                    '200': '#c0d7fd',
                    '300': '#95bffb',
                    '400': '#639cf7',
                    '500': '#3e79f3',
                    '600': '#2959e7',
                    '700': '#2046d5',
                    '800': '#2139ac',
                    '900': '#233a95',
                    '950': '#182353',
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
