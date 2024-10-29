<?php

namespace App\Mail;

use App\Models\Shop\Order;
use App\Traits\DynamicMailSetting;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class UserOrderPaid extends Mailable
{
    use DynamicMailSetting;
    use Queueable;
    use SerializesModels;

    public $template = 'user-order-paid';

    public $user;

    public $sendTo;

    public $order;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user, Order $order)
    {
        $this->countryId = $order->country_id;
        $this->order = $order;
        $this->user = $user;
        $this->sendTo = $user->email;
    }
}
