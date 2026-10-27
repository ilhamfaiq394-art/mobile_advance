import 'package:flutter/material.dart';

class BelajarForm extends StatefulWidget {
  @override
  _BelajarFormState createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  // KUNCI FORM (untuk validasi) //
  final _formKey = GlobalKey<FormState>();

  // CONTROLLER
  final _namaCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _motoCtrl = TextEditingController();

  // STATE
  String _jk = "Laki-laki";
  String _agama = "Islam";
  double _slider = 50.0;
  bool _setuju = false;
  bool _notifikasi = false;

  final List<String> agamaList = [
    "Islam",
    "Kristen Protestan",
    "Kristen Katolik",
    "Hindu",
    "Buddha",
  ];

  // FUNGSI KIRIM DATA
  void _kirimData() {
    if (_formKey.currentState!.validate()) {
      if (!_setuju) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Harap setujui Syarat & Ketentuan')),
        );
        return;
      }

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Data Terkirim"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama   : ${_namaCtrl.text}"),
              Text("Password: ${_passCtrl.text}"),
              Text("JK     : $_jk"),
              Text("Agama  : $_agama"),
              Text("Slider : ${_slider.toStringAsFixed(1)}"),
              Text("Moto   : ${_motoCtrl.text}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  // WIDGET BANTU: Sub-judul tiap acara
  Widget _subJudul(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acara 25-28: Form & Registrasi"),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🏷️ JUDUL BESAR HALAMAN
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Text(
                      "Acara 25, 26, 27 & 28",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      "Form & Registrasi",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8),
                    Divider(thickness: 2),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // ACARA 25
              _subJudul("🔵 Acara 25 — Form I (Nama Lengkap)", Colors.blue),
              TextFormField(
                controller: _namaCtrl,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Nama Lengkap",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Nama tidak boleh kosong' : null,
              ),

              // ACARA 26
              _subJudul("🟣 Acara 26 — Form II (Password, Checkbox, Switch, Slider)",
                  Colors.deepPurple),

              // Password
              TextFormField(
                controller: _passCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Password tidak boleh kosong' : null,
              ),
              SizedBox(height: 16),

              // Slider
              Text(
                "Tingkat Kepuasan / Nilai Slider:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Slider(
                value: _slider,
                min: 0,
                max: 100,
                divisions: 100,
                label: _slider.toStringAsFixed(0),
                onChanged: (v) => setState(() => _slider = v),
              ),
              Text("Nilai saat ini: ${_slider.toStringAsFixed(1)}"),
              SizedBox(height: 8),

              // Checkbox
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("Setuju dengan Syarat & Ketentuan"),
                value: _setuju,
                activeColor: Colors.deepPurple,
                onChanged: (v) => setState(() => _setuju = v!),
              ),

              // Switch
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("Aktifkan Notifikasi Push"),
                value: _notifikasi,
                activeColor: Colors.deepPurple,
                onChanged: (v) => setState(() => _notifikasi = v),
              ),

              // ACARA 27
              _subJudul("🟢 Acara 27 — Form III (JK, Agama, Moto Hidup)",
                  Colors.teal),

              // Radio JK
              Text(
                "Jenis Kelamin:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      contentPadding: EdgeInsets.zero,
                      value: "Laki-laki",
                      groupValue: _jk,
                      title: Text("Laki-laki"),
                      activeColor: Colors.teal,
                      onChanged: (v) => setState(() => _jk = v!),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      contentPadding: EdgeInsets.zero,
                      value: "Perempuan",
                      groupValue: _jk,
                      title: Text("Perempuan"),
                      activeColor: Colors.teal,
                      onChanged: (v) => setState(() => _jk = v!),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Dropdown Agama
              DropdownButtonFormField<String>(
                value: _agama,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.book),
                  labelText: "Agama",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: agamaList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (v) => setState(() => _agama = v!),
              ),
              SizedBox(height: 16),

              // Moto Hidup
              TextFormField(
                controller: _motoCtrl,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Moto Hidup",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              // ACARA 28
              _subJudul("Acara 28 — Form IV (Registrasi / Submit)",
                  Colors.deepOrange),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: _kirimData,
                  child: Text(
                    "Register / Kirim Data",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}