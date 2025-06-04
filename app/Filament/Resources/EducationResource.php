<?php

namespace App\Filament\Resources;

use App\Filament\Imports\EducationImporter;
use App\Filament\Resources\EducationResource\Pages;
use App\Filament\Resources\EducationResource\RelationManagers;
use App\Models\Education;
use Filament\Actions\Imports\Jobs\ImportCsv;
use Filament\Forms;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\Grid;
use Filament\Tables\Actions\ImportAction;

class EducationResource extends Resource
{
    protected static ?string $model = Education::class;

    protected static ?string $navigationIcon = 'heroicon-o-academic-cap';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Grid::make(3)->schema([
                    Forms\Components\TextInput::make('name')
                        ->required()
                        ->maxLength(255),
                    Forms\Components\Select::make('degree')
                        ->options([
                            'High School' => 'High School',
                            'Bachelor' => 'Bachelor',
                            'Master' => 'Master',
                            'PhD' => 'PhD',
                        ])
                        ->required(),
                    Forms\Components\TextInput::make('field_of_study')
                        ->required()
                        ->maxLength(255),
                ]),

                Grid::make(3)->schema([
                    Forms\Components\DatePicker::make('start_date')
                        ->required(),
                    Forms\Components\DatePicker::make('end_date')
                        ->required()->disabled(fn(callable $get) => $get('is_current')),
                    Forms\Components\TextInput::make('grade')
                        ->required()
                        ->maxLength(255)->disabled(fn(callable $get) => $get('is_current')),
                ])->columnSpan(3),

                Forms\Components\Toggle::make('is_current')
                    ->label('Current Education')
                    ->default(false)
                    ->reactive()
                    ->afterStateUpdated(fn(callable $set) => $set('end_date', null)),

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('degree')
                    ->searchable(),
                Tables\Columns\TextColumn::make('field_of_study')
                    ->searchable()
                    ->label('Field of Study'),
                Tables\Columns\TextColumn::make('start_date')
                    ->date()
                    ->sortable()
                    ->label('Start Date'),
                Tables\Columns\TextColumn::make('end_date')
                    ->date()
                    ->sortable()
                    ->label('End Date'),
                Tables\Columns\IconColumn::make('is_current')
                    ->label('Current')
                    ->boolean(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])->headerActions([
                    ImportAction::make()->importer(EducationImporter::class)->job(ImportCsv::class),
                ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListEducation::route('/'),
            'create' => Pages\CreateEducation::route('/create'),
            'edit' => Pages\EditEducation::route('/{record}/edit'),
        ];
    }
}
