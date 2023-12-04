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
            "alamat_domisili": data[10].text,
            "golongan_darah_id": int.parse(data[11].text),
            "noHP": data[12].text,
            "provinsi_id": int.parse(data[13].text),
            "kotaKabupaten_id": int.parse(data[14].text),
            "kecamatan_id": int.parse(data[15].text),
            "kelurahan_id": int.parse(data[16].text),
            "kode_pos": data[17].text,
            "email": data[18].text,
          },
          "pemeriksaan": {
            "dokter_id": int.parse(data[19].text),
            "sample_lokasi": data[20].text,
            "sample_jenis": data[21].text,
            "sample_wadah": data[22].text,
            "sample_pengambil": data[23].text,
            "sample_waktu": data[24].text,
            "sample_kondisi": data[25].text,
            "instansi_id": int.parse(data[26].text),
            "waktu_kunjungan": data[27].text,
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
