<?php

namespace App\Livewire;

use Livewire\Component;

class Banner extends BaseComponent
{
    public $name;
    public $titles;
    public $description;

    public $github;
    public $linkedin;
    public $twitter;
    public $instagram;
    public $facebook;

    public $image_url;

    public function mount()
    {
        $this->name = $this->personal['name'];
        $this->titles = explode('|', $this->personal['title']);
        $this->description = $this->personal['description'];
        $this->github = $this->personal['github'];
        $this->linkedin = $this->personal['linkedin'];
        $this->twitter = $this->personal['twitter'];
        $this->instagram = $this->personal['instagram'];
        $this->facebook = $this->personal['facebook'];
        $this->image_url = $this->personal['image_url'];

        // dd($this->image_url);
    }

    public function render()
    {
        return view('livewire.banner');
    }
}
