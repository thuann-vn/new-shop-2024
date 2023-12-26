export default function Alert({title, message}: {title: string, message: string | string[]}){
    return (
        <div className="flex p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-50" role="alert">
            <svg className="flex-shrink-0 inline w-4 h-4 me-3 mt-[2px]" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/>
            </svg>
            <span className="sr-only">Danger</span>
            <div>
                <span className="font-medium">{title}</span>
                {
                    typeof message === 'string' ? (
                        <p className="mt-1">{message}</p>
                    ) : (
                        <ul className="mt-1.5 list-disc list-inside">
                            {
                                message.map((msg, index) => (
                                    <li key={index}>{msg}</li>
                                ))
                            }
                        </ul>
                    )
                }
            </div>
        </div>
    );
}
