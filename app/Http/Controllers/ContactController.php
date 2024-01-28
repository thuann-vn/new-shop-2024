<?php

namespace App\Http\Controllers;

use App\Enums\ContactRequestStatus;
use App\Http\Requests\ContactRequest;
use App\Models\User;
use App\Notifications\AdminNewContact;
use Illuminate\Support\Facades\Log;

class ContactController extends Controller
{
    public function submitContact(ContactRequest $request)
    {
        $params = $request->except('_token');

        $params['status'] = ContactRequestStatus::New;
        $contact = new \App\Models\ContactRequest();
        $contact->fill($params);
        $contact->save();

        try {
            //Get Admins
            $admins = User::whereType('admin')->get();
            \Notification::send($admins, new AdminNewContact($contact));
        } catch (\Exception $exception) {
            Log::error('Can not send email ' . $exception->getMessage());
        }

        return back()->with('status', 'Your message has been sent successfully, we will contact you soon.');
    }
}
