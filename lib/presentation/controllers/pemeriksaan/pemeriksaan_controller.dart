import 'dart:async';
import 'package:dio/dio.dart';
import 'package:labkesda_mobile/constants/endpoints.dart';
import 'package:labkesda_mobile/models/pemeriksaan/pemeriksaan.dart';
import 'package:labkesda_mobile/models/riwayat_pemeriksaan/riwayat_pemeriksaan.dart';
import 'package:labkesda_mobile/models/user/user.dart';
import 'package:labkesda_mobile/presentation/controllers/dio/dio_provider.dart';

class PemeriksaanController {
  String? _checkEmptyInput(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    return value;
  }

  String? _checkEmptyInputDate(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    return "${value}Z";
  }

  int? _checkEmptyInputInt(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    return int.parse(value);
  }

  FutureOr<dynamic> createPemeriksaanBaru(List data) async {
    try {
      final Map<String, dynamic> formData = {
        "user": {
          "name": data[0].text,
          "nik": data[1].text,
          "tempat_lahir": data[2].text,
          // convert to iso date
          "tanggal_lahir": data[3].text + "Z",
          "warga_negara_id": int.parse(data[4].text),
          "agama": int.parse(data[5].text),
          "jenis_kelamin_id": int.parse(data[6].text),
          "status_perkawinan_id": int.parse(data[7].text),
          "pendidikan_id": int.parse(data[8].text),
          "pekerjaan": data[9].text,
          "alamat_domisili": data[10].text,
          "golongan_darah_id": data[11].text,
          "noHP": data[12].text,
          "provinsi_id": int.parse(data[13].text),
          "kotaKabupaten_id": int.parse(data[14].text),
          "kecamatan_id": int.parse(data[15].text),
          "kelurahan_id": int.parse(data[16].text),
          "kode_pos": data[17].text,
          "email": data[18].text,
        },
        "pemeriksaan": {
          "dokter_id": _checkEmptyInputInt(data[19].text),
          "sample_lokasi": _checkEmptyInput(data[20].text),
          "sample_jenis": _checkEmptyInput(data[21].text),
          "sample_wadah": _checkEmptyInput(data[22].text),
          "sample_pengambil": _checkEmptyInput(data[23].text),
          "sample_waktu": _checkEmptyInputDate(data[24].text),
          "sample_kondisi": _checkEmptyInput(data[25].text),
          "instansi_id": _checkEmptyInputInt(data[26].text),
          "waktu_kunjungan": _checkEmptyInputDate(data[27].text),
          "tipe_pendaftaran_id": int.parse(data[29].text),
          "jenis_pasien_id": int.parse(data[30].text),
        }
      };

      // throw Exception("Error");

      final Response res = await dioPrivate.post(AppEndpoints.createPemeriksaanPasienBaru, data: formData);

      return Pemeriksaan.fromJson(res.data);
    } on DioException catch (e) {
      return e.response?.data["message"] ?? e.toString();
    } catch (e) {
      return null;
    }
  }

  FutureOr<dynamic> checkNikOrKodePendataran(String nikOrKodePendaftaran) async {
    try {
      final Response res = await dioPrivate.get(AppEndpoints.checkNikOrKodePendaftaran + nikOrKodePendaftaran);

      return User.fromJson(res.data);
    } on DioException catch (e) {
      return e.response?.data["message"] ?? e.toString();
    } catch (e) {
      return "Terjadi kesalahan, silahkan coba lagi";
    }
  }

  FutureOr<dynamic> createPemeriksaanLama(List data) async {
    try {
      final Map<String, dynamic> formData = {
        "user": {
          "kodePendaftaran": data[0].text,
        },
        "pemeriksaan": {
          "waktu_kunjungan": _checkEmptyInputDate(data[1].text),
          "tipe_pendaftaran_id": int.parse(data[2].text),
          "jenis_pasien_id": _checkEmptyInputInt(data[3].text),
          "sample_jenis": _checkEmptyInput(data[4].text),
          "sample_lokasi": _checkEmptyInput(data[5].text),
          "sample_wadah": _checkEmptyInput(data[6].text),
          "sample_kondisi": _checkEmptyInput(data[7].text),
          "sample_waktu": _checkEmptyInputDate(data[8].text),
          "sample_pengambil": _checkEmptyInput(data[9].text),
          "dokter_id": _checkEmptyInputInt(data[10].text),
          "instansi_id": _checkEmptyInputInt(data[11].text),
        }
      };

      final Response res = await dioPrivate.post(AppEndpoints.createPemeriksaanPasienLama, data: formData);

      return Pemeriksaan.fromJson(res.data);
    } on DioException catch (e) {
      return e.response?.data["message"] ?? e.toString();
    } catch (e) {
      return "Terjadi kesalahan, silahkan coba lagi";
    }
  }

  FutureOr<dynamic> getRiwayatPemeriksaan(String nik) async {
    try {
      final Response res = await dioPrivate.get(AppEndpoints.getRiwayatPemeriksaan + nik);

      final List<RiwayatPemeriksaan> hasilPemeriksaan = res.data.map<RiwayatPemeriksaan>((e) => RiwayatPemeriksaan.fromJson(e)).toList();

      return hasilPemeriksaan;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? e.toString();
    } catch (e) {
      return "Terjadi kesalahan, silahkan coba lagi";
    }
  }

  FutureOr<dynamic> getHasilPemeriksaan(String kodePemeriksaan) async {
    try {
      final Response res = await dioPrivate.get(AppEndpoints.getHasilPemeriksaan + kodePemeriksaan);

      print("ABC ${res.data}");

      return RiwayatPemeriksaan.fromJson(res.data);
    } on DioException catch (e) {
      return e.response?.data["message"] ?? e.toString();
    } catch (e, s) {
      print(s);
      return "Terjadi kesalahan, silahkan coba lagi";
    }
  }
}
