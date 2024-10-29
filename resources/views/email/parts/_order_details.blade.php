@php
    /**
     * @var \App\Models\Shop\Order $order
     */
@endphp
<tr>
    <td align="center">
        <!--[if (gte mso 9)|(IE)]>
        <table align="center" border="0" cellspacing="0" cellpadding="0" width="{{config('filament-email-templates.content_width')}}">
            <tr>
                <td align="center" valign="top" width="{{config('filament-email-templates.content_width')}}">
        <![endif]-->
        <table border="0" cellpadding="0" cellspacing="0" width="100%"
               style="max-width: {{config('filament-email-templates.content_width')}}px;">
            <!-- COPY -->
            <tr>
                <td bgcolor="#fff" align="left" style="color: {{$data['theme']["body_color"] ?? '#fff'}}; font-family: 'Lato',
                Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 1.8;">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td align="center">
                            <td>
                                <table align="center" border="0" cellpadding="0" cellspacing="0" role="presentation"
                                       style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
                                    <tbody>
                                    <tr>
                                        <td>
                                            <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                   class="row-content stack" role="presentation"
                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF; color: #000000; margin: 0 auto;width: 100%">
                                                <tbody>
                                                <tr>
                                                    <td class="column column-1"
                                                        style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 5px; padding-top: 15px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                        width="100%">
                                                        <table border="0" cellpadding="10" cellspacing="0"
                                                               class="paragraph_block block-1" role="presentation"
                                                               style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                               width="100%">
                                                            <tbody>
                                                            <tr>
                                                                <td class="pad">
                                                                    <div
                                                                        style="color:#052d3d;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:20px;line-height:120%;text-align:center;mso-line-height-alt:24px;">
                                                                        <p style="margin: 0; word-break: break-word;">
                                                                            <span>{{__('Order items:')}}</span></p>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-6"
                                       role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
                                       width="100%">
                                    <tbody>
                                    <tr>
                                        <td>
                                            <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                   class="row-content" role="presentation"
                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #e1dfdf; color: #333; width: 100%; margin: 0 auto;"
                                                   width="100%">
                                                <tbody>
                                                <tr>
                                                    <td class="column column-1"
                                                        style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 5px; padding-left: 10px; padding-right: 10px; padding-top: 15px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                        width="33.333333333333336%">
                                                        <table border="0" cellpadding="10" cellspacing="0"
                                                               class="paragraph_block block-1" role="presentation"
                                                               style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                               width="100%">
                                                            <tbody>
                                                            <tr>
                                                                <td class="pad">
                                                                    <div
                                                                        style="color:#101112;direction:ltr;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;letter-spacing:0px;line-height:120%;text-align:center;mso-line-height-alt:19.2px;">
                                                                        <p style="margin: 0;">{{__('Name')}}</p>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                    <td class="column column-2"
                                                        style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-right: 1px dotted #E8E8E8; padding-bottom: 5px; padding-left: 15px; padding-right: 10px; padding-top: 15px; vertical-align: top; border-top: 0px; border-bottom: 0px; border-left: 0px;"
                                                        width="16.666666666666668%">
                                                        <table border="0" cellpadding="10" cellspacing="0"
                                                               class="paragraph_block block-1" role="presentation"
                                                               style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                               width="100%">
                                                            <tbody>
                                                            <tr>
                                                                <td class="pad">
                                                                    <div
                                                                        style="color:#101112;direction:ltr;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;letter-spacing:0px;line-height:120%;text-align:center;mso-line-height-alt:19.2px;">
                                                                        <p style="margin: 0;">{{__('Qty')}}</p>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                    <td class="column column-3"
                                                        style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-right: 1px dotted #E8E8E8; padding-bottom: 5px; padding-left: 15px; padding-right: 15px; padding-top: 15px; vertical-align: top; border-top: 0px; border-bottom: 0px; border-left: 0px;"
                                                        width="25%">
                                                        <table border="0" cellpadding="10" cellspacing="0"
                                                               class="paragraph_block block-1" role="presentation"
                                                               style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                               width="100%">
                                                            <tbody>
                                                            <tr>
                                                                <td class="pad">
                                                                    <div
                                                                        style="color:#101112;direction:ltr;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;letter-spacing:0px;line-height:120%;text-align:center;mso-line-height-alt:19.2px;">
                                                                        <p style="margin: 0;">{{__('Price')}}</p>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                    <td class="column column-4"
                                                        style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 5px; padding-top: 15px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                        width="25%">
                                                        <table border="0" cellpadding="10" cellspacing="0"
                                                               class="paragraph_block block-1" role="presentation"
                                                               style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                               width="100%">
                                                            <tbody>
                                                            <tr>
                                                                <td class="pad">
                                                                    <div
                                                                        style="color:#101112;direction:ltr;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;letter-spacing:0px;line-height:120%;text-align:center;mso-line-height-alt:19.2px;">
                                                                        <p style="margin: 0;">{{__('Total')}}</p>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                @foreach($order->items as $item)
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-7"
                                           role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
                                           width="100%">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                       class="row-content" role="presentation"
                                                       style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF; border-bottom: 1px solid #f5f5f5; border-left: 1px solid transparent; border-right: 1px solid transparent; border-top: 1px solid transparent; color: #333; width: 100%; margin: 0 auto;"
                                                       width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td class="column column-1"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 5px; padding-left: 10px; padding-right: 10px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="33.333333333333336%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad"
                                                                        style="padding-bottom:5px;padding-right:10px;padding-top:10px;">
                                                                        <div
                                                                            style="color:#555555;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;line-height:120%;text-align:left;mso-line-height-alt:19.2px;">
                                                                            <p style="margin: 0; word-break: break-word;">
                                                                                <span
                                                                                    style="color: #247f16;"><strong>{{$item->product->name}}</strong></span>
                                                                            </p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                            @if($item->is_pre_order)
                                                                <table border="0" cellpadding="0" cellspacing="0"
                                                                       class="paragraph_block block-2"
                                                                       role="presentation"
                                                                       style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                       width="100%">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td class="pad"
                                                                            style="padding-bottom:10px;padding-right:10px;">
                                                                            <div
                                                                                style="color:#555555;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:14px;font-weight:400;line-height:120%;text-align:left;mso-line-height-alt:16.8px;">
                                                                                <p style="margin: 0; word-break: break-word;">
                                                                                    <span
                                                                                        style="color: #ffa913;">{{__('Pre-order pay')}}</span>
                                                                                </p>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            @endif
                                                        </td>
                                                        <td class="column column-2"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-right: 1px dotted #E8E8E8; padding-bottom: 35px; padding-top: 30px; vertical-align: top; border-top: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="16.666666666666668%">
                                                            <table border="0" cellpadding="10" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad">
                                                                        <div
                                                                            style="color:#101112;direction:ltr;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;letter-spacing:0px;line-height:120%;text-align:center;mso-line-height-alt:19.2px;">
                                                                            <p style="margin: 0;">{{$item->qty}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        <td class="column column-3"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-right: 1px dotted #E8E8E8; padding-bottom: 35px; padding-top: 30px; vertical-align: top; border-top: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="25%">
                                                            <table border="0" cellpadding="10" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad">
                                                                        <div
                                                                            style="color:#101112;direction:ltr;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;letter-spacing:0px;line-height:120%;text-align:center;mso-line-height-alt:19.2px;">
                                                                            <p style="margin: 0;">{{currencyFormat($item->unit_price, $order->country)}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        <td class="column column-4"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 35px; padding-top: 30px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="25%">
                                                            <table border="0" cellpadding="10" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad">
                                                                        <div
                                                                            style="color:#101112;direction:ltr;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;letter-spacing:0px;line-height:120%;text-align:center;mso-line-height-alt:19.2px;">
                                                                            <p style="margin: 0;">{{currencyFormat($item->unit_price * $item->qty, $order->country)}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                @endforeach
                                <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-9"
                                       role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
                                       width="100%">
                                    <tbody>
                                    <tr>
                                        <td>
                                            <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                   class="row-content stack" role="presentation"
                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF; color: #000000; width: 100%; margin: 0 auto;"
                                                   width="100%">
                                                <tbody>
                                                <tr>
                                                    <td class="column column-1"
                                                        style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 5px; padding-top: 15px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                        width="100%">
                                                        <div class="spacer_block block-1"
                                                             style="height:20px;line-height:20px;font-size:1px;"> 
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-10"
                                       role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
                                       width="100%">
                                    <tbody>
                                    <tr>
                                        <td>
                                            <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                   class="row-content" role="presentation"
                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF; color: #333; width: 100%; margin: 0 auto;"
                                                   width="100%">
                                                <tbody>
                                                <tr>
                                                    <td class="column column-1"
                                                        style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-right: 1px dotted #E8E8E8; padding-right: 10px; padding-top: 5px; vertical-align: top; border-top: 0px; border-bottom: 0px; border-left: 0px;"
                                                        width="66.66666666666667%">
                                                        <table border="0" cellpadding="0" cellspacing="0"
                                                               class="paragraph_block block-1" role="presentation"
                                                               style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                               width="100%">
                                                            <tbody>
                                                            <tr>
                                                                <td class="pad"
                                                                    style="padding-bottom:10px;padding-right:10px;">
                                                                    <div
                                                                        style="color:#555555;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:14px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:16.8px;">
                                                                        <p style="margin: 0; word-break: break-word;">{{__('Subtotal')}}</p>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                    <td class="column column-2"
                                                        style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 5px; padding-right: 15px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                        width="33.333333333333336%">
                                                        <table border="0" cellpadding="0" cellspacing="0"
                                                               class="paragraph_block block-1" role="presentation"
                                                               style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                               width="100%">
                                                            <tbody>
                                                            <tr>
                                                                <td class="pad" style="padding-right:15px;">
                                                                    <div
                                                                        style="color:#555555;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:19.2px;">
                                                                        <p style="margin: 0; word-break: break-word;">{{currencyFormat($order->sub_total, $order->country)}}</p>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                @if($order->discount > 0)
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-11"
                                           role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
                                           width="100%">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                       class="row-content" role="presentation"
                                                       style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF; color: #333; width: 100%; margin: 0 auto;"
                                                       width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td class="column column-1"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-right: 1px dotted #E8E8E8; padding-right: 10px; padding-top: 5px; vertical-align: top; border-top: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="66.66666666666667%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad"
                                                                        style="padding-bottom:10px;padding-right:10px;">
                                                                        <div
                                                                            style="color:#555555;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:14px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:16.8px;">
                                                                            <p style="margin: 0; word-break: break-word;">{{__('Discount')}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        <td class="column column-2"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 5px; padding-right: 15px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="33.333333333333336%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad" style="padding-right:15px;">
                                                                        <div
                                                                            style="color:#43bc47;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:19.2px;">
                                                                            <p style="margin: 0; word-break: break-word;">
                                                                                <span><span><strong>-{{currencyFormat($order->discount, $order->country)}}</strong></span></span>
                                                                            </p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                @endif
                                @if($order->shipping_price > 0)
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-11"
                                           role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
                                           width="100%">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                       class="row-content" role="presentation"
                                                       style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF; color: #333; width: 100%; margin: 0 auto;"
                                                       width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td class="column column-1"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-right: 1px dotted #E8E8E8; padding-right: 10px; padding-top: 5px; vertical-align: top; border-top: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="66.66666666666667%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad"
                                                                        style="padding-bottom:10px;padding-right:10px;">
                                                                        <div
                                                                            style="color:#555555;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:14px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:16.8px;">
                                                                            <p style="margin: 0; word-break: break-word;">{{__('Shipping')}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        <td class="column column-2"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 5px; padding-right: 15px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="33.333333333333336%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad" style="padding-right:15px;">
                                                                        <div
                                                                            style="color:#333;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:19.2px;">
                                                                            <p style="margin: 0; word-break: break-word;">
                                                                                <span><span><strong>{{currencyFormat($order->shipping_price, $order->country)}}</strong></span></span>
                                                                            </p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                @endif
                                @if($order->total_paid>0 && !in_array($order->status, [\App\Enums\OrderStatus::PaymentPending, \App\Enums\OrderStatus::PreOrder2ndPaymentPending]) )
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-12"
                                           role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
                                           width="100%">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                       class="row-content" role="presentation"
                                                       style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF; color: #333; width: 100%; margin: 0 auto;"
                                                       width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td class="column column-1"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-right: 1px dotted #E8E8E8; padding-right: 10px; padding-top: 5px; vertical-align: top; border-top: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="66.66666666666667%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad"
                                                                        style="padding-bottom:10px;padding-right:10px;">
                                                                        <div
                                                                            style="color:#555555;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:15px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:18px;">
                                                                            <p style="margin: 0; word-break: break-word;">
                                                                                <strong>{{__('Paid')}}</strong></p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        <td class="column column-2"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 5px; padding-right: 15px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="33.333333333333336%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad" style="padding-right:15px;">
                                                                        <div
                                                                            style="color:#389126;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:18px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:21.599999999999998px;">
                                                                            <p style="margin: 0; word-break: break-word;">
                                                                                <span><span><strong>{{currencyFormat($order->total_paid, $order->country)}}</strong></span></span>
                                                                            </p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                @endif

                                {{-- Remain payment --}}
                                @if($order->status == \App\Enums\OrderStatus::PreOrder2ndPaymentPending)
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-14"
                                           role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
                                           width="100%">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                       class="row-content" role="presentation"
                                                       style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF; color: #333; width: 100%; margin: 0 auto;"
                                                       width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td class="column column-1"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-right: 1px dotted #E8E8E8; padding-right: 10px; padding-top: 5px; vertical-align: top; border-top: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="66.66666666666667%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad"
                                                                        style="padding-bottom:10px;padding-right:10px;">
                                                                        <div
                                                                            style="color:#555555;font-weight:bold; font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:14px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:16.8px;">
                                                                            <p style="margin: 0; word-break: break-word;">{{__('Paid')}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        <td class="column column-2"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 5px; padding-right: 15px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="33.333333333333336%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad" style="padding-right:15px;">
                                                                        <div
                                                                            style="color:#555555;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:19.2px;">
                                                                            <p style="margin: 0;">{{currencyFormat($order->total_paid, $order->country)}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-14"
                                           role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
                                           width="100%">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                       class="row-content" role="presentation"
                                                       style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF; color: #333; width: 100%; margin: 0 auto;"
                                                       width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td class="column column-1"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-right: 1px dotted #E8E8E8; padding-right: 10px; padding-top: 5px; vertical-align: top; border-top: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="66.66666666666667%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad"
                                                                        style="padding-bottom:10px;padding-right:10px;">
                                                                        <div
                                                                            style="color:#555555;font-weight:bold; font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:bold;line-height:120%;text-align:right;mso-line-height-alt:16.8px;">
                                                                            <p style="margin: 0; word-break: break-word;">{{__('Pay today')}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        <td class="column column-2"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 5px; padding-right: 15px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="33.333333333333336%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad" style="padding-right:15px;">
                                                                        <div
                                                                            style="color:#389126;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:18px;font-weight:bold;line-height:120%;text-align:right;mso-line-height-alt:19.2px;">
                                                                            <p style="margin: 0;">{{currencyFormat($order->remain_amount, $order->country)}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-14"
                                           role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
                                           width="100%">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                       class="row-content" role="presentation"
                                                       style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF; color: #333; width: 100%; margin: 0 auto;"
                                                       width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td class="column column-1"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-right: 1px dotted #E8E8E8; padding-right: 10px; padding-top: 5px; vertical-align: top; border-top: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="66.66666666666667%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad"
                                                                        style="padding-bottom:10px;padding-right:10px;">
                                                                        <div
                                                                            style="color:#555555;font-weight:bold; font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:14px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:16.8px;">
                                                                            <p style="margin: 0; word-break: break-word;">{{__('Payment deadline')}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        <td class="column column-2"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 5px; padding-right: 15px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="33.333333333333336%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad" style="padding-right:15px;">
                                                                        <div
                                                                            style="color:#555555;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:19.2px;">
                                                                            <p style="margin: 0;">{{dateFormat($order->invoice_expire_date, $order->country)}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                @endif

                                {{-- Payment pending --}}
                                @if($order->status == \App\Enums\OrderStatus::PaymentPending)
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-14"
                                           role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
                                           width="100%">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                       class="row-content" role="presentation"
                                                       style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF; color: #333; width: 100%; margin: 0 auto;"
                                                       width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td class="column column-1"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-right: 1px dotted #E8E8E8; padding-right: 10px; padding-top: 5px; vertical-align: top; border-top: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="66.66666666666667%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad"
                                                                        style="padding-bottom:10px;padding-right:10px;">
                                                                        <div
                                                                            style="color:#555555;font-weight:bold; font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:bold;line-height:120%;text-align:right;mso-line-height-alt:16.8px;">
                                                                            <p style="margin: 0; word-break: break-word;">{{__('Pay today')}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        <td class="column column-2"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 5px; padding-right: 15px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="33.333333333333336%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad" style="padding-right:15px;">
                                                                        <div
                                                                            style="color:#389126;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:18px;font-weight:bold;line-height:120%;text-align:right;mso-line-height-alt:19.2px;">
                                                                            <p style="margin: 0;">{{currencyFormat($order->today_payment_amount, $order->country)}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-14"
                                           role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
                                           width="100%">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                       class="row-content" role="presentation"
                                                       style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF; color: #333; width: 100%; margin: 0 auto;"
                                                       width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td class="column column-1"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-right: 1px dotted #E8E8E8; padding-right: 10px; padding-top: 5px; vertical-align: top; border-top: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="66.66666666666667%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad"
                                                                        style="padding-bottom:10px;padding-right:10px;">
                                                                        <div
                                                                            style="color:#555555;font-weight:bold; font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:14px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:16.8px;">
                                                                            <p style="margin: 0; word-break: break-word;">{{__('Payment deadline')}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        <td class="column column-2"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 5px; padding-right: 15px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="33.333333333333336%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad" style="padding-right:15px;">
                                                                        <div
                                                                            style="color:#555555;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:19.2px;">
                                                                            <p style="margin: 0;">{{dateFormat($order->invoice_expire_date, $order->country)}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                @endif

                                @if($order->status != \App\Enums\OrderStatus::PreOrder2ndPaymentPending)
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-13"
                                           role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
                                           width="100%">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                       class="row-content" role="presentation"
                                                       style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF; color: #333; width: 100%; margin: 0 auto;"
                                                       width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td class="column column-1"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-right: 1px dotted #E8E8E8; padding-right: 10px; padding-top: 5px; vertical-align: top; border-top: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="66.66666666666667%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad"
                                                                        style="padding-bottom:10px;padding-right:10px;">
                                                                        <div
                                                                            style="color:#555555;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:15px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:18px;">
                                                                            <p style="margin: 0; word-break: break-word;">{{__('Payment method')}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        <td class="column column-2"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 5px; padding-right: 15px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="33.333333333333336%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad" style="padding-right:15px;">
                                                                        <div
                                                                            style="color:#000000;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:19.2px;">
                                                                            <p style="margin: 0; word-break: break-word;">{{$order->payment_method_detail['name']}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                @endif

                                @if($order->remain_amount > 0 && $order->status != \App\Enums\OrderStatus::PreOrder2ndPaymentPending)
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-14"
                                           role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
                                           width="100%">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                       class="row-content" role="presentation"
                                                       style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #FFFFFF; color: #333; width: 100%; margin: 0 auto;"
                                                       width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td class="column column-1"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-right: 1px dotted #E8E8E8; padding-right: 10px; padding-top: 5px; vertical-align: top; border-top: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="66.66666666666667%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad"
                                                                        style="padding-bottom:10px;padding-right:10px;">
                                                                        <div
                                                                            style="color:#555555;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:14px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:16.8px;">
                                                                            <p style="margin: 0; word-break: break-word;">{{__('Pay later')}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        <td class="column column-2"
                                                            style="font-weight: 400; text-align: left; mso-table-lspace: 0pt; mso-table-rspace: 0pt; padding-bottom: 5px; padding-right: 15px; padding-top: 5px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
                                                            width="33.333333333333336%">
                                                            <table border="0" cellpadding="0" cellspacing="0"
                                                                   class="paragraph_block block-1" role="presentation"
                                                                   style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
                                                                   width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="pad" style="padding-right:15px;">
                                                                        <div
                                                                            style="color:#ff9f0f;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;line-height:120%;text-align:right;mso-line-height-alt:19.2px;">
                                                                            <p style="margin: 0;">{{currencyFormat($order->remain_amount, $order->country)}}</p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                @endif
                            </td>
                        </tr>
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
