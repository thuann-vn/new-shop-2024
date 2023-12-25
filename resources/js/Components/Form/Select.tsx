import {Fragment, useState} from 'react'
import {Combobox, Transition} from '@headlessui/react'
import {CheckIcon, ChevronUpDownIcon} from '@heroicons/react/20/solid'

const people = [
    {id: 1, name: 'Wade Cooper'},
    {id: 2, name: 'Arlene Mccoy'},
    {id: 3, name: 'Devon Webb'},
    {id: 4, name: 'Tom Cook'},
    {id: 5, name: 'Tanya Fox'},
    {id: 6, name: 'Hellen Schmidt'},
]

export default function Select({className = '', options, value, onChange, placeholder = ''}) {
    const [selected, setSelected] = useState(options.find((option) => option.value === value) ?? null)
    const [query, setQuery] = useState('')

    const filteredOptions =
        query === ''
            ? options
            : options.filter((option) =>
                option.label
                    .toLowerCase()
                    .replace(/\s+/g, '')
                    .includes(query.toLowerCase().replace(/\s+/g, ''))
            )

    return (
        <Combobox value={selected}
                  onChange={setSelected}
                  className={className}
        >
            <div className="relative">
                <div
                    className="relative rounded-md border border-gray-200 py-1 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500">
                    <Combobox.Input
                        className="w-full border-none py-2 pl-3 pr-10 text-sm leading-5 text-gray-900 focus:ring-0"
                        displayValue={(selected) => selected?.label}
                        onChange={(event) => setQuery(event.target.value)}
                        placeholder={placeholder}
                        onFocus={(event) => {
                            //Select all text on focus
                            event.target.select()
                        }}
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
                        className="absolute mt-1 max-h-60 w-full overflow-auto rounded-md bg-white py-1 text-base shadow-lg ring-1 ring-black/5 focus:outline-none sm:text-sm">
                        {filteredOptions.length === 0 && query !== '' ? (
                            <div className="relative cursor-default select-none py-2 text-gray-700">
                                Nothing found.
                            </div>
                        ) : (
                            filteredOptions.map((option) => (
                                <Combobox.Option
                                    key={option.value}
                                    className={({active}) =>
                                        `relative cursor-default select-none py-2 pl-10 pr-4 ${
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
                                            {selected ? (
                                                <span
                                                    className={`absolute inset-y-0 left-0 flex items-center pl-3 ${
                                                        active ? 'text-white' : 'text-teal-600'
                                                    }`}
                                                >
                                                <CheckIcon className="h-5 w-5" aria-hidden="true"/>
                                              </span>
                                            ) : null}
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
