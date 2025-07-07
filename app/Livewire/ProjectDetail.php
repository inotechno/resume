<?php

namespace App\Livewire;

use Livewire\Component;

class ProjectDetail extends BaseComponent
{
    public $darkMode = true;
    public $colorNumber = 2;
    public $slug;

    public function mount($slug)
    {
        $this->darkMode = $this->personal['dark_mode'];
        $this->colorNumber = $this->personal['color_number'];
        $this->slug = $slug;

        // dd($this->favicon);
    }

    public function render()
    {
        // dd($this->personal);
        return view('livewire.project-detail', [
            'favicon' => $this->personal['favicon'],
        ])->title('Detail | ' . $this->personal['name']);
    }
}
