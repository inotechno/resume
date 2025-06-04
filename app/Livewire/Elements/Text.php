<?php

namespace App\Livewire\Elements;

use Livewire\Component;

class Text extends Component
{
    public $value;
    public $strong = false;
    public $style = '';

    public function render()
    {
        return view('livewire.elements.text');
    }
}
