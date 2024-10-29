<?php

namespace App\Mail;

use App\Models\Shop\Order;
use App\Traits\DynamicMailSetting;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Visualbuilder\EmailTemplates\Traits\BuildGenericEmail;

class AdminOrderCancel extends Mailable
{
    use Queueable;
    use SerializesModels;
    use DynamicMailSetting;

    public $template = 'admin-order-cancel';
    public $user;
    public $sendTo;
    public Order $order;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user, $order)
    {
        $this->countryId = $user->country_id;
        $this->user = $user;
        $this->sendTo = $user->email;
        $this->order = $order;
    }
}
