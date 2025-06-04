<?php

namespace App\Livewire;

use Livewire\Component;

class Home extends BaseComponent
{
    public function render()
    {
        // dd($this->personal);
        return view('livewire.home')->title('Resume | ' . $this->personal['name']);
    }
}
