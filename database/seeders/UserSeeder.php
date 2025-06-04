<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $administrator = User::create([
            'name' => 'Achmad Fatoni',
            'email' => '2ahmadfatoni0@gmail.com',
            'password' => bcrypt('Unbaja2016'),
            'email_verified_at' => now(),
        ]);
    }
}
