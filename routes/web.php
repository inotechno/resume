<?php

use App\Livewire\Home;
use App\Livewire\ProjectDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Masoudi\Laravel\Visitors\LaravelVisitor;

Route::get('/', Home::class)->name('home');
Route::get('/project/{slug}', ProjectDetail::class)->name('project.detail');
Route::get('/redirect/{encode_url}', function ($encode_url) {
    $decode_url = urldecode($encode_url);

    request()->visit();
    return redirect()->away($decode_url);
})->where('encode_url', '.*')->name('redirect');
