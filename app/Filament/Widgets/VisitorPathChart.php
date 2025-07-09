<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;
use Masoudi\Laravel\Visitors\Models\Visitor;

class VisitorPathChart extends ChartWidget
{
    protected static ?string $heading = 'Statistik Pengunjung per URL';
    protected int|string|array $columnSpan = 'full';
    protected static ?string $maxHeight = '300px';

    protected function getData(): array
    {
        // Ambil 5 path/url terbanyak dikunjungi
        $visits = Visitor::selectRaw('path, COUNT(*) as total')
            ->groupBy('path')
            ->limit(7)
            ->orderByDesc('total')
            ->get();

        $labels = $visits->map(function ($item) {
            $cleaned = preg_replace('#^(project/|redirect/)#', '', $item->path); // Hilangkan awalan
            return urldecode($cleaned); // Decode URL agar terbaca
        });

        return [
            'datasets' => [
                [
                    'label' => 'Jumlah Kunjungan',
                    'data' => $visits->pluck('total')->toArray(),
                    'backgroundColor' => ['#0ea5e9', '#10b981', '#f97316', '#6366f1', '#f43f5e', '#14b8a6', '#8b5cf6'],
                ],
            ],
            'labels' => $labels->toArray(),
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }
}
