# Pengaduan Masyarakat

Aplikasi web pengaduan masyarakat berbasis CodeIgniter 3.1.10, MySQL/MariaDB,
dan Docker. Peran: masyarakat (kirim pengaduan), petugas, dan admin.

## Kebutuhan
- Docker Desktop (sudah termasuk Docker Compose)
- Git

## Menjalankan
1. Clone repo:
   ```
   git clone https://github.com/Syahfrianss/ci-pengaduan-masyarakat.git
   cd ci-pengaduan-masyarakat
   ```
2. Jalankan:
   ```
   docker compose up -d --build
   ```
   Run pertama butuh beberapa menit (mengunduh image dan mengimpor database).
3. Buka:
   - Aplikasi: http://localhost:8080
   - phpMyAdmin: http://localhost:8081

## Login phpMyAdmin (khusus lokal)
| User | Password |
|---|---|
| root | root |
| pengaduan | pengaduan |

## Login aplikasi
- Masyarakat: http://localhost:8080/index.php/Auth/LoginController
- Petugas/admin: http://localhost:8080/index.php/Auth/LoginPetugasController

(Isi dengan akun yang tersedia.)

## Perintah berguna
| Perintah | Fungsi |
|---|---|
| `docker compose logs -f web` | Lihat log Apache/PHP |
| `docker compose stop` | Matikan container |
| `docker compose down` | Hapus container, data database tetap |
| `docker compose down -v` | Hapus container dan data database |

## Catatan
- File `pengaduan_masyarakat_ci.sql` diimpor otomatis hanya saat volume database masih kosong.
- Jika port 8080/8081 terpakai, ubah angka kiri di `ports` pada `docker-compose.yml`,
  dan sesuaikan `APP_BASE_URL`.
- Password di `docker-compose.yml` hanya untuk pengembangan lokal. Jangan dipakai di server publik.


# Login Akun
Admin\
Username : admin\
Pass : 123456

Petugas\
Username : petugas\
Pass : 123456

Masyarakat\
Username : masyarakat\
Pass : 123456
