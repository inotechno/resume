<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasUuids;

    protected $table = 'projects';
    protected $primaryKey = 'id';

    protected $fillable = [
        'title',
        'category_id',
        'slug',
        'description',
        'description_excerpt',
        'thumbnail',
        'image_url',
        'project_url',
        'github',
        'tags'
    ];

    protected $casts = [
        'tags' => 'array'
    ];

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }
}
