<?php

namespace App\Http\Middleware;

use App\Models\Country;
use App\Models\Language;
use Closure;
use Illuminate\Foundation\Application;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class LocaleMiddleware
{
    public function __construct(Application $app, Request $request)
    {
        $this->app = $app;
        $this->request = $request;
    }

    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $currentLocale = session('locale') ?? config('app.locale');
        //Check if request params has country code
        if (! empty($request->query('lang'))) {
            $language = Language::where('code', $request->lang)->first();
        } else {
            $language = Language::where('code', $currentLocale)->first();
        }
        if (! empty($language)) {
            session(['locale' => $language->code]);
            app()->setLocale($language->code);
        }
        return $next($request);
    }
}
