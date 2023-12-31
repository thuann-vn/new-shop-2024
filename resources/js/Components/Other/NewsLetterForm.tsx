import React from "react";
import PrimaryButton from "@/Components/Form/PrimaryButton";
import axios from "axios";

export default function (){
    const [submitting, setSubmitting] = React.useState(false);
    const [email, setEmail] = React.useState('');
    const newsletterFormSubmit = (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        if(!email){
            alert('Please enter your email');
            return;
        }
        setSubmitting(true);
        axios.post(route('newsletter.subscribe'), {
            email: email
        }).then(() => {
            alert('You have been subscribed to our newsletter');
            setSubmitting(false);
            setEmail('');
        }).catch((error) => {
            console.log(error);
            setSubmitting(false);
            alert(error.response.data.message);
        });
    }

    return (
        <form className="mt-4 sm:flex sm:max-w-md lg:mt-0" onSubmit={newsletterFormSubmit}>
            <label htmlFor="email-address" className="sr-only">
                Email address
            </label>
            <input
                type="email"
                name="email"
                id="email-address"
                autoComplete="email"
                required
                className="appearance-none min-w-0 w-full bg-white border border-gray-300 py-2 px-4 text-base rounded-md text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:placeholder-gray-400 sm:max-w-xs"
                placeholder="Enter your email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
            />
            <div className="mt-3 rounded-md sm:mt-0 sm:ml-3 sm:flex-shrink-0">
                <PrimaryButton type="submit" disabled={submitting || !email} loading={submitting} className={"rounded-md"}>
                    Subscribe
                </PrimaryButton>
            </div>
        </form>
    )
}
