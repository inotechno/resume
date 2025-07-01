<?php

namespace App\Livewire;

use App\Models\PersonalInfo;
use Livewire\Component;

class BaseComponent extends Component
{
    public $favicon;
    public $personal;
    public function boot()
    {
        $this->personal = PersonalInfo::all()->pluck('value', 'key')->toArray();
        $this->favicon = $this->personal['favicon'];
    }
}
