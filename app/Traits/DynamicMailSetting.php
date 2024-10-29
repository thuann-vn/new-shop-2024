<?php

namespace App\Traits;

use App\Models\Blog\Post;
use App\Models\EmailTemplate;
use App\Models\Language;
use App\Models\Shop\Order;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\View;

trait DynamicMailSetting
{
    public Language $language;

    public $emailTemplate;

    public function setMailSetting($country)
    {
        $mailSetting = $country->smtp ?? null;
        if (! empty($mailSetting)) {
            Mail::forgetMailers();
            config([
                'mail.mailers.smtp.host' => $mailSetting->host,
                'mail.mailers.smtp.port' => $mailSetting->port,
                'mail.mailers.smtp.username' => $mailSetting->username,
                'mail.mailers.smtp.password' => $mailSetting->password,
                'mail.mailers.smtp.encryption' => $mailSetting->encryption,
                'mail.from.address' => $mailSetting->from_address,
                'mail.from.name' => $mailSetting->from_name,
            ]);
        }

        return $mailSetting;
    }

    public function getMailSetting($country)
    {
        $mailSetting = $country->smtp ?? null;
        if (! empty($mailSetting)) {
            Mail::forgetMailers();
            config([
                'mail.mailers.smtp.host' => $mailSetting->host,
                'mail.mailers.smtp.port' => $mailSetting->port,
                'mail.mailers.smtp.username' => $mailSetting->username,
                'mail.mailers.smtp.password' => $mailSetting->password,
                'mail.mailers.smtp.encryption' => $mailSetting->encryption,
                'mail.from.address' => $mailSetting->from_address,
                'mail.from.name' => $mailSetting->from_name,
            ]);
        }

        return $mailSetting;
    }

    public function send($mailer)
    {
        return $this->withLocale($this->language->code, function () use ($mailer) {
            $this->prepareMailableForDelivery();
            $mailSetting = $this->country->smtp;
            $mailer = app('country.mailer', [
                'transport' => 'smtp',
                'host' => $mailSetting->host,
                'port' => $mailSetting->port,
                'username' => $mailSetting->username,
                'password' => $mailSetting->password,
                'encryption' => $mailSetting->encryption,
            ]);

            return $mailer->send($this->buildView(), $this->buildViewData(), function ($message) {
                $this->buildFrom($message)
                    ->buildRecipients($message)
                    ->buildSubject($message)
                    ->buildTags($message)
                    ->buildMetadata($message)
                    ->runCallbacks($message)
                    ->buildAttachments($message);
            });
        });
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $template = EmailTemplate::findEmailByKey($this->template, $this->language->code);
        $this->emailTemplate = $template;
        if ($this->attachment ?? false) {
            $this->attach(
                $this->attachment->filepath,
                [
                    'as' => $this->attachment->filename,
                    'mime' => $this->attachment->filetype,
                ]
            );
        }
        $locale = $this->language->code;
        $content = $template->getTranslation('content', $locale);
        $content = htmlspecialchars_decode($content);
        $content = $this->replaceTokens($content, $this);
        if (str_contains($content, '##order_details##')) {
            $content = str_replace('##order_details##', $this->renderOrderDetails(), $content);
        }
        if (str_contains($content, '##plant_package_details##')) {
            $content = str_replace('##plant_package_details##', $this->renderPlantPackageDetails(), $content);
        }
        if (str_contains($content, '##project_update_info##')) {
            $content = str_replace('##project_update_info##', $this->renderProjectUpdate(), $content);
        }
        $data = [
            'content' => $content,
            'preHeaderText' => $this->replaceTokens($template->preheader, $this),
            'title' => $this->replaceTokens($template->title, $this),
            'theme' => $template->theme->colours,
            'receiverName' => $this->sendToName ?? '',
            'giftTemplate' => $this->giftTemplate ?? '',
            'order' => $this->order ?? new Order(),
            'giftMessage' => $this->giftMessage ?? '',
            'companyInfo' => [
                'name' => getGeneralSettings('company_name', $locale),
                'address' => getGeneralSettings('company_address', $locale),
                'phone' => getGeneralSettings('company_phone', $locale),
                'email' => getGeneralSettings('company_email', $locale),
            ],
        ];

        return $this
            ->locale($this->country->language->code)
            ->view($template->view_path)
            ->subject($this->replaceTokens($template->getTranslation('subject', $locale), $this))
            ->to($this->sendTo)
            ->with(['data' => $data]);
    }

