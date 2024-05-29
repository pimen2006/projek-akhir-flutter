import 'package:flutter/material.dart';

class DetailProduk extends StatefulWidget {
  final Map Listdata;
  DetailProduk({Key? key, required this.Listdata}) : super(key: key);
  //const DetailProduk({super.key});

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  final formkey = GlobalKey<FormState>();
  TextEditingController id = TextEditingController();
  TextEditingController nis = TextEditingController();
  TextEditingController namaSiswa = TextEditingController();
  TextEditingController jenisKelamin = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController noHp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    id.text = widget.Listdata['id'];
    nis.text = widget.Listdata['nis'];
    namaSiswa.text = widget.Listdata['namaSiswa'];
    jenisKelamin.text = widget.Listdata['jenisKelamin'];
    alamat.text = widget.Listdata['alamat'];
    noHp.text = widget.Listdata['noHp'];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail data siswa"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Card(
          elevation: 12,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: const Text(
                    "ID",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    widget.Listdata['id'],
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  title: const Text(
                    "NIS",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    widget.Listdata['nis'],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  title: const Text(
                    "NAMA SISWA",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    widget.Listdata['namaSiswa'],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  title: const Text(
                    "JENIS KELAMIN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    widget.Listdata['jenisKelamin'],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  title: const Text(
                    "ALAMAT",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    widget.Listdata['alamat'],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  title: const Text(
                    "NO HP",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    widget.Listdata['noHp'],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
