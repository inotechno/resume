<?php

namespace App\Filament\Resources;

use App\Filament\Imports\ProjectImporter;
use App\Filament\Resources\ProjectResource\Pages;
use App\Filament\Resources\ProjectResource\RelationManagers;
use App\Models\Project;
use Closure;
use Filament\Forms;
use Filament\Forms\Components\Grid;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Set;
use Filament\Tables\Actions\ImportAction;

class ProjectResource extends Resource
{
    protected static ?string $model = Project::class;

    protected static ?string $navigationIcon = 'heroicon-s-rectangle-group';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Grid::make(3)->schema([

                    Forms\Components\TextInput::make('title')->required()->live(onBlur: true)->afterStateUpdated(fn(Set $set, ?string $state) => $set('slug', str()->slug($state))),
                    Forms\Components\Hidden::make('slug'),

                    Forms\Components\Select::make('category_id')
                        ->relationship('category', 'name')
                        ->required(),

                    Forms\Components\TextInput::make('order')->numeric()->required()->step(1)->default(0),
                ]),

                // Upload Image with thumbnail from image
                FileUpload::make('image_url')->directory('projects')->image()->label('Image'),

                FileUpload::make('thumbnail')->directory('projects')
                    ->image()
                    ->label('Thumbnail')
                    ->required()
                    ->imageEditor()
                    ->imageEditorAspectRatios([
                        '16:9',
                        '4:3',
                        '1:1',
                        '3:4',
                        '9:16',
                    ]),

                Grid::make(3)->schema([
                    Forms\Components\TextInput::make('project_url'),
                    Forms\Components\TextInput::make('github'),
                    Forms\Components\TagsInput::make('tags'),
                ]),

                Forms\Components\RichEditor::make('description_excerpt')->required()->columnSpan('full')->label('Description Excerpt'),
                Forms\Components\RichEditor::make('description')->columnSpan('full')->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                // Image Column
                Tables\Columns\ImageColumn::make('image_url')->circular()->label('Image'),
                Tables\Columns\TextColumn::make('title')->searchable()->sortable(),
                Tables\Columns\TextColumn::make('category.name')->searchable()->sortable(),
                Tables\Columns\TextColumn::make('description_excerpt')->searchable()->html()->limit(50),
                Tables\Columns\IconColumn::make('project_url')
                    ->label('Project')
                    ->url(fn($state, $record) => $record->project_url)
                    ->icon('heroicon-s-link')
                    ->color('primary')
                    ->size('sm'),

                Tables\Columns\IconColumn::make('github')
                    ->label('Github')
                    ->url(fn($state, $record) => $record->github)
                    ->icon('heroicon-s-link')
                    ->color('primary dark')
                    ->size('sm'),

                Tables\Columns\TextInputColumn::make('order')->width('0.5%')->sortable()->rules(['numeric', 'min:0']),
            ])
            ->defaultSort('order')
            ->filters([
                Tables\Filters\SelectFilter::make('category')
                    ->relationship('category', 'name'),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])
            ->headerActions([
                ImportAction::make()->importer(ProjectImporter::class),
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
            'index' => Pages\ListProjects::route('/'),
            'create' => Pages\CreateProject::route('/create'),
            'edit' => Pages\EditProject::route('/{record}/edit'),
        ];
    }
}
