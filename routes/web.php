<?php

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

Route::get('/sitemap.xml', function () {
    $sitemap = Sitemap::create();
    $projects = Project::all();

    $sitemap->add(Url::create(route('home')));

    foreach ($projects as $project) {
        $sitemap->add(
            Url::create(route('project.detail', $project->slug))
                ->setLastModificationDate($project->updated_at)
        );
    }

    return response($sitemap->render(), 200, [
        'Content-Type' => 'application/xml',
    ]);
});

Route::get('/sitemap-externals.xml', function () {
    $sitemap = Sitemap::create();
    $projects = Project::all();

    foreach ($projects as $project) {
        if ($project->project_url) {
            $sitemap->add(Url::create($project->project_url));
        }

        if ($project->github) {
            $sitemap->add(Url::create($project->github));
        }
    }

    return response($sitemap->render(), 200, [
        'Content-Type' => 'application/xml',
    ]);
});

