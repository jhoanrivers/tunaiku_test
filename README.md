# Registration_app

- Untuk menyelesaikan test mobile developer Tunaiku
- Menggunakan framework Flutter (pengembangan mobile app) dan menggunakan arsitektur BLOC

## Keterangan code

1. Kode program terdiri dari 5 folder yaitu :
- apiClient
- BLOC
- Model
- Utils
- View

1. ApiClient
Pada folder API client terdiri dari 2 file, yaitu api_client dan repository. 
Api_client berisi fungsi-fungi yang mengolah API, dan repository berisi method untuk memanggil API.
Tujuan dibuatnya repository adalah untuk memperrapi struktur codenya. Daripada langsung memanggil class Api, lebih baik dibuat class untuk memanggil setiap fungsinya.

2. BLOC

Pada folder bloc berisi 6 file, yaitu:
alamat_ktp_bloc, alamat_ktp_event,alamat_ktp_state, data_diri_bloc,data_diri_state, dan data_diri_event.
alamat_ktp_bloc, alamat_ktp_event,alamat_ktp_state adalah file yang mengontrol stream data dari alamat_ktp_form (folder view)
data_diri_bloc,data_diri_state, dan data_diri_event adalah file yang mengontrol stream data dari data_diri_form

3. Model
berisi class ApiResultModel dan Semua Provinsi,
Karena response API berisi objec dan array, jadi agar lebih rapi saya buat 2 class, ApiResultModel mendeco data json dari api,
dan data array dibuat menjadi list (List<SemuaProvinsi>).
  
4. Utils

berisi 3 file, yaitu: pendidikan, tempat_tinggal dan validator.

Pendidikan adalah class enum yang akan menampilkan dropdon pendidikan pada data_diri_form view.
class TempatTinggal adalah class enum yang akan menampilkan dropdown tempat tinggal pada alamat_ktp_form
Validator adalah class yang berfungsi untuk validasi dari setiap inputan data.

5. View

Terdiri dari 5 file, yaitu alamat_ktp_form,alamat_ktp_screen, data_diri_form,data_diri_sceen, dan review_screen
5 file ini berfungsi sebagai interface pada user. (mungkin interfacenya masih kurang menarik, saya masih focus pada fungsi).