    private function renderOrderDetails()
    {
        $order = $this->order ?? new Order();

        return View::make('vb-email-templates::email.parts._order_details', compact('order'))
            ->render();
    }

    private function renderProjectUpdate()
    {
        $post = $this->post ?? new Post();

        return View::make('vb-email-templates::email.parts._project_update', compact('post'))
            ->render();
    }

    private function renderPlantPackageDetails()
    {
        $plantPackage = $this->plantPackage ?? new PlantingPackage();

        return View::make('vb-email-templates::email.parts._plant_package_details', compact('plantPackage'))
            ->render();
    }

    private function replaceTokens($content, $models)
    {
        $content = htmlspecialchars_decode($content, ENT_QUOTES);
        // Replace singular tokens.
        // These are for password reset and email verification

        if (isset($models->tokenUrl)) {
            $content = str_replace('##tokenURL##', $models->tokenUrl, $content);
        }

        if (isset($models->verificationUrl)) {
            $content = str_replace('##verificationUrl##', $models->verificationUrl, $content);
        }

        // Replace model-attribute tokens.
        // Will look for pattern ##model.attribute## and replace the value if found.
        // Eg ##user.name##
        preg_match_all('/##([^#]+)\.([^#\|]+)\|?([^#]+)?##/', $content, $matches);

        if (count($matches) > 0 && count($matches[0]) > 0) {
            for ($i = 0; $i < count($matches[0]); $i++) {
                $modelKey = $matches[1][$i];
                $attributeKey = $matches[2][$i];
                $format = $matches[3][$i] ?? null;

                if (isset($models->$modelKey) && isset($models->$modelKey->$attributeKey)) {
                    $value = $models->$modelKey->$attributeKey;
                    switch ($format) {
                        case 'currency':
                            $value = currencyFormat($value, $this->country);

                            break;
                        case 'date':
                            $value = dateFormat($value, $this->country);

                            break;
                    }
                    $content = str_replace($matches[0][$i], $value, $content);
                }
            }
        }

        // Replace config tokens.
        $allowedConfigKeys = config('filament-email-templates.config_keys');

        preg_match_all('/##config\.(.*?)##/', $content, $matches);
        if (count($matches) > 0 && count($matches[0]) > 0) {
            for ($i = 0; $i < count($matches[0]); $i++) {
                $configKey = $matches[1][$i];
                if (in_array($configKey, $allowedConfigKeys)) {
                    $configValue = config($configKey);
                    if ($configValue !== null) {
                        $content = str_replace($matches[0][$i], $configValue, $content);
                    }
                }
            }
        }

        //Replace the button
        $button = $this->buildEmailButton($content);
        $content = $this->replaceButtonToken($content, $button);

        return $content;
    }

    public function buildEmailButton($content)
    {
        $title = $url = '';
        //Convert special characters to html entities
        $content = htmlspecialchars_decode($content);
        if (preg_match('/(?<=##button).*?(?=#)/', $content, $matches)) {
            if ($check1 = preg_match("/(?<=url=').*?(?='\s)/", $matches[0], $url)) {
                $url = $url[0];
            }
            if ($check2 = preg_match("/(?<=title=').*?(?=')/", $matches[0], $title)) {
                $title = $title[0];
            }
            if ($check1 && $check2) {
                return View::make('vb-email-templates::email.parts._button', [
                    'url' => $url,
                    'title' => $title,
                    'data' => ['theme' => $this->emailTemplate->theme->colours],
                ])
                    ->render();
            }
        }

        return '';
    }

    public function replaceButtonToken($content, $button)
    {
        $search = '/(?<=##button).*?(?=##)/';
        $replace = '';
        $content = preg_replace($search, $replace, $content);
        $content = str_replace('##button##', $button, $content);

        return $content;
    }
}
