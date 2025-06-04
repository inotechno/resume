<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ServiceResource\Pages;
use App\Filament\Resources\ServiceResource\RelationManagers;
use App\Models\Service;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Set;
use Filament\Forms\Components\Grid;

class ServiceResource extends Resource
{
    protected static ?string $model = Service::class;

    protected static ?string $navigationIcon = 'heroicon-m-qr-code';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')->required()->live(onBlur: true)->afterStateUpdated(fn (Set $set, ?string $state) => $set('slug', str()->slug($state)))->columnSpan(2),
                Forms\Components\Hidden::make('slug'),

                Grid::make(2)->schema([
                    FileUpload::make('image_url')->directory('services')->image()->label('Image')->columnSpan(1),
                    FileUpload::make('icon_url')->directory('services')->image()->label('Icon')->columnSpan(1),
                ]),

                Forms\Components\Textarea::make('description')->required()->columnSpan(2),
                Forms\Components\Textarea::make('description_excerpt')->required()->columnSpan(2),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('image_url')->circular()->label('Image'),
                Tables\Columns\ImageColumn::make('icon_url')->circular()->label('Icon'),

                Tables\Columns\TextColumn::make('name')->searchable()->sortable(),
                Tables\Columns\TextColumn::make('description_excerpt')->searchable()->sortable()->limit(50),
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
            'index' => Pages\ListServices::route('/'),
            'create' => Pages\CreateService::route('/create'),
            'edit' => Pages\EditService::route('/{record}/edit'),
        ];
    }
}
