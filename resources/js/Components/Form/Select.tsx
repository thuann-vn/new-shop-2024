import {Fragment, useState, useEffect, JSXElementConstructor, Key, ReactElement, ReactNode, ReactPortal} from 'react'
import {Combobox, Transition} from '@headlessui/react'
import {CheckIcon, ChevronUpDownIcon} from '@heroicons/react/20/solid'
import {classNames} from "@/Utils/Helper";

interface SelectProps {
    name: string,
    options: { value: any, label: string }[],
    value: any,
    onChange: (value: any) => void,
    placeholder?: string,
    required?: boolean,
    className: string
}
export default function Select({ name, options, value, onChange, placeholder = '', required = false, className } : SelectProps) {
    const [selected, setSelected] = useState(options.find((option: { value: any, label: string }) => option.value === value) ?? null)
    const [query, setQuery] = useState('')

    useEffect(() => {
        setSelected(options.find((option: { value: any }) => option.value === value) ?? null)
    }, [value])

    const filteredOptions =
        query === ''
            ? options
            : options.filter((option: { label: string }) =>
                option.label
                    .toLowerCase()
                    .replace(/\s+/g, '')
                    .includes(query.toLowerCase().replace(/\s+/g, ''))
            )

    return (
        <Combobox value={selected}
                  onChange={(value) => {
                      onChange(value?.value)
                      setSelected(value)
                  }}
        >
            <div className={classNames("relative", className)}>
                <div
                    className="relative rounded-md border border-gray-200 py-1 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500">
                    <Combobox.Input
                        className="w-full border-none py-2 pl-3 pr-10 text-sm leading-5 text-gray-900 focus:ring-0"
                        displayValue={(selected: {label: string}) => selected?.label}
                        onChange={(event) => setQuery(event.target.value)}
                        placeholder={placeholder}
                        onFocus={(event) => {
                            //Select all text on focus
                            event.target.select()
                        }}
                        autoComplete="off"
                        required={required}
                        name={name}
                    />
                    <Combobox.Button className="absolute inset-y-0 right-0 flex items-center pr-2">
                        <ChevronUpDownIcon
                            className="h-5 w-5 text-gray-400"
                            aria-hidden="true"
                        />
                    </Combobox.Button>
                </div>
                <Transition
                    as={Fragment}
                    leave="transition ease-in duration-100"
                    leaveFrom="opacity-100"
                    leaveTo="opacity-0"
                    afterLeave={() => setQuery('')}
                >
                    <Combobox.Options
                        className="absolute z-30 mt-1 max-h-60 w-full overflow-auto rounded-md bg-white py-1 text-base shadow-lg ring-1 ring-black/5 focus:outline-none sm:text-sm">
                        {filteredOptions.length === 0 && query !== '' ? (
                            <div className="relative cursor-default select-none py-2 text-gray-700">
                                Nothing found.
                            </div>
                        ) : (
                            filteredOptions.map((option: { value: Key | null | undefined; label: string | number | boolean | ReactElement<any, string | JSXElementConstructor<any>> | Iterable<ReactNode> | ReactPortal | null | undefined }) => (
                                <Combobox.Option
                                    key={option.value}
                                    className={({active}) =>
                                        `relative cursor-default select-none py-2 pl-4 pr-4 ${
                                            active ? 'bg-main-600 text-white' : 'text-gray-900'
                                        }`
                                    }
                                    value={option}
                                >
                                    {({selected, active}) => (
                                        <>
                                            <span
                                                className={`block truncate ${
                                                    selected ? 'font-medium' : 'font-normal'
                                                }`}
                                            >
                                              {option.label}
                                            </span>
                                        </>
                                    )}
                                </Combobox.Option>
                            ))
                        )}
                    </Combobox.Options>
                </Transition>
            </div>
        </Combobox>
    )
}
