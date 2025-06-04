<?php

namespace App\Livewire\Content;

use Livewire\Component;

class Education extends Component
{
    public function render()
    {
        $educations = \App\Models\Education::orderBy('start_date', 'desc')->get();

        return view('livewire.content.education', compact('educations'));
    }
}
