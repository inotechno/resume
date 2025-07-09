<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Masoudi\Laravel\Visitors\Traits\InteractsWithVisitors;

class Education extends Model
{
    use InteractsWithVisitors;

    protected $table = 'education';

    protected $fillable = [
        'name',
        'degree',
        'field_of_study',
        'start_date',
        'end_date',
        'grade',
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
