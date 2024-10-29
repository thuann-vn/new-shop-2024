<!-- HERO -->
<tr>
    <td align="center" style="padding: 0px 10px 0px 10px;color: {{$data['theme']["body_color"]}};">

        <!--[if (gte mso 9)|(IE)]>
        <table align="center" border="0" cellspacing="0" cellpadding="0" width="{{config('filament-email-templates.content_width')}}">
            <tr>
                <td align="center" valign="top" width="{{config('filament-email-templates.content_width')}}">
        <![endif]-->
        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: {{config('filament-email-templates.content_width')}}px;">
            <tr>
                <td bgcolor="{{$data['theme']["content_bg_color"]}}" style="padding: 20px 20px 20px 20px; border-radius: 4px 4px 0px 0px; color: {{config('filament-email-templates
                .body_color')}}; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; letter-spacing: 4px; line-height: 48px;">
                    <a href="{{\Illuminate\Support\Facades\URL::to('/')}}" target="_blank" title="{{config('app.name')}}">
                        <img alt="{{config('app.name')}} Logo"
                             src="{{asset(config('filament-email-templates.logo'))}}"
                             width="{{config('filament-email-templates.logo_width')}}"
                             height="{{config('filament-email-templates.logo_height')}}"
                             style="display: block; width: {{config('filament-email-templates.logo_width')}}px; max-width: {{config('filament-email-templates.logo_width')}}px; min-width: {{config
                                     ('email-templates.logo_width')}}px;" border="0">
                    </a>
                </td>
                <td bgcolor="{{$data['theme']["content_bg_color"]}}" style="padding: 20px 20px 20px 20px; text-align: right">
                    <img alt="Love image"
                         src="{{$image}}"
                         width="255"
                         height="77"
                         style="display: inline-block; width: 255px; max-width: 255px; min-width: 255px;" border="0">
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
