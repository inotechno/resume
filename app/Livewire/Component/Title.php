<?php

namespace App\Livewire\Component;

use App\Livewire\BaseComponent;
use Livewire\Component;

class Title extends BaseComponent
{
    public $positions = [];

    public function mount()
    {
        $this->positions = explode('|', $this->personal['title']);
    }

    public function render()
    {
        return view('livewire.component.title');
    }
}
