<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Masoudi\Laravel\Visitors\Traits\InteractsWithVisitors;

class Resume extends Model
{
    use InteractsWithVisitors;

    protected $fillable = [
        'file_name',
        'file_path'
    ];

    protected static function booted()
    {
        static::saving(function ($resume) {
            if ($resume->file_path && !$resume->file_name) {
                $resume->file_name = pathinfo($resume->file_path, PATHINFO_BASENAME);
            }
        });
    }
}
