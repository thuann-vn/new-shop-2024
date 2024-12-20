@php
/**
 * @var \App\Models\Shop\Order $order
 */
@endphp
@if(
   !empty($order->orderAsGift)
)
    <tr>
        <td align="center">
            <!--[if (gte mso 9)|(IE)]>
        <table align="center" border="0" cellspacing="0" cellpadding="0" width="{{config('filament-email-templates.content_width')}}">
            <tr>
                <td align="center" valign="top" width="{{config('filament-email-templates.content_width')}}">
            <![endif]-->
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: {{config('filament-email-templates.content_width')}}px;" >
                <!-- COPY -->
                <tr>
                    <td bgcolor="#ecffe7" align="left" style="color: {{$data['theme']["body_color"]}}; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 1.8;" >
                        <table align="center" border="0" cellpadding="0" cellspacing="0" class="row-content stack" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #ecffe7; color: #000000; width: 100%; margin: 0 auto;" width="100%">
                            <tbody>
                            <tr>
                                <td class="column column-1" style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-bottom: 9px solid #F5F5F5; padding-bottom: 5px; padding-top: 10px; vertical-align: top; border-top: 0px; border-right: 0px; border-left: 0px;" width="100%">
                                    <table border="0" cellpadding="15" cellspacing="0" class="paragraph_block block-1" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                        <tbody><tr>
                                            <td class="pad">
                                                <div style="color:#101112;direction:ltr;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;letter-spacing:0px;line-height:120%;text-align:left;mso-line-height-alt:19.2px;">
                                                    <p style="margin: 0;"><strong>{{__('GIFT CARD INFORMATION')}}</strong></p>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody></table><!--[if mso]><style>#list-r15c0m1 ul{ margin: 0 !important; padding: 0 !important; } #list-r15c0m1 ul li{ mso-special-format: bullet; }#list-r15c0m1 .levelOne li { margin-top: 0 !important; } #list-r15c0m1 .levelOne { margin-left: -20px !important; }#list-r15c0m1 .levelTwo li { margin-top: 0 !important; } #list-r15c0m1 .levelTwo { margin-left: 10px !important; }#list-r15c0m1 .levelThree li { margin-top: 0 !important; } #list-r15c0m1 .levelThree { margin-left: 40px !important; }#list-r15c0m1 .levelFour li { margin-top: 0 !important; } #list-r15c0m1 .levelFour { margin-left: 70px !important; }#list-r15c0m1 .levelFive li { margin-top: 0 !important; } #list-r15c0m1 .levelFive { margin-left: 100px !important; }#list-r15c0m1 .levelSix li { margin-top: 0 !important; } #list-r15c0m1 .levelSix { margin-left: 130px !important; }#list-r15c0m1 .levelSeven li { margin-top: 0 !important; } #list-r15c0m1 .levelSeven { margin-left: 160px !important; }#list-r15c0m1 .levelEight li { margin-top: 0 !important; } #list-r15c0m1 .levelEight { margin-left: 190px !important; }#list-r15c0m1 .levelNine li { margin-top: 0 !important; } #list-r15c0m1 .levelNine { margin-left: 220px !important; }#list-r15c0m1 .levelTen li { margin-top: 0 !important; } #list-r15c0m1 .levelTen { margin-left: 250px !important; }</style><![endif]-->
                                    <table border="0" cellpadding="15" cellspacing="0" class="list_block block-2" id="list-r15c0m1" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                        <tbody><tr>
                                            <td class="pad">
                                                <div class="levelOne" style="margin-left: 0;">
                                                    <ul class="leftList" start="1" style="margin-top: 0; margin-bottom: 0; padding: 0; padding-left: 20px; font-weight: 400; text-align: left; color: #101112; direction: ltr; font-family: Arial,'Helvetica Neue',Helvetica,sans-serif; font-size: 16px; letter-spacing: 0; line-height: 120%; mso-line-height-alt: 19.2px; list-style-type: disc;">
                                                        <li style="margin-bottom: 0; text-align: left;">{{__('Receiver')}}: {{$order->orderAsGift->receiver_first_name}} {{$order->orderAsGift->receiver_last_name}}</li>
                                                        <li style="margin-bottom: 0; text-align: left;">{{__('Email')}}: {{$order->orderAsGift->receiver_email}}</li>
                                                        <li style="margin-bottom: 0; text-align: left;">{{__('Phone number')}}: {{$order->orderAsGift->receiver_phone}}</li>
                                                        <li style="margin-bottom: 0; text-align: left;">{{__('Message to receiver')}}: {{$order->orderAsGift->message}}</li>
                                                        <li style="margin-bottom: 0; text-align: left;">{{__("Template")}}: {{__($order->orderAsGift->template)}}</li>
                                                        <li style="margin-bottom: 0; text-align: left;">{{__("Sending method")}}: {{$order->orderAsGift->isSendingViaPostal() ? __('Postal') : __('Email')}}</li>
                                                        @if($order->orderAsGift->isSendingViaPostal())
                                                        <li style="margin-bottom: 0; text-align: left;">{{__('Address')}}: {{$order->orderAsGift->receiver_address_line_1}}</li>
                                                        <li style="margin-bottom: 0; text-align: left;">{{__('City')}}: {{$order->orderAsGift->receiver_city}}</li>
                                                        <li style="margin-bottom: 0; text-align: left;">{{__('State/Province')}}: {{$order->orderAsGift->receiver_state}}</li>
                                                        <li style="margin-bottom: 0; text-align: left;">{{__('Postal code')}}: {{$order->orderAsGift->receiver_postal_code}}</li>
                                                        @endif
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody></table>
                                </td>
                            </tr>
                            </tbody>
                        </table>
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
@endif
