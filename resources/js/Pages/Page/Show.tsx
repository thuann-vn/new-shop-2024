import {PageProps} from '@/types';
import AppHead from "@/Components/Layout/AppHead";

export default function PageSingle({ pageTitle, content}: PageProps<{ pageTitle: string, content: string }>) {
    return (
        <>
            <AppHead title= {pageTitle}/>
            <div dangerouslySetInnerHTML={{__html: content}} className={"page-content"}/>
        </>
    );
}
