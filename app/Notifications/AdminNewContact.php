<?php

namespace App\Notifications;

use App\Models\ContactRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class AdminNewContact extends Notification
{
    use Queueable;

    private ContactRequest $contact;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(ContactRequest $contact)
    {
        //
        $this->contact = $contact;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        $sendChannel = ['database'];
        if ($notifiable->email) {
            $sendChannel[] = 'mail';
        }
        return $sendChannel;
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param mixed $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        list($title, $body) = $this->getSubjectAndBody();
        return (new MailMessage)
            ->subject($title)
            ->line($body)
            ->line('Name: ' . $this->contact->name)
            ->line('Email: ' . $this->contact->email)
            ->line('Subject: ' . $this->contact->subject)
            ->line('Message: ' . $this->contact->message)
            ->action('Login to view', url('/admin'));
    }

    /**
     * Get the array representation of the notification.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        list($title, $body) = $this->getSubjectAndBody();
        return [
            'title' => $title,
            'message' => $body,
            'reference_id' => $this->contact->id
        ];
    }

    private function getSubjectAndBody()
    {
        $title = 'New message from ' . config('app.name');
        $body = 'You have a new message from contact form';
        return [$title, $body];
    }
}
