<?php
// routes/sitemap.php
use App\Http\Middleware\DisableLivewireScripts;
use Illuminate\Support\Facades\Route;
use App\Models\Project;
use Illuminate\Support\Carbon;
use Spatie\Sitemap\Sitemap;
use Spatie\Sitemap\Tags\Url;

Route::get('/sitemap.xml', function () {
    $sitemap = Sitemap::create();
    $projects = Project::all();

    // Tambahkan URL utama dengan priority dan changefreq
    $sitemap->add(
        Url::create(route('home'))
            ->setLastModificationDate(Carbon::now())
            ->setChangeFrequency(Url::CHANGE_FREQUENCY_WEEKLY)
            ->setPriority(1.0)
    );

    // Tambahkan URL project dengan metadata lengkap
    foreach ($projects as $project) {
        $sitemap->add(
            Url::create(route('project.detail', $project->slug))
                ->setLastModificationDate($project->updated_at)
                ->setChangeFrequency(Url::CHANGE_FREQUENCY_MONTHLY)
                ->setPriority(0.8)
        );
    }

    // Render sitemap dengan header yang benar
    $xmlContent = $sitemap->render();

    return response($xmlContent, 200, [
        'Content-Type' => 'application/xml; charset=utf-8',
        'Cache-Control' => 'public, max-age=3600',
    ]);
})->middleware('disable-livewire-scripts')->name('sitemap');

Route::get('/sitemap-externals.xml', function () {
    $sitemap = Sitemap::create();
    $projects = Project::all();

    foreach ($projects as $project) {
        if ($project->project_url) {
            $sitemap->add(
                Url::create($project->project_url)
                    ->setLastModificationDate($project->updated_at)
                    ->setChangeFrequency(Url::CHANGE_FREQUENCY_YEARLY)
                    ->setPriority(0.5)
            );
        }

        if ($project->github) {
            $sitemap->add(
                Url::create($project->github)
                    ->setLastModificationDate($project->updated_at)
                    ->setChangeFrequency(Url::CHANGE_FREQUENCY_YEARLY)
                    ->setPriority(0.3)
            );
        }
    }

    $xmlContent = $sitemap->render();

    return response($xmlContent, 200, [
        'Content-Type' => 'application/xml; charset=utf-8',
        'Cache-Control' => 'public, max-age=3600',
    ]);
})->middleware('disable-livewire-scripts')->name('sitemap.externals');

// routes/web.php - perbaikan loading sitemap
Route::get('/sitemap.xml', function () {
    $sitemap = Sitemap::create();
    $projects = Project::all();

    $sitemap->add(
        Url::create(url('/'))
            ->setLastModificationDate(Carbon::now())
            ->setChangeFrequency(Url::CHANGE_FREQUENCY_WEEKLY)
            ->setPriority(1.0)
    );

    foreach ($projects as $project) {
        $sitemap->add(
            Url::create(url('/project/' . $project->slug))
                ->setLastModificationDate($project->updated_at)
                ->setChangeFrequency(Url::CHANGE_FREQUENCY_MONTHLY)
                ->setPriority(0.8)
        );
    }

    return response($sitemap->render(), 200, [
        'Content-Type' => 'application/xml; charset=utf-8',
    ]);
})->middleware('disable-livewire-scripts')->name('sitemap');

// Jika ingin menggunakan sitemap index untuk multiple sitemaps
Route::get('/sitemap-index.xml', function () {
    $sitemapIndex = \Spatie\Sitemap\SitemapIndex::create();

    $sitemapIndex->add(url('/sitemap.xml'));
    $sitemapIndex->add(url('/sitemap-externals.xml'));

    return response($sitemapIndex->render(), 200, [
        'Content-Type' => 'application/xml; charset=utf-8',
    ]);
})->middleware('disable-livewire-scripts')->name('sitemap.index');
