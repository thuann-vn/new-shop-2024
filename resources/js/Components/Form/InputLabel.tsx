import { LabelHTMLAttributes } from 'react';

export default function InputLabel({ value, className = '', children, ...props }: LabelHTMLAttributes<HTMLLabelElement> & { value?: string }) {
    return (
        <label {...props} className={`mt-4 mb-2 block text-sm font-medium ` + className}>
            {value ? value : children}
        </label>
    );
}
