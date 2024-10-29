<?php

namespace App\Mail;

use App\Traits\DynamicMailSetting;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class UserRegistrationOtp extends Mailable
{
    use DynamicMailSetting;
    use Queueable;
    use SerializesModels;

    public $template = 'user-registration-otp';

    public object $otp;

    public $sendTo;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($email, $otp, $isChangeEmailOtp = false)
    {
        $isChangeEmailOtp = session('changing_email');
        $country = getCurrentCountry();
        $this->countryId = $country->id;
        $this->sendTo = $email;
        if ($isChangeEmailOtp) {
            $this->template = 'user-change-email-otp';
        }
        $this->otp = (object) [
            'code' => $otp,
            'link' => $isChangeEmailOtp ? route('account.profile.change-email-confirm', ['otp' => $otp, 'email' => $email]) : route('register.verify-email', ['otp' => $otp, 'email' => $email]),
        ];
    }
}
