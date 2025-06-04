<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            [
                'name' => 'Web Development',
                'slug' => 'web-development',
                'description' => 'Kategori Web Development',
                'icon_url' => 'https://i.ibb.co/1T11111/rahmat.jpg',
                'color' => '#fca61f'
            ],
            [
                'name' => 'Mobile Development',
                'slug' => 'mobile-development',
                'description' => 'Kategori Mobile Development',
                'icon_url' => 'https://i.ibb.co/1T11111/rahmat.jpg',
                'color' => '#fca61f'
            ],
            [
                'name' => 'Desktop Development',
                'slug' => 'desktop-development',
                'description' => 'Kategori Desktop Development',
                'icon_url' => 'https://i.ibb.co/1T11111/rahmat.jpg',
                'color' => '#fca61f'
            ],
        ];

        foreach ($categories as $category) {
            \App\Models\Category::create($category);
        }
    }
}
