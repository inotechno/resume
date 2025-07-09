<?php

namespace App\Filament\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Widgets\StatsOverviewWidget\Card;
use Masoudi\Laravel\Visitors\Models\Visitor;

class StatsVisitor extends BaseWidget
{
    protected function getStats(): array
    {
        return [
            Card::make('Total Visitor', Visitor::count()),

            Card::make('Hari Ini', Visitor::whereDate('created_at', today())->count()),

            Card::make('Minggu Ini', Visitor::whereBetween('created_at', [
                now()->startOfWeek(),
                now()->endOfWeek()
            ])->count()),
        ];
    }
}
