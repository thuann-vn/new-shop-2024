export default function CounterInput({value, onValueChange} : {value: number, onValueChange: any}) : JSX.Element{
    const _onPlusClick = (e: { preventDefault: () => void; }) => {
        e.preventDefault();
        onValueChange(value + 1);
    }

    const _onMinusClick = (e: { preventDefault: () => void; }) => {
        e.preventDefault();
        if(value > 1){
            onValueChange(value - 1);
        }
    }
    return (
        <div className="flex items-center relative">
            <button onClick={_onMinusClick} className="w-[44px] h-[44px] bg-gray-100 hover:bg-secondary-400 flex items-center justify-center rounded-full">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6">
                    <path strokeLinecap="round" strokeLinejoin="round" d="M5 12h14" />
                </svg>
            </button>
            <input type={"tel"} className="border-0 w-[50px] text-center" value={value} onChange={(e)=> onValueChange(e.target.value)}/>
            <button onClick={_onPlusClick} className="w-[44px] h-[44px]  bg-gray-100 hover:bg-secondary-400 flex items-center justify-center rounded-full">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6">
                    <path strokeLinecap="round" strokeLinejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                </svg>
            </button>
        </div>
    )
}
