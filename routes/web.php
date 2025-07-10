<?php

use App\Http\Middleware\DisableLivewireScripts;
use App\Livewire\Home;
use App\Livewire\ProjectDetail;
use App\Models\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Masoudi\Laravel\Visitors\LaravelVisitor;
use Spatie\Sitemap\Sitemap;
use Spatie\Sitemap\Tags\Url;
use Illuminate\Support\Carbon;

Route::get('/', Home::class)->name('home');
Route::get('/project/{slug}', ProjectDetail::class)->name('project.detail');
Route::get('/redirect/{encode_url}', function ($encode_url) {
    $decode_url = urldecode($encode_url);

    request()->visit();
    return redirect()->away($decode_url);
})->where('encode_url', '.*')->name('redirect');

if (request()->is('sitemap.xml')) {
    require base_path('routes/sitemap.php');
}



