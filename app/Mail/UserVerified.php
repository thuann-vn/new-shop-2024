<?php

namespace App\Mail;

use App\Traits\DynamicMailSetting;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class UserVerified extends Mailable
{
    use DynamicMailSetting;
    use Queueable;
    use SerializesModels;

    public $template = 'user-verified';

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
        $this->bcc(getAllAdminEmails($user->country_id));
    }
}
