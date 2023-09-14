import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/constants/color/color.dart';

import '../../../constants/utils/utils.dart';
import '../../../constants/widget/custum_button.dart';
import '../repository/auth_repository.dart'; // Corrected the import path

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final AuthRepository _authRepository = AuthRepository();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  // Pick a country using a country picker.
  void pickCountry() {
    showCountryPicker(
      context: context,
      onSelect: (Country _country) {
        setState(() {
          country = _country;
        });
      },
    );
  }

  // Send the phone number for authentication.
  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      _authRepository.signInWithPhone(
        context,
        '+${country!.phoneCode}$phoneNumber',
      );
    } else {
      showSnackBar(context: context, content: 'Pick the country');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        title: const Text('Enter the phone number'),
        centerTitle: true,
        backgroundColor: black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/loties/landing.json'),
              const SizedBox(
                height: 20,
              ),
              const Text('Verify your phone number'),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 60,
                              child: IconButton(
                                onPressed: pickCountry,
                                icon: const Icon(
                                  Icons.language,
                                  color: white,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 13, left: 40),
                              child: Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                        if (country != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              '+${country!.phoneCode}',
                              style:
                                  const TextStyle(fontSize: 16, color: white),
                            ),
                          ),
                      ],
                    ),
                    Expanded(
                      child: SizedBox(
                        child: TextFormField(
                          style: const TextStyle(color: white),
                          decoration: const InputDecoration(
                            hintText: 'Enter The Number',
                            hintStyle: TextStyle(color: white),
                            border: InputBorder.none,
                            fillColor: white,
                          ),
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.2),
              SizedBox(
                child: CustomButton(
                  text: 'Tap to Next',
                  onPressed: () => sendPhoneNumber(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
