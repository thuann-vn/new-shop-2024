<?php

namespace App\Mail;

use App\Traits\DynamicMailSetting;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class UserPendingActivation extends Mailable
{
    use DynamicMailSetting;
    use Queueable;
    use SerializesModels;

    public $template = 'user-pending-activation';

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
        $this->bcc(getAllAdminEmails($user->country_id));
    }
}
