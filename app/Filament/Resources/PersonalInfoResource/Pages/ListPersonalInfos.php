<?php

namespace App\Filament\Resources\PersonalInfoResource\Pages;

use App\Filament\Resources\PersonalInfoResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListPersonalInfos extends ListRecords
{
    protected static string $resource = PersonalInfoResource::class;
    protected static ?string $title = 'Personal Info';

    protected function getHeaderActions(): array
    {
        return [
            // Actions\CreateAction::make(),
        ];
    }
}
