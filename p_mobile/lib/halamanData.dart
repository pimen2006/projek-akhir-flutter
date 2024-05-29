import 'dart:convert';

import 'package:p_mobile/detailData.dart';
import 'package:p_mobile/tambahData.dart';
import 'package:p_mobile/ubahData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class halamanData extends StatefulWidget {
  const halamanData({super.key});

  @override
  State<halamanData> createState() => _halamanDataState();
}

class _halamanDataState extends State<halamanData> {
  List _listdata = [];
  bool _loading = true;

  Future _getdata() async {
    try {
      final respon =
          await http.get(Uri.parse('http://192.168.165.135/api_produk/read.php'));
      if (respon.statusCode == 200) {
        final data = jsonDecode(respon.body);
        setState(() {
          _listdata = data;
          _loading = !_loading;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future _hapus(String id) async {
    try {
      final respon = await http.post(
          Uri.parse('http://192.168.165.135/api_produk/delete.php'),
          body: {"id": id});
      if (respon.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    _getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Data"),
        backgroundColor: Colors.grey,
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _listdata.length,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailProduk(
                                    Listdata: {
                                      'id': _listdata[index]['id'],
                                      'nis': _listdata[index]['nis'],
                                      'namaSiswa': _listdata[index]
                                          ['namaSiswa'],
                                      'jenisKelamin': _listdata[index]
                                          ['jenisKelamin'],
                                      'alamat': _listdata[index]['alamat'],
                                      'noHp': _listdata[index]['noHp'],
                                    },
                                  )));
                    },
                    child: ListTile(
                      title: Text(
                        "NAMA SISWA",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        _listdata[index]['namaSiswa'],
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Gantinama(
                                              ListData: {
                                                'id': _listdata[index]['id'],
                                                'nis': _listdata[index]['nis'],
                                                'namaSiswa': _listdata[index]
                                                    ['namaSiswa'],
                                                'jenisKelamin': _listdata[index]
                                                    ['jenisKelamin'],
                                                'alamat': _listdata[index]
                                                    ['alamat'],
                                                'noHp': _listdata[index]
                                                    ['noHp'],
                                              },
                                            )));
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(
                                            "anda yakin ingin menghapus data?"),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                _hapus(_listdata[index]['id'])
                                                    .then((value) {
                                                  Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: ((context) =>
                                                              halamanData())),
                                                      (route) => false);
                                                });
                                              },
                                              child: Text("hapus")),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("tidak"))
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
          child: const Text(
            "+",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TambahProduk()));
          }),
    );
  }
}
