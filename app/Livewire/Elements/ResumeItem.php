<?php

namespace App\Livewire\Elements;

use Livewire\Component;

class ResumeItem extends Component
{
    public $start_date, $end_date, $name, $company, $content, $active = false, $last = false;

    public function render()
    {
        return view('livewire.elements.resume-item');
    }
}
