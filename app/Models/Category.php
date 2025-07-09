<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Masoudi\Laravel\Visitors\Traits\InteractsWithVisitors;

class Category extends Model
{
    use InteractsWithVisitors;

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
