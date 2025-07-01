<?php

namespace App\Livewire;

use App\Models\PersonalInfo;
use Livewire\Component;

class BaseComponent extends Component
{
    public $personal;
    public function boot()
    {
        $this->personal = PersonalInfo::all()->pluck('value', 'key')->toArray();
        // dd($this->personal);
    }
}
