<?php

namespace App\Livewire\Component;

use App\Models\Resume;
use Livewire\Component;

class Buttons extends Component
{
    public $cv, $contact_me;

    public function mount()
    {
        $resumes = Resume::latest()->first();

        $this->cv = $resumes->file_path;
        $this->contact_me = 'https://wa.me/6289676490971';
    }

    public function render()
    {
        return view('livewire.component.buttons');
    }
}
