<?php

namespace App\Mail;

use App\Models\Shop\PlantingPackage;
use App\Traits\DynamicMailSetting;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Visualbuilder\EmailTemplates\Traits\BuildGenericEmail;

class UserPlantPackageCreated extends Mailable
{
    use Queueable;
    use SerializesModels;
    use DynamicMailSetting;

    public $template = 'user-plant-package-created';
    public $user;
    public $sendTo;
    public $plantPackage;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user, PlantingPackage $plantingPackage)
    {
        $this->countryId = $plantingPackage->order->country_id;
        $this->plantPackage = $plantingPackage;
        $this->user = $user;
        $this->sendTo = $user->email;
    }
}
