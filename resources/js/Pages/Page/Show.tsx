import {PageProps} from '@/types';
import Authenticated from "@/Layouts/MasterLayout";
import AppHead from "@/Components/Layout/AppHead";

export default function PageSingle({ pageTitle, content}: PageProps<{ pageTitle: string, content: string }>) {
    return (
        <Authenticated>
            <AppHead title= {pageTitle}/>
            <div dangerouslySetInnerHTML={{__html: content}} className={"page-content"}/>
        </Authenticated>
    );
}
