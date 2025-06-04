<?php

namespace App\Livewire\Component;

use App\Livewire\BaseComponent;
use Livewire\Component;

class Social extends BaseComponent
{
    public $github, $twitter, $instagram, $facebook, $youtube, $telegram, $website, $linkedin;

    public function mount()
    {
        $this->github = $this->personal['github'];
        $this->twitter = $this->personal['twitter'];
        $this->instagram = $this->personal['instagram'];
        $this->facebook = $this->personal['facebook'];
        $this->youtube = $this->personal['youtube'];
        $this->telegram = $this->personal['telegram'];
        $this->website = $this->personal['website'];
        $this->linkedin = $this->personal['linkedin'];
    }

    public function render()
    {
        return view('livewire.component.social');
    }
}
