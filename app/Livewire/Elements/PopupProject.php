<?php

namespace App\Livewire\Elements;

use App\Models\Project;
use Livewire\Component;

class PopupProject extends Component
{
    public $projectId = null;
    public $project = null;

    // Listener untuk Livewire 3
    protected $listeners = ['showProject' => 'loadProject'];

    public function loadProject($projectId)
    {
        $this->projectId = $projectId;
        $this->project = Project::with('category')->find($projectId);

        // Dispatch event untuk membuka popup
        $this->dispatch('openPopup');
    }

    public function render()
    {
        return view('livewire.elements.popup-project');
    }
}
