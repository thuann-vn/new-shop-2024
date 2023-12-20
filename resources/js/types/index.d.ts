export interface User {
    id: number;
    name: string;
    email: string;
    email_verified_at: string;
}

export type PageProps<T extends Record<string, unknown> = Record<string, unknown>> = T & {
    auth: {
        user: User;
    };

    general_settings: GeneralSettings;
};

export interface GeneralSettings {
    site_name: string;
    site_description: string;
    site_logo: string;
    site_favicon: string;
    site_email: string;
    site_phone: string;
    site_address: string;
    site_facebook: string;
    site_instagram: string;
    site_twitter: string;
    site_linkedin: string;
    site_youtube: string;
}
