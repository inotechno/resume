<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class DisableLivewireScripts
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        config(['livewire.inject_assets' => false]);
        config(['livewire.inject_morph_markers' => false]);

        $response = $next($request);

        // Pastikan tidak ada script yang ter-inject
        if ($response->headers->get('content-type') === 'application/xml; charset=utf-8') {
            $content = $response->getContent();
            $content = preg_replace('/<script[^>]*>.*?<\/script>/is', '', $content);
            $content = preg_replace('/<script[^>]*\/>/is', '', $content);
            $response->setContent($content);
        }

        return $response;
    }
}
