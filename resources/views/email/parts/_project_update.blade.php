@php
/**
 * @var \App\Models\Shop\PlantingPackage $plantPackage
 */
@endphp
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="
    margin-left: -30px;
    margin-right: -30px;
    width: auto;
">
    <tr>
        <td align="center"></td>
        <td>
            <table align="center" border="0" cellpadding="0" cellspacing="0" class="row row-6" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
                <tbody>
                <tr>
                    <td>
                        <table align="center" border="0" cellpadding="0" cellspacing="0" class="row-content" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #fff; color: #333; width: 100%; margin: 0 auto;" width="100%">
                            <tbody>
                            <tr>
                                <td colspan="2" align="left" style="color: rgb(56, 145, 38); font-weight: bold; padding: 0 20px;">
                                    <table border="0" cellpadding="10" cellspacing="0" class="paragraph_block block-1" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                        <tbody><tr>
                                            <td class="pad">
                                                <span>{{$post->project->name}}</span>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="column column-1" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; padding-bottom: 5px; padding-left: 20px; padding-right: 10px; padding-top: 15px; vertical-align: top; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;" width="40%">
                                    <table border="0" cellpadding="10" cellspacing="0" class="paragraph_block block-1" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                        <tbody><tr>
                                            <td class="pad">
                                               <img src="{{asset('/storage/'. $post->image)}}" alt="{{$post->title}}" style="width: 100%; height: auto;"/>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td class="column column-2" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; border-right: 1px dotted #E8E8E8; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; padding-top: 15px; vertical-align: top; border-top: 0px; border-bottom: 0px; border-left: 0px;" width="60%">
                                    <table border="0" cellpadding="10" cellspacing="0" class="paragraph_block block-1" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;" width="100%">
                                        <tbody>
                                        <tr>
                                            <td class="pad">
                                                <div style="color:#101112;direction:ltr;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;letter-spacing:0px;line-height:120%;mso-line-height-alt:19.2px;">
                                                    <a href="{{route('blog.detail', $post->slug)}}">
                                                        <strong style="margin: 0;">{{$post->title}}</strong>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="pad">
                                                <div style="color:#101112;direction:ltr;font-family:Arial, 'Helvetica Neue', Helvetica, sans-serif;font-size:16px;font-weight:400;letter-spacing:0px;line-height:120%;mso-line-height-alt:19.2px;">
                                                    <p style="margin: 0;">{!! $post->excerpt !!}</p>
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
        </td>
    </tr>
</table>
