<?php

namespace App\Mail;

use App\Models\Shop\Order;
use App\Traits\DynamicMailSetting;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class UserPendingPaymentOrder extends Mailable
{
    use DynamicMailSetting;
    use Queueable;
    use SerializesModels;

    public $template = 'user-pending-payment-order';

    public $user;

    public $sendTo;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user, public Order $order)
    {
        $this->countryId = $order->country_id;
        $this->user = $user;
        $this->sendTo = $user->email;
        $this->bcc(getAllAdminEmails($user->country_id));
    }
}
