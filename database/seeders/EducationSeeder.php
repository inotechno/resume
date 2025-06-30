<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class EducationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $educations = [
            [
                "id" => 1,
                "name" => "SMK YP Fatahillah 1 KWT",
                "degree" => "High School",
                "field_of_study" => "Teknik Instalasi Listrik",
                "start_date" => "2013-06-01",
                "end_date" => "2015-07-30",
                "grade" => null,
                "is_current" => false,
                "created_at" => "2025-06-04 07:05:00",
                "updated_at" => "2025-06-04 07:05:00",
            ],
            [
                "id" => 2,
                "name" => "Universitas Banten Jaya",
                "degree" => "Bachelor",
                "field_of_study" => "Teknik Informatika",
                "start_date" => "2016-06-01",
                "end_date" => "2021-07-01",
                "grade" => 3.25,
                "is_current" => false,
                "created_at" => "2025-06-04 07:05:00",
                "updated_at" => "2025-06-04 07:05:00",
            ],
        ];

        foreach ($educations as $education) {
            \App\Models\Education::create($education);
        }
    }
}
