<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;
use Spatie\Translatable\HasTranslations;

/**
 * @property string $handle
 * @property array $items
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 */
class Navigation extends Model
{
    use HasFactory;
    use HasTranslations;

    public $translatable = ['items'];

    protected $guarded = [];

    protected $casts = [
        'items' => 'array',
    ];

    public static function fromHandle(string $handle): ?static
    {
        return static::query()->firstWhere('handle', $handle);
    }

    public function language(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Language::class);
    }
}
