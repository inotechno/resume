<?php

namespace App\Livewire\Content;

use Livewire\Component;

class Experience extends Component
{
    public function render()
    {
        $experiences = \App\Models\Experience::orderBy('start_date', 'desc')->get();

        return view('livewire.content.experience', compact('experiences'));
    }
}
