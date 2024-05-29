import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:p_mobile/halamanData.dart';

class Gantinama extends StatefulWidget {
  final Map ListData;
  const Gantinama({super.key, required this.ListData});

  @override
  State<Gantinama> createState() => _GantinamaState();
}

class _GantinamaState extends State<Gantinama> {
  final formKey = GlobalKey<FormState>();
  TextEditingController id = TextEditingController();
  TextEditingController nis = TextEditingController();
  TextEditingController namaSiswa = TextEditingController();
  TextEditingController jeniskelamin = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController noHp = TextEditingController();

  Future<void> _ubah() async {
    final respon = await http.post(
      Uri.parse('http://192.168.165.135/api_produk/update.php'),
      body: {
        'id': id.text,
        'nis': nis.text,
        'namaSiswa': namaSiswa.text,
        'jenisKelamin': jeniskelamin.text,
        'alamat': alamat.text,
        'noHp': noHp.text,
      },
    );
    if (respon.statusCode == 200) {
      setState(() {
        // Membersihkan teks setelah pengiriman data
        id.clear();
        nis.clear();
        namaSiswa.clear();
        jeniskelamin.clear();
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
    id.text = widget.ListData['id'];
    nis.text = widget.ListData['nis'];
    namaSiswa.text = widget.ListData['namaSiswa'];
    jeniskelamin.text = widget.ListData['jenisKelamin'];
    alamat.text = widget.ListData['alamat'];
    noHp.text = widget.ListData['noHp'];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update data"),
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
                  hintText: "Update nis",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "update nis tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: namaSiswa,
                decoration: InputDecoration(
                  hintText: "Update nama siswa",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Update nama siswa tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: jeniskelamin,
                decoration: InputDecoration(
                  hintText: "Update jenis kelamin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Update jenis kelamin tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: alamat,
                decoration: InputDecoration(
                  hintText: "Update alamat",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Update alamat tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: noHp,
                decoration: InputDecoration(
                  hintText: "Update no hp",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Update no hp tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    _ubah().then((_) {
                      final snackBar = SnackBar(
                        content: const Text("Data berhasil diubah"),
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
                        content: const Text("Data gagal diubah"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                  }
                },
                child: const Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
