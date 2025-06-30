<?php

namespace App\Livewire\Content;

use App\Models\Message;
use Livewire\Component;

class ContactForm extends Component
{
    public $name;
    public $email;
    public $message;
    public $alertMessage;

    public function submitForm()
    {
        // Validate the form data
        $this->validate([
            'name' => 'required',
            'email' => 'required|email',
            'message' => 'required',
        ]);

        try {
            Message::create([
                'name' => $this->name,
                'email' => $this->email,
                'message' => $this->message,
            ]);

            $this->alertMessage = 'Your message has been sent successfully.';
            $this->dispatch('showAlert', message: 'Your message has been sent successfully.',);
        } catch (\Exception $e) {
            $this->alertMessage = 'Sorry, there was an error sending your message. Please try again later.';
            $this->dispatch('showAlert', message: 'Sorry, there was an error sending your message. Please try again later.',);
            return;
        }

        // Clear the form fields
        $this->name = '';
        $this->email = '';
        $this->message = '';
    }

    public function render()
    {
        return view('livewire.content.contact-form');
    }
}
