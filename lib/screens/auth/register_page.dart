import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mynuu/controllers/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final authController = Get.put(AuthService());

    const countryCode = CountryCode;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/logos/logo.png',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Applicable taxes and 18% service\ncharge will be  added to your bill.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16, fontFamily: 'Intro',
              ),
            ),
            SizedBox(
              height: _size.height * 0.08,
            ),
            SizedBox(
              height: 100,
              width: _size.width / 1.05,
              child: TextFormField(
                controller: authController.phoneController,
                cursorColor: Colors.white,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: 'Phone number',
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 14, fontFamily: 'Intro',
                  ),
                  // this will remove the default content padding
                  // now you can customize it here or add padding widget
                  contentPadding: const EdgeInsets.only(top: 0),
                  prefixIcon: CountryCodePicker(
                    onChanged: (CountryCode countryCode) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('countryCode', countryCode.toString());
                    },

                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: 'BD',
                    showDropDownButton: true,
                    showFlagDialog: true,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.only(left: 1),
                    favorite: const ['+880', 'BD'],
                    // optional. Shows only country name and flag
                    showCountryOnly: false,
                    showFlag: true,
                    // optional. Shows only country name and flag when popup is closed.
                    showOnlyCountryWhenClosed: false,
                    // optional. aligns the flag and the Text left
                    alignLeft: false,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _size.height * 0.0025,
            ),
            SizedBox(
              height: 100,
              width: _size.width / 1.05,
              child: TextFormField(
                controller: authController.nameController,
                cursorColor: Colors.white,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: 'Name',
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 14, fontFamily: 'Intro',
                  ),
                  // this will remove the default content padding
                  // now you can customize it here or add padding widget
                  contentPadding: const EdgeInsets.only(top: 0),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _size.height * 0.03,
            ),
            GestureDetector(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                var code = prefs.getString('countryCode');
                authController.createRecord(
                  authController.nameController.text,
                  authController.phoneController.text,
                  code.toString(),
                  context,
                );
              },
              child: Container(
                height: 50,
                width: _size.width / 1.50,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15, fontFamily: 'Intro',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _size.height * 0.07,
            ),
            const Center(
              child: Text(
                'Follow us',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16, fontFamily: 'Intro',
                ),
              ),
            ),
            SizedBox(
              height: _size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/facebook.png',
                  height: _size.height * 0.04,
                ),
                SizedBox(
                  width: _size.width * 0.05,
                ),
                Image.asset(
                  'assets/icons/instagram.png',
                  height: _size.height * 0.04,
                ),
              ],
            ),
            SizedBox(
              height: _size.height * 0.09,
            ),
            const Center(
              child: Text(
                'Powered by',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16, fontFamily: 'Intro',
                ),
              ),
            ),
            Image.asset(
              'assets/logos/logo2.png',
              height: _size.height * 0.05,
            ),
            SizedBox(
              height: _size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
