import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:labkesda_mobile/presentation/controllers/dio/dio_provider.dart';

class PemeriksaanController {
  Future<String> createPemeriksaanBaru(List data) async {
    try {
      final FormData formData = FormData.fromMap(
        {
          "user": {
            "name": data[0].text,
            "nik": data[1].text,
            "tempat_lahir": data[2].text,
            "tanggal_lahir": data[3].text,
            "warga_negara_id": data[4].text,
            "agama": data[5].text,
            "jenis_kelamin_id": data[6].text,
            "status_perkawinan_id": data[7].text,
            "pendidikan_id": data[8].text,
            "pekerjaan": data[9].text,
            "alamat_domisili": "string",
            "golongan_darah_id": 0,
            "noHP": "string",
            "provinsi_id": 0,
            "kotaKabupaten_id": 0,
            "kecamatan_id": 0,
            "kelurahan_id": 0,
            "kode_pos": "string",
            "email": "string"
          },
          "pemeriksaan": {
            "dokter_id": 0,
            "sample_lokasi": "string",
            "sample_jenis": "string",
            "sample_wadah": "string",
            "sample_pengambil": "string",
            "sample_waktu": "2023-12-03T20:35:04.290Z",
            "sample_kondisi": "string",
            "instansi_id": 0,
            "waktu_kunjungan": "2023-12-03T20:35:04.290Z"
          }
        },
      );

      print(formData.fields[4]);

      return "Berhasil membuat pemeriksaan baru";
    } catch (e) {
      return e.toString();
    }
  }
}
