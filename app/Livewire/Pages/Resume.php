<?php

namespace App\Livewire\Pages;

use Livewire\Component;

class Resume extends Component
{
    public function render()
    {
        $educations = \App\Models\Education::orderBy('start_date', 'desc')->get();
        return view('livewire.pages.resume');
    }
}
