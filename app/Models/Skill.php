<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Skill extends Model
{
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
