import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'phone_verif_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              AppAssets.logoForm,
              height: 120,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.medical_services_outlined, size: 80, color: AppColors.primary),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(27),
                border: Border.all(color: Colors.blue.withOpacity(0.5)),
              ),
              child: Column(
                children: [
                  _buildTextField('Full Name', 'Masukkan Nama Lengkap'),
                  const SizedBox(height: 16),
                  _buildTextField('NIK', 'Masukkan NIK anda'),
                  const SizedBox(height: 16),
                  _buildTextField('Email', 'Masukkan email'),
                  const SizedBox(height: 16),
                  _buildTextField('No. Hp', 'Masukkan No. Hp'),
                  const SizedBox(height: 16),
                  _buildGenderSelection(),
                ],
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PhoneVerifScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                elevation: 4,
              ),
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 16),
            const Text('Or', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon(Icons.g_mobiledata, Colors.red),
                const SizedBox(width: 20),
                _buildSocialIcon(Icons.facebook, Colors.blue),
                const SizedBox(width: 20),
                _buildSocialIcon(Icons.whatsapp, Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 12, color: AppColors.textHint),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black26),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Genre',
          style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Row(
              children: [
                Radio<String>(
                  value: 'Female',
                  groupValue: _selectedGender,
                  onChanged: (value) => setState(() => _selectedGender = value),
                ),
                const Text('Female'),
              ],
            ),
            const SizedBox(width: 20),
            Row(
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: _selectedGender,
                  onChanged: (value) => setState(() => _selectedGender = value),
                ),
                const Text('Male'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 30),
    );
  }
}
