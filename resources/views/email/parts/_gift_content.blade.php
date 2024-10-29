<!-- COPY BLOCK -->
<tr>
    <td align="center" style="padding: 0px 10px 0px 10px; ">
        <!--[if (gte mso 9)|(IE)]>
        <table align="center" border="0" cellspacing="0" cellpadding="0" width="{{config('filament-email-templates.content_width')}}">
            <tr>
                <td align="center" valign="top" width="{{config('filament-email-templates.content_width')}}">
        <![endif]-->
        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: {{config('filament-email-templates.content_width')}}px;" >
            <!-- COPY -->
            <tr>
                <td bgcolor="#ecffe7" align="left" style="padding: 20px 30px 20px 30px; color: {{$data['theme']["body_color"]}}; font-family: 'Lato',
                Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 1.8;" >
                    {{__('Dear')}} <b>{{$data['receiverName'] ?? ''}}</b>,
                </td>
            </tr>
            <tr>
                <td bgcolor="#ecffe7" align="left" style="padding: 20px 30px 20px 30px; color: {{$data['theme']["body_color"]}}; font-family: 'Lato',
                Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 1.8;" >
                    {{$data['giftMessage'] ?? ''}}
                </td>
            </tr>
            <tr>
                <td bgcolor="#fff" align="left" style="padding: 20px 30px 40px 30px; color: {{$data['theme']["body_color"]}}; font-family: 'Lato',
                Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 1.8;" >
                    {!! $data['content']??'' !!}
                </td>
            </tr>
            <tr>
                <td bgcolor="#ecffe7" align="left" style="padding: 20px 30px 40px 30px; color: {{$data['theme']["body_color"]}}; font-family: 'Lato',
                Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 1.8;" >
                    {!! __('mails-gift-description') !!}
                </td>
            </tr>
            <tr>
                <td bgcolor="#ecffe7" align="left" >
                    <img src="{{$image}}" style="width: 100%;">
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
