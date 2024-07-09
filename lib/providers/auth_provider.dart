import 'dart:async';

import 'package:byb/config/app_theme.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthProvider extends ChangeNotifier {
  String countryCode = '+91';
  bool isChecked = true;
  bool isResend = false;

  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  var resendTime = 11;
  String resendTimeFormatted = '';

  toggleCheck(value) {
    isChecked = value;
    notifyListeners();
  }

  otpTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendTime == 0) {
        isResend = true;
        notifyListeners();
      } else {
        resendTime--;
        resendTimeFormatted =
            resendTime < 10 ? '00:0$resendTime' : '00:$resendTime';

        notifyListeners();
      }
    });
  }

  void refresh() {
    notifyListeners();
  }

  void openCountryPickerDialog() => showDialog(
        context: navigatorKey.currentState!.context,
        builder: (context) => Padding(
          padding: EdgeInsets.only(right: 100.w),
          child: CountryPickerDialog(
            searchCursorColor: primaryColor,
            searchInputDecoration: const InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
              // focusedBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(
              //       color: Colors.white, width: 1.0, style: BorderStyle.none),
              // ),
            ),
            isSearchable: true,
            onValuePicked: (Country country) {
              countryCode = '+${country.phoneCode}';
              notifyListeners();
            },
            title: const Text(''),
            priorityList: [
              CountryPickerUtils.getCountryByIsoCode('IN'),
              CountryPickerUtils.getCountryByIsoCode('US'),
            ],
            itemBuilder: (country) => Row(
              children: [
                CountryPickerUtils.getDefaultFlagImage(country),
                const SizedBox(
                  width: 10,
                ),
                SubtitleText(
                  text: '+${country.phoneCode}',
                  fontSize: 16,
                ),
              ],
            ),
          ),
        ),
      );
}
