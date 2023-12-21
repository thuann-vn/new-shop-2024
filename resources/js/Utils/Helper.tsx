export function classNames(...classes) {
    return classes.filter(Boolean).join(' ')
}

export function imageStorageUrl(path: string) : string {
    return `/storage/${path}`;
}
