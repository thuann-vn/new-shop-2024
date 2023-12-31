<?php

namespace App\Http\Controllers;

use Altelma\LaravelMailChimp\LaravelMailChimp;
use GuzzleHttp\Exception\GuzzleException;
use Illuminate\Http\Request;

class NewsLetterController extends Controller
{

    /**
     * @throws GuzzleException
     */
    public function subscribe(Request $request)
    {
        //Validate email
        $request->validate([
            'email' => 'required|email'
        ]);

        $mc = new LaravelMailChimp(config('mailchimp.apiKey'));
        $results = $mc->post('lists/' . config('mailchimp.lists.newsletter'),
            [
                'json' => [
                    'members' => [
                        [
                            'email_address' => $request->email,
                            'status' => 'subscribed',
                        ],
                    ],
                ]
            ]);

        return response()->json([
            'message' => 'Thanks for subscribing!'
        ]);
    }
}
