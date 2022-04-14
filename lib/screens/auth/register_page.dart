import 'package:country_code_picker/country_code_picker.dart';

import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
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
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: _size.height * 0.08,
            ),
            SizedBox(
              height: 100,
              width: _size.width / 1.05,
              child: TextFormField(
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
                    fontSize: 14,
                  ),
                  // this will remove the default content padding
                  // now you can customize it here or add padding widget
                  contentPadding: const EdgeInsets.only(top: 0),
                  prefixIcon: CountryCodePicker(
                    onChanged: print,
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
                onChanged: (value) {
                  //get value from text field here
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Input Name';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: _size.height * 0.15,
            ),
            const Center(
              child: Text(
                'Follow us',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
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
                  fontSize: 16,
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
