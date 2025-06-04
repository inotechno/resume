<?php

namespace App\Livewire\Content;

use App\Livewire\BaseComponent;
use Livewire\Component;

class Service extends BaseComponent
{
    public function render()
    {
        $services = \App\Models\Service::all();
        return view('livewire.content.service', compact('services'));
    }
}
