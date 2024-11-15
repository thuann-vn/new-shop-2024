import Layout from '@/Layouts/Layout';
import DeleteUserForm from './Partials/DeleteUserForm';
import UpdatePasswordForm from './Partials/UpdatePasswordForm';
import UpdateProfileInformationForm from './Partials/UpdateProfileInformationForm';
import { PageProps } from '@/types';
import AccountNav from "@/Components/Account/AccountNav";
import AppHead from "@/Components/Layout/AppHead";
import {useTranslation} from "react-i18next";

export default function Edit({ auth, mustVerifyEmail, status }: PageProps<{ mustVerifyEmail: boolean, status?: string }>) {
    const {t} = useTranslation();
    return (
        <>
            <AppHead title={t('Profile')} />
            <div className="py-12">
                <div className="container mx-auto sm:px-6 lg:px-8 space-y-6">
                    <AccountNav activeTab={'profile'}/>

                    <div className="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
                        <UpdateProfileInformationForm
                            mustVerifyEmail={mustVerifyEmail}
                            status={status}
                            className="max-w-xl"
                        />
                    </div>

                    <div className="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
                        <UpdatePasswordForm className="max-w-xl" />
                    </div>
                </div>
            </div>
        </>
    );
}
