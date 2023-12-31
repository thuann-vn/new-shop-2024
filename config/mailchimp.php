<?php

return [
    'apiKey' => env('MAILCHIMP_APIKEY'),
    'lists'  => [
        'newsletter' => env('MAILCHIMP_LIST_ID'),
    ],
];
