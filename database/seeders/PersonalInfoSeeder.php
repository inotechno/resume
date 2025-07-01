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
                "id" => "1",
                "key" => "name",
                "value" => "Achmad Fatoni",
            ],
            [
                "id" => "2",
                "key" => "title",
                "value" => "Web Developer|IT Support|System Analyst|Network Engineer",
            ],
            [
                "id" => "3",
                "key" => "description",
                "value" => "Experienced Web Programmer with expertise in system analysis, design,<br> and maintenance. Proven experience as an IT Support Technician, Tax Accountant, and Computer Teacher. Excellent skills in programming, network security, and hardware management.",
            ],
            [
                "id" => "4",
                "key" => "image_url",
                "value" => "http:\/\/localhost:8000\/images\/136di_GBAL7BuncZHMiS2AmeHYbf1NGv1.png",
            ],
            [
                "id" => "5",
                "key" => "linkedin",
                "value" => "https:\/\/www.linkedin.com\/in\/2ahmadfatoni0\/",
            ],
            [
                "id" => "6",
                "key" => "github",
                "value" => "https:\/\/github.com\/inotechno",
            ],
            [
                "id" => "7",
                "key" => "twitter",
                "value" => "null",
            ],
            [
                "id" => "8",
                "key" => "instagram",
                "value" => "https:\/\/www.instagram.com\/20ahmadfatoni08\/",
            ],
            [
                "id" => "9",
                "key" => "facebook",
                "value" => "null",
            ],
            [
                "id" => "10",
                "key" => "youtube",
                "value" => "null",
            ],
            [
                "id" => "11",
                "key" => "whatsapp",
                "value" => "https:\/\/api.whatsapp.com\/send?phone=6289676490971",
            ],
            [
                "id" => "12",
                "key" => "telegram",
                "value" => "null",
            ],
            [
                "id" => "13",
                "key" => "website",
                "value" => "https:\/\/inotechno.my.id",
            ],
            [
                "id" => "14",
                "key" => "gender",
                "value" => "Male",
            ],
            [
                "id" => "15",
                "key" => "date_of_birth",
                "value" => "1997-08-20",
            ],
            [
                "id" => "16",
                "key" => "place_of_birth",
                "value" => "Serang, Indonesia",
            ],
            [
                "id" => "17",
                "key" => "nationality",
                "value" => "Indonesian",
            ],
            [
                "id" => "18",
                "key" => "religion",
                "value" => "Islam",
            ],
            [
                "id" => "19",
                "key" => "marital_status",
                "value" => "Married",
            ],
            [
                "id" => "20",
                "key" => "color_number",
                "value" => "2",
            ],
            [
                "id" => "21",
                "key" => "dark_mode",
                "value" => "true",
            ],
            [
                "id" => "22",
                "key" => "map",
                "value" => '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3966.748235347556!2d106.15830717478248!3d-6.164461660413638!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e4221ee93ddacdd%3A0xeed0680f1c5f23d0!2sUnicorn%20Gift%20(Toko%20Buket%2FSouvenir)!5e0!3m2!1sid!2sid!4v1749540211532!5m2!1sid!2sid" width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>',
            ],
            [
                "id" => "23",
                "key" => "phone",
                "value" => "6289676490971",
            ],
            [
                "id" => "24",
                "key" => "email",
                "value" => "2ahmadfatoni0@gmail.com",
            ],
            [
                "id" => "25",
                "key" => "favicon",
                "value" => "https://avatars.githubusercontent.com/u/151206616?s=400&u=131827919fe384485ea156c87098d3d02228a118&v=4",
            ]
        ];


        foreach ($personalInfos as $personalInfo) {
            \App\Models\PersonalInfo::updateOrCreate(['key' => $personalInfo['key']], $personalInfo);
        }
    }
}
