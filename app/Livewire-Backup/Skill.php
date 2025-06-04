<?php

namespace App\Livewire;

use Livewire\Component;
use Livewire\WithPagination;

class Skill extends Component
{
    use WithPagination;

    protected $paginationTheme = 'bootstrap';
    public $perPage = 6;
    public $loadMore = true;

    public function loadMoreSkills()
    {
        $this->perPage += 6;

        if ($this->perPage >= \App\Models\Skill::count()) {
            $this->loadMore = false;
        }
    }

    public function render()
    {
        $skills = \App\Models\Skill::paginate($this->perPage);
        return view('livewire.skill', compact('skills'));
    }
}
