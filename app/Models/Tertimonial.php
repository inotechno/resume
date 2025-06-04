<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tertimonial extends Model
{
    protected $table = 'tertimonials';

    protected $fillable = [
        'name',
        'position',
        'company',
        'content',
        'rating',
        'image_url'
    ];
}
