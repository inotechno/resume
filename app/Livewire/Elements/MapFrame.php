<?php

namespace App\Livewire\Elements;

use App\Livewire\BaseComponent;
use Livewire\Component;

class MapFrame extends BaseComponent
{
    public $map, $style;

    public function mount()
    {
        $this->map = $this->personal['map'];
    }

    public function render()
    {
        return view('livewire.elements.map-frame');
    }
}
