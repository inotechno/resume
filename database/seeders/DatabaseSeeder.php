<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Run SQL Query from database.sqlite.sql
        // $filePath = database_path('database.sqlite.sql');
        // DB::unprepared(file_get_contents($filePath));

        // User::factory(10)->create();

        // User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        $this->call([
            UserSeeder::class,
            CategorySeeder::class,
            PersonalInfoSeeder::class,
            ServiceSeeder::class,
            SkillSeeder::class,
            ProjectSeeder::class,
        ]);
    }
}
