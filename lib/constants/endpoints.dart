/// Endpoints
///
/// This class is used to store all endpoints of the application.
class AppEndpoints {
  const AppEndpoints._();

  // Base URL
  // static const String _baseUrl = 'http://10.0.2.2:3001';
  // static const String _baseUrl = 'https://relieved-cheaply-drum.ngrok-free.app';
  static const String _baseUrl = 'https://api1.sistem.labkes.lampungprov.go.id:3001';

  // ====Provinsi====
  /// Get All Provinsi
  ///
  /// Require method:
  /// * GET
  ///
  /// Require params:
  /// * No
  static const String getAllProvinsi = '$_baseUrl/api/v1/geo/provinsi';

  // ====Kabupaten====
  /// Get All Kabupaten By Provinsi Id
  ///
  /// Require method:
  /// * GET
  ///
  /// Require params:
  /// * id (String)
  static String getAllKabupatenByProvinsiId(String id) => '$_baseUrl/api/v1/geo/kabupaten?provinsi_id=$id';

  // ====Kecamatan====
  /// Get All Kecamatan By Kabupaten Id
  ///
  /// Require method:
  /// * GET
  ///
  /// Require params:
  /// * id (String)
  static String getAllKecamatanByKabupatenId(String id) => '$_baseUrl/api/v1/geo/kecamatan?kabupaten_id=$id';

  // ====Kelurahan====
  /// Get Kelurahan By Id
  ///
  /// Require method:
  /// * GET
  ///
  /// Require params:
  /// * id (String)
  static String getAllKelurahanByKecamatanId(String id) => '$_baseUrl/api/v1/geo/kelurahan?kecamatan_id=$id';

  // ====Pemeriksaan====
  /// Get All Pemeriksaan By Pendaftaran Id
  ///
  /// Require method:
  /// * POST
  ///
  /// Require params:
  /// * No
  static String getAllPemeriksaanByPendaftaranId(String id) => '$_baseUrl/api/v1/pemeriksaan';

  // ====User Pasien====
  /// Get All User Pasien
  ///
  /// Require method:
  /// * POST
  ///
  /// Require params:
  /// * No
  static const String getAllUserPasien = '$_baseUrl/api/v1/user-pasien';

  /// Get User Pasien By Id
  ///
  /// Require method:
  /// * GET
  ///
  /// Require params:
  /// * id (String)
  static String getPasienById(String id) => '$_baseUrl/api/v1/user-pasien/$id';

  // ====Antrian Pasien====
  /// Get All Antrian Pasien
  ///
  /// Require method:
  /// * GET
  /// * POST
  ///
  /// Require params:
  /// * No
  static const String getAllAntrianPasien = '$_baseUrl/api/v1/antrian-pasien';

  /// Get Antrian Pasien By Id
  ///
  /// Require method:
  /// * GET
  /// * PATCH
  /// * DELETE
  ///
  /// Require params:
  /// * id (String)
  static String getAntrianPasienById(String id) => '$_baseUrl/api/v1/antrian-pasien/$id';

  // ====Categories====
  /// Get Category for dropdown
  ///
  /// Require method:
  /// * GET
  ///
  /// Require params:
  /// * id (String)
  static String getCategoryById(String id) => '$_baseUrl/api/v1/category/$id';

  // ====Dokter====
  /// Get Dokter for dropdown
  ///
  /// Require method:
  /// * GET
  ///
  static String getAllDokter = '$_baseUrl/api/v1/dokter';

  // ====Instansi====
  /// Get Instansi for dropdown
  ///
  /// Require method:
  /// * GET
  ///
  /// Require params:
  /// * No
  static String getAllInstansi = '$_baseUrl/api/v1/instansi';

  // ====Pemeriksaan====
  /// Create Pemeriksaan Pasien Baru
  ///
  /// Require method:
  /// * POST
  ///
  /// Require params:
  /// * Body (Json)
  static String createPemeriksaanPasienBaru = '$_baseUrl/api/v1/pemeriksaan/create-pemeriksaan-pasien-baru';

  // ====Promo====
  /// Get Promo
  ///
  /// Require method:
  /// * GET
  ///
  /// Require params:
  /// * No
  // static String getAllPromo =
  static String getAllPromo = '$_baseUrl/api/v1/promo';
  // ====Paket Pemeriksaan====
  /// Get Paket Layanan
  ///
  /// Require method:
  /// * GET
  ///
  /// Require params:
  /// * No
  static String getAllPaketLayanan = '$_baseUrl/api/v1/paket-layanan';
  static String getAllLayanan = '$_baseUrl/api/v1/layanan';
  static String getAllJenisLayanan = '$_baseUrl/api/v1/jenis-layanan';

  // dummy paket pemeriksaan
  static String getAllDummyPaketPemeriksaan =
      'https://dummy-for-promo-labkesda-default-rtdb.asia-southeast1.firebasedatabase.app/paket-pemeriksaan.json';
  // dummy for layanan
  static String getAllDummyLayanan = 'https://dummy-for-promo-labkesda-default-rtdb.asia-southeast1.firebasedatabase.app/layanan.json';

  static String createPemeriksaanPasienLama = '$_baseUrl/api/v1/pemeriksaan/create-pemeriksaan-pasien-lama';
  static String checkNikOrKodePendaftaran = '$_baseUrl/api/v1/pemeriksaan/check-kode-pendaftaran/';
  static String getRiwayatPemeriksaan = '$_baseUrl/api/v1/pemeriksaan/riwayat-pemeriksaan/';
  static String getHasilPemeriksaan = '$_baseUrl/api/v1/pemeriksaan/hasil-pemeriksaan/';
  static String getLibrary = '$_baseUrl/api/v1/library';
}
