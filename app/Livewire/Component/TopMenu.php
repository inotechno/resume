<?php

namespace App\Livewire\Component;

use Livewire\Component;

class TopMenu extends Component
{
    public $hidden = false;

    public function mount($hidden = false)
    {
        $this->hidden = $hidden;
    }

    public function render()
    {
        return view('livewire.component.top-menu');
    }
}
