<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Resume extends Model
{
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
