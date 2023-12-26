import {forwardRef, useEffect, useImperativeHandle, useRef, InputHTMLAttributes} from 'react';
import {classNames} from "@/Utils/Helper";

export default forwardRef(function TextInput(
    {type = 'text', className = '', containerClassName= '', isFocused = false, left = null, ...props}: InputHTMLAttributes<HTMLInputElement> & { isFocused?: boolean, left?: any, containerClassName?: string },
    ref
) {
    const localRef = useRef<HTMLInputElement>(null);

    useImperativeHandle(ref, () => ({
        focus: () => localRef.current?.focus(),
    }));

    useEffect(() => {
        if (isFocused) {
            localRef.current?.focus();
        }
    }, []);

    return (
        <div className={
            classNames("relative",containerClassName)
        }>
            <input
                {...props}
                type={type}
                className={
                    classNames(
                        'w-full rounded-md border border-gray-200 px-4 py-3  text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500',
                        left ? 'pl-11' : '',
                        className
                    )}
                ref={localRef}
            />
            {left && (
                <div className="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">
                    {left()}
                </div>
            )}
        </div>
    );
});
