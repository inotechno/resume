<?php

namespace App\Livewire\Component;

use App\Livewire\BaseComponent;
use Livewire\Component;

class PhotoProfile extends BaseComponent
{
    public $value;

    public function mount()
    {
        $this->value = $this->personal['image_url'];
    }

    public function render()
    {
        return view('livewire.component.photo-profile');
    }
}
