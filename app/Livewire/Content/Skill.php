<?php

namespace App\Livewire\Content;

use Livewire\Component;
use Livewire\WithPagination;

class Skill extends Component
{
    public function render()
    {
        // Ambil semua skill dengan satu query
        $allSkills = \App\Models\Skill::whereIn('type', ['coding', 'language', 'knowledge', 'tool'])->get();

        // Kelompokkan berdasarkan tipe
        $codingSkills = $allSkills->where('type', 'coding');
        $languageSkills = $allSkills->where('type', 'language');
        $knowledgeSkills = $allSkills->where('type', 'knowledge');
        $toolSkills = $allSkills->where('type', 'tool');

        return view('livewire.content.skill', compact('codingSkills', 'languageSkills', 'knowledgeSkills', 'toolSkills'));
    }
}

