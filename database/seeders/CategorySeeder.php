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
                'name' => 'Web Apps',
                'slug' => 'web-apps',
                'description' => 'Kategori Web Development',
                'icon_url' => 'https://i.ibb.co/1T11111/rahmat.jpg',
                'color' => '#fca61f'
            ],
            [
                'name' => 'Graphic Design',
                'slug' => 'graphic-design',
                'description' => 'Kategori Graphic Design',
                'icon_url' => 'https://i.ibb.co/1T11111/rahmat.jpg',
                'color' => '#fca61f'
            ],
        ];

        foreach ($categories as $category) {
            \App\Models\Category::create($category);
        }
    }
}
