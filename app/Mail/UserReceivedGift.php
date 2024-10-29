<?php

namespace App\Mail;

use App\Models\Shop\Order;
use App\Traits\DynamicMailSetting;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class UserReceivedGift extends Mailable
{
    use DynamicMailSetting;
    use Queueable;
    use SerializesModels;

    public $template = 'user-received-gift';

    public $user;

    public $sendTo;

    public $sendToName;

    public $giftCard;

    public $order;

    public $giftTemplate;

    public $giftMessage;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($email, $link, $countryId, Order $order)
    {
        $this->countryId = $countryId;
        $this->sendTo = $email;
        $this->sendToName = $order->orderAsGift->receiver_first_name . ' ' . $order->orderAsGift->receiver_last_name;
        $this->giftCard = (object) [
            'url' => $link,
            'code' => $order->orderAsGift->confirmation_code,
            'expiry' => $order->orderAsGift->confirmation_expire_at->format('d/m/Y'),
            'total_trees' => $order->items->sum('qty'),
            'message' => $order->orderAsGift->message ?? '',
        ];
        $this->order = $order;
        $this->giftTemplate = $order->orderAsGift->template;
        $this->giftMessage = $order->orderAsGift->message;
    }
}
