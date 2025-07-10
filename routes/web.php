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
    $sitemap = Sitemap::create()
        ->add(Url::create(route('home'))->setLastModificationDate(Carbon::now()));

    $projects = Project::all();

    foreach ($projects as $project) {
        // Link detail project (dari route)
        $sitemap->add(
            Url::create(route('project.detail', $project->slug))
                ->setLastModificationDate($project->updated_at ?? Carbon::now())
        );

        // Link project_url (eksternal)
        if ($project->project_url) {
            $sitemap->add(
                Url::create($project->project_url)
                    ->setLastModificationDate($project->updated_at ?? Carbon::now())
            );
        }

        // Link github_url (eksternal)
        if ($project->github_url) {
            $sitemap->add(
                Url::create($project->github_url)
                    ->setLastModificationDate($project->updated_at ?? Carbon::now())
            );
        }
    }

    return $sitemap->toResponse(request());
});
