import 'dart:async';
import 'package:dio/dio.dart';
import 'package:labkesda_mobile/constants/endpoints.dart';
import 'package:labkesda_mobile/models/pemeriksaan/pemeriksaan.dart';
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

  FutureOr<Pemeriksaan?> createPemeriksaanBaru(List data) async {
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
        }
      };

      // throw Exception("Error");

      final Response res = await dioPrivate
          .post(AppEndpoints.createPemeriksaanPasienBaru, data: formData);

      return Pemeriksaan.fromJson(res.data);
    } on DioException catch (e) {
      return e.response?.data["message"] ?? e.toString();
    } catch (e) {
      return null;
    }
  }
}
