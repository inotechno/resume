<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ServiceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $services = [
            [
                "id" => 1,
                "slug" => "web-development",
                "name" => "Web Development",
                "description" =>
                    "As a Web Developer, I have experience building responsive and efficient websites and web applications. Using technologies such as HTML, CSS, JavaScript, and frameworks like Codeigniter, Next JS and Laravel, I help create digital solutions that meet business needs.",
                "description_excerpt" =>
                    "Building responsive and efficient websites using modern technologies like Codeigniter and Laravel.",
                "image_url" => "services/01JWAWFFGS1FK5EQAPJCV9DJF9.png",
                "icon_url" => "services/01JWAWFFHQ663JDHNEPMX96SPE.png",
                "created_at" => "2025-05-28 01:29:11",
                "updated_at" => "2025-06-02 07:09:49",
            ],
            [
                "id" => 2,
                "slug" => "graphic-designer",
                "name" => "Graphic Designer",
                "description" =>
                    "As a Graphic Designer, I am experienced in using Corel Draw and Photoshop to create visually appealing and effective designs. My expertise includes creating logos, brochures, posters, and other promotional materials that align with the client\'s identity and needs.",
                "description_excerpt" =>
                    "Creating compelling visual designs using Corel Draw and Photoshop for branding and promotional needs.",
                "image_url" => "services/01JWB2SZ0Z6PQRX8FVVCJQ6MJA.png",
                "icon_url" => "services/01JWB2SZ1347TQ2C12ZQ8E26GV.png",
                "created_at" => "2025-05-28 09:15:36",
                "updated_at" => "2025-06-02 07:10:10",
            ],
            [
                "id" => 3,
                "slug" => "network-technician",
                "name" => "Network Technician",
                "description" =>
                    "As a Network Technician, I specialize in setting up and maintaining LAN networks, router configuration, cable crimping, and computer installation. I focus on ensuring that the network runs smoothly, securely, and reliably, as well as performing troubleshooting and hardware maintenance.",
                "description_excerpt" =>
                    "Handling LAN setup, router configuration, and maintaining stable network connectivity.",
                "image_url" => "services/01JWB37R4E81207NQM6NJ0JY6R.png",
                "icon_url" => "services/01JWB37R4J8A4GT2WAZG8QGTPF.png",
                "created_at" => "2025-05-28 09:23:08",
                "updated_at" => "2025-06-02 07:10:22",
            ],
            [
                "id" => 4,
                "slug" => "system-analyst",
                "name" => "System Analyst",
                "description" =>
                    "As a System Analyst, I am skilled in analyzing and designing efficient information systems to meet business needs. I work with technical teams to identify user requirements and design appropriate technology solutions, as well as testing and implementing systems that align with the company’s objectives.",
                "description_excerpt" =>
                    "Analyzing business needs and designing efficient and purpose-driven information systems.",
                "image_url" => "services/01JWB3942N2N4D6TJQWMY99H90.png",
                "icon_url" => "services/01JWB3942R6C2E5WZ75EF31QRH.png",
                "created_at" => "2025-05-28 09:23:53",
                "updated_at" => "2025-06-02 07:10:32",
            ],
        ];


        foreach ($services as $service) {
            \App\Models\Service::create($service);
        }
    }
}
