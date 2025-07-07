<?php

use App\Livewire\Home;
use App\Livewire\ProjectDetail;
use Illuminate\Support\Facades\Route;

Route::get('/', Home::class)->name('home');
Route::get('/project/{slug}', ProjectDetail::class)->name('project.detail');
