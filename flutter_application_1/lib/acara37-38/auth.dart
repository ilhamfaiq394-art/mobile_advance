import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'acara38_api.dart'; // Menyambung ke file Acara 38

class Acara37AuthScreen extends StatefulWidget {
  const Acara37AuthScreen({super.key});

  @override
  State<Acara37AuthScreen> createState() => _Acara37AuthScreenState();
}

class _Acara37AuthScreenState extends State<Acara37AuthScreen> {
  // --- Fitur Acara 39: Validasi Form ---
  final _formKey = GlobalKey<FormState>();
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  User? _user;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser; 
  }

  // --- Fungsi Login ---
  Future<void> _login() async {
    if (_formKey.currentState!.validate()) { // Cek Validasi dulu
      setState(() => _isLoading = true);
      try {
        UserCredential result = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        setState(() {
          _user = result.user; // Jika sukses, UI langsung berubah ke Acara 38
        });
      } on FirebaseAuthException catch (e) {
        _showError(e.message);
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  // --- Fungsi Register ---
  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        _showSuccess('Registrasi Berhasil! Silahkan login.');
      } on FirebaseAuthException catch (e) {
        _showError(e.message);
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  // --- Fitur Acara 39: Reset Password (Lupa Password) ---
  Future<void> _resetPassword() async {
    if (_emailController.text.trim().isEmpty) {
      _showError('Masukkan email Anda terlebih dahulu di kolom Email.');
      return;
    }
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text.trim());
      _showSuccess('Link reset password telah dikirim ke email Anda!');
    } on FirebaseAuthException catch (e) {
      _showError(e.message);
    }
  }

  // --- Fungsi Logout (Dipanggil dari Acara 38) ---
  void _handleLogout() {
    _auth.signOut();
    setState(() {
      _user = null; // Kembali ke form login
    });
  }

  void _showError(String? message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $message'), backgroundColor: Colors.red),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ==============================================================
    // LOGIKA UTAMA: JIKA SUDAH LOGIN, LANGSUNG NYAMBUNG KE ACARA 38
    // ==============================================================
    if (_user != null) {
      return Acara38ApiDashboard(
        user: _user!, 
        onLogout: _handleLogout,
      );
    }

    // ==============================================================
    // JIKA BELUM LOGIN, TAMPILKAN FORM (GABUNGAN ACARA 37 & 39)
    // ==============================================================
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acara 37, 38, & 39 (Auth Terpadu)'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form( // Bungkus dengan Form untuk validasi
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Icon(Icons.security, size: 80, color: Colors.indigo),
              const SizedBox(height: 30),
              const Text('Silakan Login / Register', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              
              // Input Email dengan Validasi
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Email tidak boleh kosong';
                  if (!value.contains('@')) return 'Format email tidak valid';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // Input Password dengan Validasi
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Password tidak boleh kosong';
                  if (value.length < 6) return 'Password minimal 6 karakter';
                  return null;
                },
              ),
              
              // Tombol Lupa Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _resetPassword,
                  child: const Text('Lupa Password?'),
                ),
              ),
              const SizedBox(height: 10),

              // Tombol Aksi
              _isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: Colors.indigo,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Login'),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: _register,
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text('Register Akun Baru'),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}