<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ExperienceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $experiences = [
            [
                "id" => 1,
                "position" => "Staff Administrator",
                "company" => "PT. Sinar Sumur Menjangan",
                "content" => "<p><strong>Membuat </strong>Dokumen Penawaran Proyek.</p><p><strong>Menyiapkan </strong>dokumen yang dibutuhkan perpajakan.</p><p><strong>Membuat </strong>desain kartu nama.</p>",
                "start_date" => "2016-12-01",
                "end_date" => "2017-12-01",
                "is_current" => false,
                "created_at" => "2025-06-03 17:23:47",
                "updated_at" => "2025-06-03 18:07:56",
            ],
            [
                "id" => 2,
                "position" => "Kepala Labotaratorium & Guru",
                "company" => "Sekolah Arrahman Cidadap",
                "content" => "<p><strong>Instalasi</strong>, pemeliharaan, dan konfigurasi perangkat keras dan perangkat lunak komputer sesuai dengan kebutuhan TKJ.</p><p><strong>Pemeliharaan </strong>rutin dan perbaikan masalah pada sistem komputer.</p><p><strong>Pengembangan </strong>kurikulum pembelajaran TKJ yang relevan dengan perkembangan industri.</p><p><strong>Mengajar </strong>mata pelajaran seperti pemrograman, jaringan komputer, dan keamanan informasi.</p><p><strong>Manajemen </strong>inventaris perangkat keras dan perangkat lunak laboratorium.&nbsp;</p><p><strong>Koordinasi </strong>dengan staf sekolah dan supplier teknologi terkait.</p>",
                "start_date" => "2019-01-01",
                "end_date" => "2020-01-01",
                "is_current" => false,
                "created_at" => "2025-06-03 17:23:48",
                "updated_at" => "2025-06-03 18:08:13",
            ],
            [
                "id" => 3,
                "position" => "Staff Tax Accounting",
                "company" => "PT. Fajar Pangan Lestari",
                "content" => "<p><strong>Pencatatan </strong>transaksi perusahaan secara akurat dan terperinci.</p><p><strong>Perhitungan </strong>Pajak Pertambahan Nilai (PPN) sesuai dengan ketentuan yang berlaku.</p><p><strong>Pengelolaan </strong>dan penyimpanan berkas pajak perusahaan dengan teratur dan sesuai regulasi.</p><p><strong>Pelaporan </strong>Pajak PPN Bulanan dan PPH Tahunan</p>",
                "start_date" => "2020-04-01",
                "end_date" => "2021-08-01",
                "is_current" => false,
                "created_at" => "2025-06-03 17:23:48",
                "updated_at" => "2025-06-03 18:14:07",
            ],
            [
                "id" => 4,
                "position" => "IT Support Technician",
                "company" => "PT. Indo Prima Perkasa",
                "content" => "<p><strong>Instalasi</strong> dan konfigurasi jaringan LAN untuk koneksi internet yang stabil.</p><p><strong>Pengelolaan </strong>dan pemeliharaan jaringan LAN untuk memastikan kinerja optimal.</p><p><strong>Melakukan </strong>pemeliharaan rutin dan perbaikan masalah pada jaringan.</p><p><strong>Pemeliharaan </strong>perangkat keras (hardware) untuk memastikan fungsi yang optimal.</p><p><strong>Pengelolaan </strong>sistem fingerprint untuk keperluan keamanan dan manajemen akses.</p>",
                "start_date" => "2021-10-01",
                "end_date" => "2021-12-01",
                "is_current" => false,
                "created_at" => "2025-06-03 17:23:48",
                "updated_at" => "2025-06-03 18:14:14",
            ],
            [
                "id" => 5,
                "position" => "Web Programmer",
                "company" => "PT. Trimitra Putra Mandiri",
                "content" => "<p><strong>Menganalisis </strong>kebutuhan sistem untuk merancang solusi yang sesuai.</p><p><strong>Membuat </strong>alur sistem yang terstruktur dan efisien.</p><p><strong>Mendesain </strong>database untuk mendukung fungsionalitas sistem secara optimal.</p><p><strong>Mengembangkan </strong>dan mengkodekan aplikasi web dengan menggunakan berbagai bahasa pemrograman dan teknologi yang relevan.</p><p><strong>Melakukan </strong>pemeliharaan rutin dan perbaikan pada aplikasi web untuk memastikan kinerja yang optimal.</p><p><strong>Deploy</strong> Aplikasi ke Server VPS menggunakan Sistem Operasi Linux</p>",
                "start_date" => "2022-02-01",
                "end_date" => null,
                "is_current" => true,
                "created_at" => "2025-06-03 17:23:48",
                "updated_at" => "2025-06-03 18:07:34",
            ],
        ];

        foreach ($experiences as $experience) {
            \App\Models\Experience::create($experience);
        }
    }
}
