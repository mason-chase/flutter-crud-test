import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

// ignore: must_be_immutable
class PhoneNumerValidation extends StatefulWidget {
  String phoneNumber;

  PhoneNumerValidation({
    this.phoneNumber = "",
    Key? key,
    required this.onSelectPhone,
  }) : super(key: key);
  final Function(String phone) onSelectPhone;

  @override
  State<PhoneNumerValidation> createState() => _PhoneNumerValidationState();
}

class _PhoneNumerValidationState extends State<PhoneNumerValidation> {
  final initFuture = FlutterLibphonenumber().init();
  final TextEditingController phoneController = TextEditingController(),
      countryController = TextEditingController(text: 'United States'),
      manualFormatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.phoneNumber != "") phoneController.text = widget.phoneNumber;
    updatePlaceholderHint();
  }

  String? parsedData;
  var globalPhoneType = PhoneNumberType.mobile;
  var globalPhoneFormat = PhoneNumberFormat.international;
  var currentSelectedCountry = const CountryWithPhoneCode.us();

  var placeholderHint = '';
  var inputContainsCountryCode = true;

  void updatePlaceholderHint() {
    late String newPlaceholder;
    if (globalPhoneType == PhoneNumberType.mobile) {
      if (globalPhoneFormat == PhoneNumberFormat.international) {
        newPlaceholder =
            currentSelectedCountry.exampleNumberMobileInternational;
      } else {
        newPlaceholder = currentSelectedCountry.exampleNumberMobileNational;
      }
    } else {
      if (globalPhoneFormat == PhoneNumberFormat.international) {
        newPlaceholder =
            currentSelectedCountry.exampleNumberFixedLineInternational;
      } else {
        newPlaceholder = currentSelectedCountry.exampleNumberFixedLineNational;
      }
    }
    if (!inputContainsCountryCode) {
      newPlaceholder =
          newPlaceholder.substring(currentSelectedCountry.phoneCode.length + 2);
    }
    setState(() => placeholderHint = newPlaceholder);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      height: 700,
      child: Card(
        // semanticContainer: true,
        child: FutureBuilder<void>(
          future: initFuture,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('error: ${snapshot.error}');
            } else if (snapshot.connectionState == ConnectionState.done) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.phone,
                        onChanged: (v) {
                          setState(() {});
                        },
                        textAlign: TextAlign.center,
                        onTap: () async {
                          final sortedCountries = CountryManager().countries
                            ..sort((a, b) => (a.countryName ?? '')
                                .compareTo(b.countryName ?? ''));
                          final res =
                              await showModalBottomSheet<CountryWithPhoneCode>(
                            context: context,
                            isScrollControlled: false,
                            builder: (context) {
                              return ListView.builder(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                itemBuilder: (context, index) {
                                  final item = sortedCountries[index];
                                  return GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      Navigator.of(context).pop(item);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 16),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '+' + item.phoneCode,
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            flex: 8,
                                            child: Text(item.countryName ?? ''),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: sortedCountries.length,
                              );
                            },
                          );
                          if (res != null) {
                            setState(() {
                              currentSelectedCountry = res;
                            });
                            updatePlaceholderHint();
                            phoneController.text =
                                res.exampleNumberFixedLineInternational;
                            print(res);
                            countryController.text =
                                res.countryName ?? '+ ${res.phoneCode}';
                          }
                        },
                        readOnly: true,
                        inputFormatters: const [],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone_android),
                          ),
                          inputFormatters: [
                            LibPhonenumberTextFormatter(
                              phoneNumberType: globalPhoneType,
                              phoneNumberFormat: globalPhoneFormat,
                              country: currentSelectedCountry,
                              inputContainsCountryCode:
                                  inputContainsCountryCode,
                              additionalDigits: 3,
                              shouldKeepCursorAtEndOfInput: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            validatePhoneNumber();
                          },
                          child: const Text('Parse'),
                        ),
                      ),
                    )
                  ],
                ),
                // Text(parsedData ?? 'Number invalid'),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  validatePhoneNumber() async {
    try {
      final res = await FlutterLibphonenumber().parse(
        phoneController.text,
        region: currentSelectedCountry.countryCode,
      );
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      setState(() {
        parsedData = encoder.convert(res);
        widget.onSelectPhone(phoneController.text);
        Navigator.pop(context, parsedData);
      });
    } catch (e) {
      setState(() {
        parsedData = "null";
        Navigator.pop(context, parsedData);
      });
    }
  }
}
