import {CardsBlock, ContactFormBlock, TextBlock} from "@/types/blocks";
import InputLabel from "@/Components/Form/InputLabel";
import TextInput from "@/Components/Form/TextInput";
import InputError from "@/Components/Form/InputError";
import {useForm, usePage} from "@inertiajs/react";
import TextArea from "@/Components/Form/TextArea";
import PrimaryButton from "@/Components/Form/PrimaryButton";
import {FormEventHandler} from "react";

export default function ContactForm({block}: { block: ContactFormBlock }) {
    const {status} = usePage().props;
    const {data, setData, post, processing, errors, reset} = useForm({
        name: '',
        email: '',
        phone: '',
        subject: '',
        message: '',
    });
    const submit: FormEventHandler = (e) => {
        e.preventDefault();

        post(route('contact.submit'));
    };

    return (
        <div className={"py-6"}>
            <h2 className="mb-4 text-4xl tracking-tight font-extrabold text-center text-gray-900">
                {block.title}
            </h2>
            <div className={"mb-8"} dangerouslySetInnerHTML={{__html: block.content}}></div>

            {status && <div className="mb-4 font-medium text-sm text-green-600">{status}</div>}
            <form onSubmit={submit} className="space-y-8">
                <div>
                    <InputLabel htmlFor="email" value="Your name"/>
                    <TextInput
                        id="name"
                        type="text"
                        name="name"
                        value={data.name}
                        className="mt-1 block w-full"
                        onChange={(e) => setData('name', e.target.value)}
                    />

                    <InputError message={errors.name} className="mt-2"/>
                </div>
                <div>
                    <InputLabel htmlFor="email" value="Your email"/>
                    <TextInput
                        id="email"
                        type="email"
                        name="email"
                        value={data.email}
                        className="mt-1 block w-full"
                        onChange={(e) => setData('email', e.target.value)}
                    />

                    <InputError message={errors.email} className="mt-2"/>
                </div>
                <div>
                    <InputLabel htmlFor="phone" value="Your phone number"/>
                    <TextInput
                        id="phone"
                        type="tel"
                        name="phone"
                        value={data.phone}
                        className="mt-1 block w-full"
                        onChange={(e) => setData('phone', e.target.value)}
                    />

                    <InputError message={errors.phone} className="mt-2"/>
                </div>

                <div>
                    <InputLabel htmlFor="subject" value="Subject"/>
                    <TextInput
                        id="subject"
                        type="text"
                        name="subject"
                        value={data.subject}
                        className="mt-1 block w-full"
                        onChange={(e) => setData('subject', e.target.value)}
                    />

                    <InputError message={errors.subject} className="mt-2"/>
                </div>

                <div>
                    <InputLabel htmlFor="message" value="Your message"/>
                    <TextArea
                        id="message"
                        name="message"
                        value={data.message}
                        className="mt-1 block w-full"
                        onChange={(e) => setData('message', e.target.value)}
                    ></TextArea>

                    <InputError message={errors.message} className="mt-2"/>
                </div>
                <PrimaryButton disabled={processing}>
                    Send message
                </PrimaryButton>
            </form>
        </div>

    )
}
