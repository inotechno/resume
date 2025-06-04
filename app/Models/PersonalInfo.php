<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PersonalInfo extends Model
{
    protected $table = 'personal_infos';

    protected $fillable = [
        'key',
        'value',
    ];

    public function getValueAttribute($value)
    {
        return json_decode($value, true);
    }

    public function setValueAttribute($value)
    {
        $this->attributes['value'] = json_encode($value);
    }
}
