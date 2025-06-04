<?php

namespace App\Filament\Imports;

use App\Models\Experience;
use Filament\Actions\Imports\ImportColumn;
use Filament\Actions\Imports\Importer;
use Filament\Actions\Imports\Models\Import;

class ExperienceImporter extends Importer
{
    protected static ?string $model = Experience::class;

    public static function getColumns(): array
    {
        return [
            ImportColumn::make('position')
                ->rules(['max:255']),
            ImportColumn::make('company')
                ->rules(['max:255']),
            ImportColumn::make('content')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('start_date')
                ->rules(['date']),
            ImportColumn::make('end_date')
                ->rules(['date']),
            ImportColumn::make('is_current')
                ->requiredMapping()
                ->boolean()
                ->rules(['required', 'boolean']),
        ];
    }

    public function resolveRecord(): ?Experience
    {
        // return Experience::firstOrNew([
        //     // Update existing records, matching them by `$this->data['column_name']`
        //     'email' => $this->data['email'],
        // ]);

        return new Experience();
    }

    public static function getCompletedNotificationBody(Import $import): string
    {
        $body = 'Your experience import has completed and ' . number_format($import->successful_rows) . ' ' . str('row')->plural($import->successful_rows) . ' imported.';

        if ($failedRowsCount = $import->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to import.';
        }

        return $body;
    }
}
