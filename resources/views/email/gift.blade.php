@php
    $image1 = asset('media/email-templates/love_image_1.png');
    $image2 = asset('media/email-templates/love_image_2.png');
    switch ($giftTemplate){
        case 'birthday':
            $image1 = asset('media/email-templates/birthday_image_1.png');
            $image2 = asset('media/email-templates/birthday_image_2.png');
            break;
        case 'christmas':
            $image1 = asset('media/email-templates/christmas_image_1.png');
            $image2 = asset('media/email-templates/christmas_image_2.png');
            break;
        case 'love':
            $image1 = asset('media/email-templates/love_image_1.png');
            $image2 = asset('media/email-templates/love_image_2.png');
            break;
    }
@endphp

@include('vb-email-templates::email.parts._head')

@include('vb-email-templates::email.parts._body')

@include('vb-email-templates::email.parts._gift_hero_title', ['image' => $image1])

@include('vb-email-templates::email.parts._gift_content', ['image' => $image2])

@include('vb-email-templates::email.parts._support_block')

@include('vb-email-templates::email.parts._footer')

@include('vb-email-templates::email.parts._closing_tags')


