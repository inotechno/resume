<?php

namespace App\Livewire;

use Livewire\Component;

class Home extends BaseComponent
{
    public $darkMode = true;
    public $colorNumber = 2;

    public function mount()
    {
        $this->darkMode = $this->personal['dark_mode'];
        $this->colorNumber = $this->personal['color_number'];
    }

    public function render()
    {
        // dd($this->personal);
        return view('livewire.home')->title('Resume | ' . $this->personal['name']);
    }
}
