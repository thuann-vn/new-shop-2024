import moment from "moment";

export function classNames(...classes: string[]) {
    return classes.filter(Boolean).join(' ')
}

export function imageStorageUrl(path: string) : string {
    return `/storage/${path}`;
}

export function formatDate(date: string) : string {
    return moment(date).format('DD MMMM YYYY');
}

export function getDiscountedPercent(oldPrice: number, price: number) : number {
    return Math.round((oldPrice - price) / oldPrice * 100);
}
