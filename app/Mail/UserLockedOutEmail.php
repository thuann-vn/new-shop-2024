<?php

namespace App\Mail;

use App\Traits\DynamicMailSetting;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Visualbuilder\EmailTemplates\Traits\BuildGenericEmail;

class UserLockedOutEmail extends Mailable
{
    use Queueable;
    use SerializesModels;
    use DynamicMailSetting;

    public $template = 'user-locked-out';
    public $user;
    public $sendTo;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user)
    {
        $this->countryId = $user->country_id;
        $this->user = $user;
        $this->sendTo = $user->email;
    }
}