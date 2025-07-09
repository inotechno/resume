<?php

namespace App\Livewire\Pages;

use App\Livewire\BaseComponent;
use App\Models\Project;
use Livewire\Component;

class ProjectDetail extends BaseComponent
{
    public $slug;
    public $name;
    public $nextProject;
    public $prevProject;

    public function mount($slug)
    {
        $this->name = $this->personal['name'];
        $this->slug = $slug;
    }

    public function render()
    {
        $project = Project::with('category')->where('slug', $this->slug)->first();
        $project->visit();

        $projects = Project::with('category')->where('slug', '!=', $this->slug)->get();
        $this->nextProject = $projects->where('order', '>', $project->order)->first();
        $this->prevProject = $projects->where('order', '<', $project->order)->last();

        return view('livewire.pages.project-detail', [
            'project' => $project
        ]);
    }
}
