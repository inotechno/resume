<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'categories';

    protected $fillable = [
        'name',
        'description',
        'slug',
        'icon_url',
        'color'
    ];

    public function projects()
    {
        return $this->hasMany(Project::class);
    }
}
