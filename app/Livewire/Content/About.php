<?php

namespace App\Livewire\Content;

use App\Livewire\BaseComponent;
use DateTime;
use Livewire\Component;

class About extends BaseComponent
{
    public $age, $gender, $dateOfBirth, $placeOfBirth, $nationality, $religion, $maritalStatus;

    public function mount()
    {
        $this->age = $this->calculateAge($this->personal['date_of_birth']); // Get age from date of birth;
        $this->gender = $this->personal['gender'];
        $this->dateOfBirth = $this->personal['date_of_birth'];
        $this->placeOfBirth = $this->personal['place_of_birth'];
        $this->nationality = $this->personal['nationality'];
        $this->religion = $this->personal['religion'];
        $this->maritalStatus = $this->personal['marital_status'];
    }

    public function calculateAge($birthday)
    {
        $birthday = new DateTime($birthday);
        $today = new DateTime('today');
        $age = $birthday->diff($today)->y;
        return $age;
    }

    public function render()
    {
        return view('livewire.content.about');
    }
}
