import {forwardRef, useEffect, useImperativeHandle, useRef, InputHTMLAttributes, TextareaHTMLAttributes} from 'react';
import {classNames} from "@/Utils/Helper";

export default forwardRef(function TextArea(
    {className = '', containerClassName= '', isFocused = false, left = null, ...props}: TextareaHTMLAttributes<HTMLTextAreaElement> & { isFocused?: boolean, left?: any, containerClassName?: string },
    ref
) {
    const localRef = useRef<HTMLTextAreaElement>(null);

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
            <textarea
                {...props}
                className={
                    classNames(
                        'w-full rounded-md border border-gray-200 px-4 py-3  text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500',
                        left ? 'pl-11' : '',
                        className
                    )}
                ref={localRef}
            >{props.children}</textarea>
        </div>
    );
});
