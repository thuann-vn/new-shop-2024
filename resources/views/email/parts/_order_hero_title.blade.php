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
                <td bgcolor="{{$data['theme']["content_bg_color"]}}" style="padding: 20px 20px 20px 20px; ">
                    <a href="{{\Illuminate\Support\Facades\URL::to('/')}}" target="_blank" title="{{config('app.name')}}">
                        <img alt="{{config('app.name')}}"
                             src="{{asset(config('filament-email-templates.logo'))}}"
                             width="{{config('filament-email-templates.logo_width')}}"
                             height="{{config('filament-email-templates.logo_height')}}"
                             style="display: block; width: {{config('filament-email-templates.logo_width')}}px; max-width: {{config('filament-email-templates.logo_width')}}px; min-width: {{config
                                     ('email-templates.logo_width')}}px;" border="0">
                    </a>
                </td>
                <td bgcolor="{{$data['theme']["content_bg_color"]}}" style="padding: 20px 20px 20px 20px; text-align: right">
                    @switch($data['order']['status'])
                        @case(\App\Enums\OrderStatus::PaymentPending)
                            <div style="text-decoration:none;display:inline-block;color:#ffffff;background-color:#ff9f0f;border-radius:14px;width:auto;border-top:0px solid transparent;font-weight:undefined;border-right:0px solid transparent;border-bottom:0px solid transparent;border-left:0px solid transparent;padding-top:3px;padding-bottom:3px;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:14px;text-align:center;mso-border-alt:none;word-break:keep-all;"><span style="padding-left:15px;padding-right:15px;font-size:14px;display:inline-block;letter-spacing:normal;"><span style="word-break:break-word;"><span data-mce-style="" style="line-height: 28px;">{{__('Pending payment order')}}</span></span></span></div>
                            @break
                        @case(\App\Enums\OrderStatus::PreOrderPaid)
                        @case(\App\Enums\OrderStatus::Paid)
                            <div style="text-decoration:none;display:inline-block;color:#ffffff;background-color:#389126;border-radius:14px;width:auto;border-top:0px solid transparent;font-weight:undefined;border-right:0px solid transparent;border-bottom:0px solid transparent;border-left:0px solid transparent;padding-top:3px;padding-bottom:3px;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:14px;text-align:center;mso-border-alt:none;word-break:keep-all;"><span style="padding-left:15px;padding-right:15px;font-size:14px;display:inline-block;letter-spacing:normal;"><span style="word-break:break-word;"><span data-mce-style="" style="line-height: 28px;">{{__('Paid order')}}</span></span></span></div>
                        @break
                        @case(\App\Enums\OrderStatus::Refunded)
                            <div style="text-decoration:none;display:inline-block;color:#ffffff;background-color:#cda00c;border-radius:14px;width:auto;border-top:0px solid transparent;font-weight:undefined;border-right:0px solid transparent;border-bottom:0px solid transparent;border-left:0px solid transparent;padding-top:3px;padding-bottom:3px;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:14px;text-align:center;mso-border-alt:none;word-break:keep-all;"><span style="padding-left:15px;padding-right:15px;font-size:14px;display:inline-block;letter-spacing:normal;"><span style="word-break:break-word;"><span data-mce-style="" style="line-height: 28px;">{{__('Refunded')}}</span></span></span></div>
                        @break
                        @case(\App\Enums\OrderStatus::PaymentFailed)
                            <div style="text-decoration:none;display:inline-block;color:#ffffff;background-color:#bd2a2a;border-radius:14px;width:auto;border-top:0px solid transparent;font-weight:undefined;border-right:0px solid transparent;border-bottom:0px solid transparent;border-left:0px solid transparent;padding-top:3px;padding-bottom:3px;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:14px;text-align:center;mso-border-alt:none;word-break:keep-all;"><span style="padding-left:15px;padding-right:15px;font-size:14px;display:inline-block;letter-spacing:normal;"><span style="word-break:break-word;"><span data-mce-style="" style="line-height: 28px;">{{__('Payment failed')}}</span></span></span></div>
                        @break
                        @case(\App\Enums\OrderStatus::Completed)
                            <div style="text-decoration:none;display:inline-block;color:#ffffff;background-color:#389126;border-radius:14px;width:auto;border-top:0px solid transparent;font-weight:undefined;border-right:0px solid transparent;border-bottom:0px solid transparent;border-left:0px solid transparent;padding-top:3px;padding-bottom:3px;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:14px;text-align:center;mso-border-alt:none;word-break:keep-all;"><span style="padding-left:15px;padding-right:15px;font-size:14px;display:inline-block;letter-spacing:normal;"><span style="word-break:break-word;"><span data-mce-style="" style="line-height: 28px;">{{__("Completed order")}}</span></span></span></div>
                            @break
                    @endswitch
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
