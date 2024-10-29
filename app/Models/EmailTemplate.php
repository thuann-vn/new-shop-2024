<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;
use Spatie\Translatable\HasTranslations;

/**
 * @property int $id
 * @property string $key
 * @property array $from
 * @property string $name
 * @property string $view
 * @property string $send_to
 * @property object $cc
 * @property object $bcc
 * @property string $subject
 * @property string $title
 * @property string $preheader
 * @property string $language
 * @property string $content
 * @property string $created_at
 * @property string $updated_at
 * @property string $deleted_at
 */
class EmailTemplate extends Model
{
    use HasTranslations;
    use SoftDeletes;

    protected $table = 'email_templates';

    public array $translatable = [
        'subject',
        'content',
    ];

    /**
     * @var array
     */
    protected $fillable = [
        'from',
        'key',
        'name',
        'view',
        'subject',
        'title',
        'preheader',
        'content',
        'language',
        'send_to',
    ];

    /**
     * @var string[]
     */
    protected $casts = [
        'deleted_at' => 'datetime:Y-m-d H:i:s',
        'created_at' => 'datetime:Y-m-d H:i:s',
        'updated_at' => 'datetime:Y-m-d H:i:s',
        'from' => 'array',
        'content' => 'array',
        'subject' => 'array',
    ];

    /**
     * @var string[]
     */
    protected $dates = ['deleted_at'];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
    }

    public static function findEmailByKey($key, $language = null): self
    {
        $cacheKey = "email_by_key_{$key}";
        Cache::forget($cacheKey); //Remove cache if it exists (for testing purposes

        //For multi site domains this key will need to include the site_id
        return Cache::remember($cacheKey, now()->addMinutes(60), function () use ($key) {
            return self::query()
                ->where('key', $key)
                ->firstOrFail();
        });
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public static function getSendToSelectOptions()
    {
        return collect(config('emailTemplate.recipients'));
    }


    /**
     * @return string
     */
    public function __toString()
    {
        return $this->name ?? class_basename($this);
    }


    /**
     * Gets base64 encoded content - to add to an iframe
     *
     * @return string
     */
    public function getBase64EmailPreviewData()
    {
        /**
         * Iframes normally use src attribute to load content from a url
         * This means an extra http request
         *  Below method includes the content directly as base64 encoded
         */
        $data = $this->getEmailPreviewData();
        $content = view($this->view_path, ['data' => $data])->render();

        return base64_encode($content);
    }

    /**
     * @return array
     */
    public function getEmailPreviewData()
    {
        $model = self::createEmailPreviewData();

        return [
            'user' => $model->user,
            'content' => $this->replaceTokens($this->content, $model),
            'subject' => $this->replaceTokens($this->subject, $model),
            'preHeaderText' => $this->replaceTokens($this->preheader, $model),
            'title' => $this->replaceTokens($this->title, $model),
            'theme' => $this->theme->colours,
        ];
    }

    /**
     * @return object
     */
    public static function createEmailPreviewData()
    {
        $model = (object) [];

        $userModel = config('filament-email-templates.recipients')[0];
        //Setup some data for previewing email template
        $model->user = $userModel::first();

        $model->tokenUrl = URL::to('/');
        $model->verificationUrl = URL::to('/');
        $model->expiresAt = now();
        /* Not used in preview but need to add something */
        $model->plainText = Str::random(32);

        return $model;
    }

    /**
     * Efficient method to return requested template locale or default language template in one query
     *
     *
     * @return Builder
     */
    public function scopeLanguage(Builder $query, $language)
    {
        $languages = [$language, config('filament-email-templates.default_locale')];

        return $query->whereIn('language', $languages)
            ->orderByRaw(
                '(CASE WHEN language = ? THEN 1 ELSE 2 END)',
                [$language]
            );
    }

    public function viewPath(): Attribute
    {
        return new Attribute(
            get: fn () => config('filament-email-templates.template_view_path') . '.' . $this->view
        );
    }

    public function getMailableExistsAttribute(): bool
    {
        $className = Str::studly($this->key);
        $filePath = app_path(config('filament-email-templates.mailable_directory') . "/{$className}.php");

        return File::exists($filePath);
    }

    /**
     * @return string
     *
     * @throws \Exception
     */
    public function getMailableClass()
    {
        $className = Str::studly($this->key);
        $directory = str_replace('/', '\\', config('filament-email-templates.mailable_directory', 'Mail/Visualbuilder/EmailTemplates')); // Convert slashes to namespace format
        $fullClassName = "\\App\\{$directory}\\{$className}";

        if (! class_exists($fullClassName)) {
            throw new \Exception("Mailable class {$fullClassName} does not exist.");
        }

        return $fullClassName;
    }
}
