<?php

use App\Models\Project;
use Illuminate\Support\Carbon;
use Illuminate\Http\Request;
use Spatie\Sitemap\Sitemap;
use Spatie\Sitemap\Tags\Url;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

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

    // Bersihkan namespace tambahan menggunakan DOMDocument
    $dom = new DOMDocument();
    $dom->preserveWhiteSpace = false;
    $dom->formatOutput = true;
    $dom->loadXML($xmlContent);

    // Ambil elemen root <urlset>
    $urlset = $dom->getElementsByTagName('urlset')->item(0);

    // Simpan hanya default namespace
    $urlset->removeAttributeNS('http://www.w3.org/1999/xhtml', 'xhtml');
    $urlset->removeAttributeNS('http://www.google.com/schemas/sitemap-image/1.1', 'image');
    $urlset->removeAttributeNS('http://www.google.com/schemas/sitemap-video/1.1', 'video');
    $urlset->removeAttributeNS('http://www.google.com/schemas/sitemap-news/0.9', 'news');

    // Hapus attribute xmlns selain yang utama
    $urlset->removeAttribute('xmlns:xhtml');
    $urlset->removeAttribute('xmlns:image');
    $urlset->removeAttribute('xmlns:video');
    $urlset->removeAttribute('xmlns:news');

    // Kembalikan sebagai response
    return response($dom->saveXML(), 200, [
        'Content-Type' => 'application/xml; charset=utf-8',
        'Cache-Control' => 'public, max-age=3600',
        'X-Robots-Tag' => 'index, follow',
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

    // Bersihkan namespace tambahan menggunakan DOMDocument
    $dom = new DOMDocument();
    $dom->preserveWhiteSpace = false;
    $dom->formatOutput = true;
    $dom->loadXML($xmlContent);

    // Ambil elemen root <urlset>
    $urlset = $dom->getElementsByTagName('urlset')->item(0);

    // Simpan hanya default namespace
    $urlset->removeAttributeNS('http://www.w3.org/1999/xhtml', 'xhtml');
    $urlset->removeAttributeNS('http://www.google.com/schemas/sitemap-image/1.1', 'image');
    $urlset->removeAttributeNS('http://www.google.com/schemas/sitemap-video/1.1', 'video');
    $urlset->removeAttributeNS('http://www.google.com/schemas/sitemap-news/0.9', 'news');

    // Hapus attribute xmlns selain yang utama
    $urlset->removeAttribute('xmlns:xhtml');
    $urlset->removeAttribute('xmlns:image');
    $urlset->removeAttribute('xmlns:video');
    $urlset->removeAttribute('xmlns:news');

    // Kembalikan sebagai response
    return response($dom->saveXML(), 200, [
        'Content-Type' => 'application/xml; charset=utf-8',
        'Cache-Control' => 'public, max-age=3600',
        'X-Robots-Tag' => 'index, follow',
    ]);
})->middleware('disable-livewire-scripts')->name('sitemap.externals');
