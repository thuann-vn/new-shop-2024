import { useEffect, FormEventHandler } from 'react';
import InputError from '@/Components/Form/InputError';
import InputLabel from '@/Components/Form/InputLabel';
import PrimaryButton from '@/Components/Form/PrimaryButton';
import TextInput from '@/Components/Form/TextInput';
import { Head, useForm } from '@inertiajs/react';

export default function ConfirmPassword() {
    const { data, setData, post, processing, errors, reset } = useForm({
        password: '',
    });

    useEffect(() => {
        return () => {
            reset('password');
        };
    }, []);

    const submit: FormEventHandler = (e) => {
        e.preventDefault();

        post(route('password.confirm'));
    };

    return (
        <>
            <Head title="Confirm Password" />

            <div className="flex min-h-[500px] items-center justify-center px-4 py-6 sm:px-6 lg:px-8">
                <div className="w-full sm:max-w-md mt-6 px-6 py-4 bg-white shadow-md overflow-hidden sm:rounded-lg">
                    <div className="mb-4 text-sm text-gray-600">
                        This is a secure area of the application. Please confirm your password before continuing.
                    </div>

                    <form onSubmit={submit}>
                        <div className="mt-4">
                            <InputLabel htmlFor="password" value="Password" />

                            <TextInput
                                id="password"
                                type="password"
                                name="password"
                                value={data.password}
                                className="mt-1 block w-full"
                                isFocused={true}
                                onChange={(e) => setData('password', e.target.value)}
                            />

                            <InputError message={errors.password} className="mt-2" />
                        </div>

                        <div className="flex items-center justify-end mt-4">
                            <PrimaryButton className="ms-4" disabled={processing}>
                                Confirm
                            </PrimaryButton>
                        </div>
                    </form>
                </div>
            </div>
        </>
    );
}
