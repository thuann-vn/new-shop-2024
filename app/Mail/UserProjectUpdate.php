<?php

namespace App\Mail;

use App\Models\Blog\Post;
use App\Models\Shop\Project;
use App\Traits\DynamicMailSetting;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class UserProjectUpdate extends Mailable
{
    use DynamicMailSetting;
    use Queueable;
    use SerializesModels;

    public $template = 'user-project-update';

    public $user;

    public $sendTo;
    public Post $post;
    public Project $project;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user, Post $post)
    {
        $this->post = $post;
        $this->project = $post->project;
        $this->user = $user;
        $this->countryId = $user->country_id;
        $this->sendTo = $user->email;
    }
}
