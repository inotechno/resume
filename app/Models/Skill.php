<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Masoudi\Laravel\Visitors\Traits\InteractsWithVisitors;

class Skill extends Model
{
    use InteractsWithVisitors;

    protected $table = 'skills';

    protected $fillable = [
        'slug',
        'name',
        'description',
        'image_url',
        'icon_url',
        'percentage',
        'color',
        'type'
    ];
}
