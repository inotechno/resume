<?php

namespace App\Livewire\Pages;

use App\Livewire\BaseComponent;
use Livewire\Component;

class Contact extends BaseComponent
{
    public $address = '123 Main St, Anytown, USA';
    public $email = 'info@example.com';
    public $phone = '(123) 456-7890';
    public $whatsapp = '(123) 456-7890';

    public function mount()
    {
        $this->address = $this->personal['place_of_birth'];
        $this->email = $this->personal['email'];
        $this->phone = $this->personal['phone'];
        $this->whatsapp = $this->personal['whatsapp'];
    }

    public function render()
    {
        return view('livewire.pages.contact');
    }
}
