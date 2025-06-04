<?php

namespace App\Livewire\Elements;

use Livewire\Component;

class Paragraph extends Component
{
    public $value;
    public $markup = false;
    public $style = '';
    public $class = '';

    public function render()
    {
        return view('livewire.elements.paragraph');
    }
}
