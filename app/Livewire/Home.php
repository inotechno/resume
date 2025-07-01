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

        // dd($this->favicon);
    }

    public function render()
    {
        // dd($this->personal);
        return view('livewire.home', [
            'favicon' => $this->personal['favicon'],
        ])->title('Resume | ' . $this->personal['name']);
    }
}
