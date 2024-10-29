<!-- SUPPORT CALLOUT -->
<tr>
    <td align="center">
        <!--[if (gte mso 9)|(IE)]>
        <table align="center" border="0" cellspacing="0" cellpadding="0" width="{{config('filament-email-templates.content_width')}}">
            <tr>
                <td align="center" valign="top" width="{{config('filament-email-templates.content_width')}}">
        <![endif]-->
        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: {{config('filament-email-templates.content_width')}}px; margin-bottom: 30px; margin-top: 10px">
            <!-- HEADLINE -->
            <tr>
                <td align="center" bgcolor="#fff"
                    style="padding: 30px 30px 30px 30px; border-radius: 4px 4px 0px 0px; color:{{$data['theme']["callout_color"]}}; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: {{config('filament-email-templates.content_width')}}px;">
                        <tr>
                            <td align="center" bgcolor="#F0F0F0" valign="top" width="{{config('filament-email-templates.content_width')}}" style="padding: 30px 30px 30px 30px">
                                <h2 style="font-size: 34px; font-weight: 400; color: #fc7318; margin-bottom: 20px;">
                                    {{__('mails-need-help')}}
                                </h2>
                                <p style="font-size: 34px; font-weight: 400; color: #000000; margin-bottom: 20px;"><span>
                                        {{__('mails-we-are-here-to-help')}}
                                    </span></p>
                                <p style="margin: 0; color: {{$data['theme']["callout_color"]}}; ">
                                    {{__('mails-contact-us')}}
                                    <a href="mail:{{$data['companyInfo']['email'] ?? ''}}" target="_blank" style="color: #43bc47; font-weight: 600;">
                                       {{$data['companyInfo']['email'] ?? ''}}
                                    </a><br/>
                                    {{__('mails.or-call-hotline')}}<br/>
                                    <a href="tel:{{__('mails-contact-us-hotline')}}" target="_blank" style="color: #2190e3; font-weight: 600;">
                                        {{$data['companyInfo']['phone'] ?? ''}}
                                    </a>
                                </p>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#fff"
                    style="padding: 30px 30px 30px 30px; border-radius: 0px 0px 4px 4px; color:{{$data['theme']["callout_color"]}};
                    font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 15px; font-weight: 400; line-height: 25px;
                    "
                >
                    <p style="margin: 0; word-break: break-word;"><strong>{{$data['companyInfo']['name'] ?? ''}}&nbsp;</strong></p>
                    <p style="margin: 0; word-break: break-word;">{{$data['companyInfo']['address'] ?? ''}}</p>
                    <hr style="background-color: #cccccc; height: 1px; border: none;; color: #cccccc; margin-top: 30px"/>
                </td>
            </tr>
        </table>
        <!--[if (gte mso 9)|(IE)]>
        </td>
        </tr>
        </table>
        <![endif]-->
    </td>
</tr>
