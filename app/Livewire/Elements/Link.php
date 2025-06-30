<?php

namespace App\Livewire\Elements;

use Livewire\Component;

class Link extends Component
{

    public $href;
    public $target = '_blank';
    public $value;
    public $style = '';

    public function render()
    {
        return view('livewire.elements.link');
    }
}
