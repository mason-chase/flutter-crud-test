import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

class PhoneNumerValidation extends StatefulWidget {
  const PhoneNumerValidation({Key? key}) : super(key: key);

  @override
  State<PhoneNumerValidation> createState() => _PhoneNumerValidationState();
}

class _PhoneNumerValidationState extends State<PhoneNumerValidation> {
  final initFuture = FlutterLibphonenumber().init();
  final phoneController = TextEditingController();
  final countryController = TextEditingController(text: 'United States');

  // final manualFormatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    updatePlaceholderHint();
  }

  String? parsedData;

  /// Used to format numbers as mobile or land line
  var globalPhoneType = PhoneNumberType.mobile;

  /// Use international or national phone format
  var globalPhoneFormat = PhoneNumberFormat.international;

  /// Current selected country
  var currentSelectedCountry = CountryWithPhoneCode.us();

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
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<void>(
          future: initFuture,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return  Text('error: ${snapshot.error}');
            } else if (snapshot.connectionState == ConnectionState.done) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: SafeArea(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(
                          bottom: max(
                            0,
                            24 - MediaQuery.of(context).padding.bottom,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 24),
                                        child: TextField(
                                          controller: countryController,
                                          keyboardType: TextInputType.phone,
                                          onChanged: (v) {
                                            setState(() {});
                                          },
                                          textAlign: TextAlign.center,
                                          onTap: () async {
                                            final sortedCountries =
                                                CountryManager().countries
                                                  ..sort((a, b) => (a
                                                              .countryName ??
                                                          '')
                                                      .compareTo(
                                                          b.countryName ?? ''));
                                            final res =
                                                await showModalBottomSheet<
                                                    CountryWithPhoneCode>(
                                              context: context,
                                              isScrollControlled: false,
                                              builder: (context) {
                                                return ListView.builder(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 16),
                                                  itemBuilder: (context, index) {
                                                    final item =
                                                        sortedCountries[index];
                                                    return GestureDetector(
                                                      behavior:
                                                          HitTestBehavior.opaque,
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop(item);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                                horizontal: 24,
                                                                vertical: 16),
                                                        child: Row(
                                                          children: [
                                                            /// Phone code
                                                            Expanded(
                                                              child: Text(
                                                                '+' +
                                                                    item.phoneCode,
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                              ),
                                                            ),

                                                            /// Spacer
                                                            SizedBox(width: 16),

                                                            /// Name
                                                            Expanded(
                                                              flex: 8,
                                                              child: Text(
                                                                  item.countryName ??
                                                                      ''),
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
                                            print('New country selection: $res');
                                            if (res != null) {
                                              setState(() {
                                                currentSelectedCountry = res;
                                              });
                                              updatePlaceholderHint();
                                              countryController.text =
                                                  res.countryName ??
                                                      '+ ${res.phoneCode}';
                                            }
                                          },
                                          readOnly: true,
                                          inputFormatters: [],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.phone,
                                      controller: phoneController,
                                      decoration: InputDecoration(
                                        hintText: placeholderHint,
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
                              ],
                            ),


                            /// Manual Phone input
                            // Container(
                            //   width: 180,
                            //   child: TextField(
                            //     keyboardType: TextInputType.phone,
                            //     textAlign: TextAlign.center,
                            //     controller: manualFormatController,
                            //     decoration: InputDecoration(
                            //       hintText: placeholderHint,
                            //     ),
                            //   ),
                            // ),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            /// Manually format the phone input
                            // Flexible(
                            //   child: ElevatedButton(
                            //     // child: Text(
                            //     //   'Format (Async)',
                            //     //   textAlign: TextAlign.center,
                            //     // ),
                            //     onPressed: () async {
                            //       // Asynchronous formatting with native call into libphonenumber
                            //       // final res =
                            //       // await FlutterLibphonenumber().format(
                            //       //   manualFormatController.text,
                            //       //   currentSelectedCountry.countryCode,
                            //       // );
                            //       // setState(
                            //       //       () => manualFormatController.text =
                            //       //       res['formatted'] ?? '',
                            //       // );
                            //     },
                            //   ),
                            // ),
                            // Flexible(
                            //   child: ElevatedButton(
                            //     child: Text(
                            //       'Format (Sync)',
                            //       textAlign: TextAlign.center,
                            //     ),
                            //     onPressed: () async {
                            //       if (CountryManager().countries.isEmpty) {
                            //         print(
                            //             'Warning: countries list is empty which means init hs not be run yet. Can\'t format synchronously until init has been executed.');
                            //       }
                            //       // Synchronous formatting with no native call into libphonenumber, just a dart call to mask the input
                            //       // manualFormatController.text =
                            //       //     FlutterLibphonenumber().formatNumberSync(
                            //       //       manualFormatController.text,
                            //       //       country: currentSelectedCountry,
                            //       //       phoneNumberType: globalPhoneType,
                            //       //       phoneNumberFormat: globalPhoneFormat,
                            //       //       inputContainsCountryCode:
                            //       //       inputContainsCountryCode,
                            //       //     );
                            //     },
                            //   ),
                            // ),

                            /// Manually format the phone input
                            // Flexible(
                            //   child: ElevatedButton(
                            //     child: Text(
                            //       'Parse',
                            //       textAlign: TextAlign.center,
                            //     ),
                            //     onPressed: () async {
                            //       try {
                            //         final res =
                            //         await FlutterLibphonenumber().parse(
                            //           manualFormatController.text,
                            //           region:
                            //           currentSelectedCountry.countryCode,
                            //         );
                            //
                            //         JsonEncoder encoder =
                            //         JsonEncoder.withIndent('  ');
                            //
                            //         setState(() =>
                            //         parsedData = encoder.convert(res));
                            //       } catch (e) {
                            //         print(e);
                            //         setState(() => parsedData = null);
                            //       }
                            //     },
                            //   ),
                            // ),
                            // ],
                            // ),

                            Text(parsedData ?? 'Number invalid'),
                          ],
                        ),
                      ),
                    ),

                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
