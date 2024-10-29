<?php

namespace App\Mail;

use App\Models\Shop\Order;
use App\Traits\DynamicMailSetting;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class UserPaymentFailed extends Mailable
{
    use DynamicMailSetting;
    use Queueable;
    use SerializesModels;

    public $template = 'user-payment-failed';

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
        $this->order = $order;
        $this->countryId = $order->country_id;
        $this->user = $user;
        $this->sendTo = $user->email;
    }
}
