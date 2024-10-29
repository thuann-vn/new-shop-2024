<?php

namespace App\Mail;

use App\Traits\DynamicMailSetting;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;
use Visualbuilder\EmailTemplates\Traits\BuildGenericEmail;

class UserRequestPasswordResetEmail extends Mailable
{
    use DynamicMailSetting;
    use Queueable;
    use SerializesModels;

    public $user;

    public $tokenUrl;

    public $template = 'user-request-reset';

    public $sendTo;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user, $token)
    {
        $this->countryId = $user->country_id;
        $this->user = $user;
        $this->tokenUrl = $token;
        $this->sendTo = $user->email;
    }
}
