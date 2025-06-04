<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PersonalInfoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $personalInfos = [
            [
                "id" => 1,
                "key" => "name",
                "value" => "Achmad Fatoni",
                "created_at" => "2025-05-28 01:29:09",
                "updated_at" => "2025-05-28 01:29:09",
            ],
            [
                "id" => 2,
                "key" => "title",
                "value" => "Web Developer|IT Support|System Analyst|Network Engineer",
                "created_at" => "2025-05-28 01:29:09",
                "updated_at" => "2025-06-02 06:47:10",
            ],
            [
                "id" => 3,
                "key" => "description",
                "value" =>
                    "Experienced Web Programmer with expertise in system analysis, design,<br> and maintenance. Proven experience as an IT Support Technician, Tax Accountant, and Computer Teacher. Excellent skills in programming, network security, and hardware management.",
                "created_at" => "2025-06-02 07:01:13",
                "updated_at" =>"2025-06-02 07:01:13"
            ],
            [
                "id" => 4,
                "key" => "image_url",
                "value" =>
                    "http://localhost:8000/image/136di_GBAL7BuncZHMiS2AmeHYbf1NGv2.png",
                "created_at" => "2025-05-28 01:29:09",
                "updated_at" => "2025-06-03 01:52:30",
            ],
            [
                "id" => 5,
                "key" => "linkedin",
                "value" => "https://www.linkedin.com/in/2ahmadfatoni0/",
                "created_at" => "2025-05-28 01:29:09",
                "updated_at" => "2025-05-28 01:29:09",
            ],
            [
                "id" => 6,
                "key" => "github",
                "value" => "https://github.com/inotechno",
                "created_at" => "2025-05-28 01:29:09",
                "updated_at" => "2025-05-28 01:29:09",
            ],
            [
                "id" => 7,
                "key" => "twitter",
                "value" => null,
                "created_at" => "2025-05-28 01:29:09",
                "updated_at" => "2025-05-28 01:29:09",
            ],
            [
                "id" => 8,
                "key" => "instagram",
                "value" => "https://www.instagram.com/20ahmadfatoni08/",
                "created_at" => "2025-05-28 01:29:10",
                "updated_at" => "2025-05-28 01:29:10",
            ],
            [
                "id" => 9,
                "key" => "facebook",
                "value" => null,
                "created_at" => "2025-05-28 01:29:10",
                "updated_at" => "2025-05-28 01:29:10",
            ],
            [
                "id" => 10,
                "key" => "youtube",
                "value" => null,
                "created_at" => "2025-05-28 01:29:10",
                "updated_at" => "2025-05-28 01:29:10",
            ],
            [
                "id" => 11,
                "key" => "whatsapp",
                "value" => "https://api.whatsapp.com/send?phone=6289676490971",
                "created_at" => "2025-05-28 01:29:10",
                "updated_at" => "2025-05-28 01:29:10",
            ],
            [
                "id" => 12,
                "key" => "telegram",
                "value" => null,
                "created_at" => "2025-05-28 01:29:10",
                "updated_at" => "2025-05-28 01:29:10",
            ],
            [
                "id" => 13,
                "key" => "website",
                "value" => "https://inotechno.my.id",
                "created_at" => "2025-05-28 01:29:10",
                "updated_at" => "2025-05-28 01:29:10",
            ],
            [
                "id" => 14,
                "key" => "gender",
                "value" => "male",
                "created_at" => "2025-05-28 01:29:10",
                "updated_at" => "2025-05-28 01:29:10",
            ],
            [
                "id" => 15,
                "key" => "date_of_birth",
                "value" => "1997-08-20",
                "created_at" => "2025-05-28 01:29:10",
                "updated_at" => "2025-05-28 01:29:10",
            ],
            [
                "id" => 16,
                "key" => "place_of_birth",
                "value" => "Serang, Indonesia",
                "created_at" => "2025-05-28 01:29:10",
                "updated_at" => "2025-05-28 01:29:10",
            ],
            [
                "id" => 17,
                "key" => "nationality",
                "value" => "Indonesian",
                "created_at" => "2025-05-28 01:29:10",
                "updated_at" => "2025-05-28 01:29:10",
            ],
            [
                "id" => 18,
                "key" => "religion",
                "value" => "Islam",
                "created_at" => "2025-05-28 01:29:10",
                "updated_at" => "2025-05-28 01:29:10",
            ],
            [
                "id" => 19,
                "key" => "marital_status",
                "value" => "Married",
                "created_at" => "2025-05-28 01:29:11",
                "updated_at" => "2025-05-28 01:29:11",
            ],
        ];


        foreach ($personalInfos as $personalInfo) {
            \App\Models\PersonalInfo::updateOrCreate(['key' => $personalInfo['key']], $personalInfo);
        }
    }
}
