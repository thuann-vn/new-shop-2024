<?php

namespace App\Mail;

use App\Models\Shop\Order;
use App\Traits\DynamicMailSetting;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Visualbuilder\EmailTemplates\Traits\BuildGenericEmail;

class UserNewOrder extends Mailable
{
    use DynamicMailSetting;
    use Queueable;
    use SerializesModels;

    public $template = 'user-new-order';

    public $user;

    public $order;

    public $sendTo;

    public string $portalUrl;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user, Order $order)
    {
        $this->countryId = $order->country_id;
        $this->user = $user;
        $this->sendTo = $user->email;
        $this->order = $order;
        $this->portalUrl = route('account.orders.index');
    }
}
