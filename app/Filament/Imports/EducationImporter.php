<?php

namespace App\Filament\Imports;

use App\Models\Education;
use Filament\Actions\Imports\ImportColumn;
use Filament\Actions\Imports\Importer;
use Filament\Actions\Imports\Models\Import;

class EducationImporter extends Importer
{
    protected static ?string $model = Education::class;

    public static function getColumns(): array
    {
        return [
            ImportColumn::make('name')
                ->rules(['max:255']),
            ImportColumn::make('degree')
                ->rules(['max:255']),
            ImportColumn::make('field_of_study')
                ->rules(['max:255']),
            ImportColumn::make('start_date')
                ->rules(['date']),
            ImportColumn::make('end_date')
                ->rules(['date']),
            ImportColumn::make('grade'),
            ImportColumn::make('is_current')
        ];
    }

    public function resolveRecord(): ?Education
    {
        return Education::firstOrNew([
            'name' => $this->data['name'],
            'degree' => $this->data['degree'],
            'field_of_study' => $this->data['field_of_study'],
            'start_date' => $this->data['start_date'],
            'end_date' => $this->data['end_date'],
            'grade' => $this->data['grade'],
            'is_current' => $this->data['is_current'],
        ]);
    }

    public static function mutateBeforeCreate(array $data): array
    {
        $data['is_current'] = false;
        $data['grade'] = null;

        if (isset($data['start_date'])) {
            $data['start_date'] = date('Y-m-d', strtotime($data['start_date']));
        }

        if (isset($data['end_date'])) {
            $data['end_date'] = date('Y-m-d', strtotime($data['end_date']));
        }

        if (isset($data['is_current'])) {
            $data['is_current'] = filter_var($data['is_current'], FILTER_VALIDATE_BOOLEAN);
        }

        if (isset($data['grade']) && $data['grade'] !== null) {
            $data['grade'] = (float) $data['grade'];
        }

        return $data;
    }

    public static function getCompletedNotificationBody(Import $import): string
    {
        $body = 'Your education import has completed and ' . number_format($import->successful_rows) . ' ' . str('row')->plural($import->successful_rows) . ' imported.';

        if ($failedRowsCount = $import->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to import.';
        }

        return $body;
    }


}
