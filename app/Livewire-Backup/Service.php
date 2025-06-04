<?php

namespace App\Livewire;

use Livewire\Component;

class Service extends Component
{
    public $services;

    public function mount()
    {
        $this->services = \App\Models\Service::all();
    }

    public function render()
    {
        return view('livewire.service');
    }
}
