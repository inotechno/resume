<?php

namespace App\Filament\Resources;

use App\Filament\Imports\SkillImporter;
use App\Filament\Resources\SkillResource\Pages;
use App\Filament\Resources\SkillResource\RelationManagers;
use App\Models\Skill;

use Filament\Forms;
use Filament\Forms\Components\Grid;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\ImportAction;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Set;

class SkillResource extends Resource
{
    protected static ?string $model = Skill::class;

    protected static ?string $navigationIcon = 'heroicon-s-bookmark';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')->required()->live(onBlur: true)
                    ->afterStateUpdated(fn(Set $set, ?string $state) => $set('slug', str()->slug($state))),
                Forms\Components\Hidden::make('slug'),

                Forms\Components\Textarea::make('description'),

                Grid::make(3)->schema([
                    Forms\Components\TextInput::make('percentage')->numeric()->required()->step(1)->default(50)->label('Percentage'),
                    Forms\Components\ColorPicker::make('color')->required(),
                    Forms\Components\Select::make('type')
                        ->options([
                            'language' => 'Language',
                            'coding' => 'Coding',
                            'knowledge' => 'Knowledge',
                            'tool' => 'Tool',
                        ])
                        ->required(),
                ]),

                // Image Upload
                Forms\Components\FileUpload::make('icon_url')->directory('skills')->image()->label('Icon'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('icon_url')->circular()->label('Icon')->extraAttributes(fn($record) => [
                    'style' => "background-color: {$record->color}; padding: 5px; border-radius: 9999px;"
                ]),
                Tables\Columns\TextColumn::make('name')->searchable()->sortable(),
                Tables\Columns\TextColumn::make('description')->searchable()->sortable()->limit(50),
                Tables\Columns\TextColumn::make('percentage')->searchable()->sortable(),
                Tables\Columns\TextColumn::make('color')->searchable()->sortable(),
                Tables\Columns\TextColumn::make('type')->searchable()->sortable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])->headerActions([
                ImportAction::make()->importer(SkillImporter::class),
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
            'index' => Pages\ListSkills::route('/'),
            'create' => Pages\CreateSkill::route('/create'),
            'edit' => Pages\EditSkill::route('/{record}/edit'),
        ];
    }
}
