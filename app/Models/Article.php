<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    protected $table = 'articles';

    protected $fillable = [
        'slug',
        'title',
        'content',
        'content_excerpt',
        'image_url',
        'author'
    ];
}
