import 'package:p_mobile/halamanData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class TambahProduk extends StatefulWidget {
  const TambahProduk({Key? key}) : super(key: key);

  @override
  State<TambahProduk> createState() => _TambahProdukState();
}

class _TambahProdukState extends State<TambahProduk> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nis = TextEditingController();
  TextEditingController namaSiswa = TextEditingController();
  TextEditingController jenisKelamin = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController noHp = TextEditingController();

  Future<void> _simpan() async {
    final respon = await http.post(
      Uri.parse('http://192.168.165.135/api_produk/create.php'),
      body: {
        'nis': nis.text,
        'namaSiswa': namaSiswa.text,
        'jenisKelamin': jenisKelamin.text,
        'alamat': alamat.text,
        'noHp': noHp.text,
      },
    );
    if (respon.statusCode == 200) {
      setState(() {
        // Membersihkan teks setelah pengiriman data
        nis.clear();
        namaSiswa.clear();
        jenisKelamin.clear();
        alamat.clear();
        noHp.clear();
      });
      return;
    } else {
      throw Exception('Gagal menyimpan data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah data"),
      ),
      body: Form(
        key: formKey, // Menggunakan kunci formulir
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: nis,
                decoration: InputDecoration(
                  hintText: "NIS",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nis tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: namaSiswa,
                decoration: InputDecoration(
                  hintText: "nama siswa",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "nama siswa tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: jenisKelamin,
                decoration: InputDecoration(
                  hintText: "Jeniskelamin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "jenis kelamin tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: alamat,
                decoration: InputDecoration(
                  hintText: "alamat",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "alamat tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: noHp,
                decoration: InputDecoration(
                  hintText: "no hp",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "no hp tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    _simpan().then((_) {
                      final snackBar = SnackBar(
                        content: const Text("Data berhasil disimpan"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => halamanData()),
                        (route) => false,
                      );
                    }).catchError((error) {
                      final snackBar = SnackBar(
                        content: const Text("Data gagal disimpan"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                  }
                },
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
