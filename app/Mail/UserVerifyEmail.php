<?php

namespace App\Mail;

use App\Traits\DynamicMailSetting;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Visualbuilder\EmailTemplates\Traits\BuildGenericEmail;

class UserVerifyEmail extends Mailable
{
    use Queueable;
    use SerializesModels;
    use DynamicMailSetting;

    public $template = 'user-verify-email';
    public $user;
    public $sendTo;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user)
    {
        $this->user = $user;
        $this->sendTo = $user->email;
        $this->countryId = $user->country_id;
    }
}
