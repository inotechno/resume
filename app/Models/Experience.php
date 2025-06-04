<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Experience extends Model
{
    protected $table = 'experiences';

    protected $fillable = [
        'position',
        'company',
        'content',
        'start_date',
        'end_date',
        'is_current'
    ];

    public function getStartDateAttribute($value)
    {
        return date('F Y', strtotime($value));
    }

    public function getEndDateAttribute($value)
    {
        return date('F Y', strtotime($value));
    }
}
