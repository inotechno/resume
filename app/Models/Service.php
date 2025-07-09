<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Masoudi\Laravel\Visitors\Traits\InteractsWithVisitors;

class Service extends Model
{
    use InteractsWithVisitors;

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
