<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    protected $table = 'services';

    protected $fillable = [
        'slug',
        'name',
        'description',
        'description_excerpt',
        'image_url',
        'icon_url'
    ];
}
