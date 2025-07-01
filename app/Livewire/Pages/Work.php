<?php

namespace App\Livewire\Pages;

use Livewire\Component;
use App\Models\Project;
use App\Models\Category;

class Work extends Component
{
    public $categories;
    public $projects;
    public $selectedProject = null;

    public function mount()
    {
        $this->categories = Category::all();
        $this->projects = Project::with('category')->orderBy('order')->get();
    }

    public function render()
    {
        return view('livewire.pages.work');
    }
}

