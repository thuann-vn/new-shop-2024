import * as React from "react";
import Select from "@/Components/Form/Select";
import axios from "axios";
import {useEffect} from "react";
import InputLabel from "@/Components/Form/InputLabel";
import TextInput from "@/Components/Form/TextInput";
import {useTranslation} from "react-i18next";

export default function CheckoutForm({formData, setFormData}: { formData:object, setFormData: any }) {
    const [provinces, setProvinces] = React.useState([])
    const [selectedProvince, setSelectedProvince] = React.useState<string|null>(null)

    const [districts, setDistricts] = React.useState([])
    const [selectedDistrict, setSelectedDistrict] = React.useState<string|null>(null)

    const [wards, setWards] = React.useState([])
    const [selectedWard, setSelectedWard] = React.useState<string|null>(null)
    const {t} = useTranslation();

    useEffect(() => {
        loadProvinces()
    }, []);

    // Load provinces
    const loadProvinces = () => {
        axios.get(route('checkout.get-provinces'))
            .then(response => {
                console.log(response)
                setProvinces(response.data.data.map((province: { code: any; full_name: any; }) => {
                    return {
                        value: province.code,
                        label: province.full_name
                    }
                }))
            })
    }

    //Load districts
    const loadDistricts = (provinceCode: string) => {
        setSelectedDistrict(null)
        setSelectedWard(null)

        setFormData({
            ...formData,
            province_code: provinceCode,
            district_code: '',
            ward_code: ''
        })
        axios.get(route('checkout.get-districts', {province_id: provinceCode}))
            .then(response => {
                setDistricts(response.data.data.map((district: { code: any; full_name: any; }) => {
                    return {
                        value: district.code,
                        label: district.full_name
                    }
                }))
            })
    }

    //Load wards
    const loadWards = (districtCode: string) => {
        setSelectedWard(null)

        setFormData({
            ...formData,
            district_code: districtCode,
            ward_code: ''
        })
        axios.get(route('checkout.get-wards', {district_id: districtCode}))
            .then(response => {
                setWards(response.data.data.map((ward: { code: any; full_name: any; }) => {
                    return {
                        value: ward.code,
                        label: ward.full_name
                    }
                }))
            })
    }

    const _setFormData = (key: string, value: any) => {
        setFormData({
            ...formData,
            [key]: value
        })
    }

    return (
        <div>
            <p className="text-xl font-medium">{t('Payment Details')}</p>
            <p className="text-gray-400">{t('Complete your order by providing your details.')}</p>
            <div className="">
                <InputLabel htmlFor="full_name" value={t("Your name")} />
                <TextInput
                    id="full_name"
                    name="full_name"
                    onChange={(e)=> _setFormData('full_name', e.target.value)}
                    placeholder={t("Nguyen Van A")}
                    required={true}
                    className="capitalize"
                    left={()=>( <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2">
                        <path strokeLinecap="round" strokeLinejoin="round" d="M15 9h3.75M15 12h3.75M15 15h3.75M4.5 19.5h15a2.25 2.25 0 002.25-2.25V6.75A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25v10.5A2.25 2.25 0 004.5 19.5zm6-10.125a1.875 1.875 0 11-3.75 0 1.875 1.875 0 013.75 0zm1.294 6.336a6.721 6.721 0 01-3.17.789 6.721 6.721 0 01-3.168-.789 3.376 3.376 0 016.338 0z" />
                    </svg>)}
                />

                <InputLabel htmlFor="phone" value={t("Phone number")} />
                <TextInput
                    id="phone"
                    name="phone"
                    onChange={(e)=> _setFormData('phone', e.target.value)}
                    placeholder="0901234567"
                    type="tel"
                    required={true}
                    left={()=>(<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="1.5" stroke="currentColor" className="h-4 w-4 text-gray-400">
                        <path strokeLinecap="round" strokeLinejoin="round" d="M10.5 1.5H8.25A2.25 2.25 0 0 0 6 3.75v16.5a2.25 2.25 0 0 0 2.25 2.25h7.5A2.25 2.25 0 0 0 18 20.25V3.75a2.25 2.25 0 0 0-2.25-2.25H13.5m-3 0V3h3V1.5m-3 0h3m-3 18.75h3" />
                    </svg>)}
                />


                <InputLabel htmlFor="email" value={t("Email")} />
                <TextInput
                    id="email"
                    name="email"
                    onChange={(e)=> _setFormData('email', e.target.value)}
                    placeholder={t("your.email@gmail.com")}
                    type="email"
                    required={true}
                    left={()=>(<svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2">
                        <path strokeLinecap="round" strokeLinejoin="round" d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207" />
                    </svg>)}
                />

                <label htmlFor="address" className="mt-4 mb-2 block text-sm font-medium">
                    {t('Shipping Address')}
                </label>
                <div className="flex flex-col sm:flex-row">
                    <TextInput
                        id="address"
                        name="address"
                        onChange={(e)=> _setFormData('address', e.target.value)}
                        placeholder={t("Street address")}
                        containerClassName="w-full me-2"
                        required={true}
                        left={()=>(<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="h-4 w-4 text-gray-400">
                            <path strokeLinecap="round" strokeLinejoin="round" d="m2.25 12 8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25" />
                        </svg>)}
                    />
                    <Select value={selectedProvince}
                            onChange={(value: string) => {
                                setSelectedProvince(value)
                                loadDistricts(value)
                            }}
                            options={provinces}
                            className={'w-full'}
                            placeholder={t('Select province')}
                            required={true}
                            name={"province_code"}
                    />

                </div>
                <div className="flex flex-col sm:flex-row mt-4 ">
                    <Select value={selectedDistrict}
                            onChange={(value: string) => {
                                setSelectedDistrict(value)
                                loadWards(value)
                            }}
                            options={districts}
                            className={'w-full me-2'}
                            placeholder={t('Select district')}
                            required={true}
                            name={"district_code"}
                    />

                    <Select value={selectedWard}
                            onChange={(value: React.SetStateAction<string | null>)=>{
                                setSelectedWard(value)
                                _setFormData('ward_code', value)
                            }}
                            options={wards}
                            className={'w-full'}
                            placeholder={t('Select ward')}
                            required={true}
                            name={"ward_code"}
                    />
                </div>
            </div>
        </div>
    )
}
