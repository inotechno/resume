<?php

namespace App\Livewire;

use Livewire\Component;

class Portfolio extends Component
{
    public $categories;
    public $selectedCategory = 'all';
    public $projects;

    public function mount()
    {
        $this->categories = \App\Models\Category::all();
        $this->projects = \App\Models\Project::orderBy('order', 'asc')->get();
    }

    public function filterProjects($category)
    {
        if ($category === 'all') {
            $this->projects = \App\Models\Project::all();
        } else {
            $this->projects = \App\Models\Project::whereHas('category', function ($query) use ($category) {
                $query->where('slug', $category);
            })->get();
        }
    }

    public function render()
    {
        return view('livewire.portfolio');
    }
}
