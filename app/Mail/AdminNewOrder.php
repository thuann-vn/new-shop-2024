<?php

namespace App\Mail;

use App\Models\Shop\Order;
use App\Traits\DynamicMailSetting;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class AdminNewOrder extends Mailable
{
    use DynamicMailSetting;
    use Queueable;
    use SerializesModels;

    public $template = 'admin-new-order';

    public $user;

    public $sendTo;

    public $order;

    public $attachment;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user, Order $order, $attachment = null)
    {
        $this->countryId = $order->country_id;
        $this->user = $user;
        $this->sendTo = $user->email;
        $this->order = $order;
        $this->attachment = $attachment;
    }
}
