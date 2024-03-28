import 'package:complex_ui_review/core/country_picker_local/country_picker.dart';
import 'package:flutter/material.dart';

class SelectCountyScreen extends StatefulWidget {
  const SelectCountyScreen({super.key});

  @override
  State<SelectCountyScreen> createState() => _SelectCountyScreenState();
}

class _SelectCountyScreenState extends State<SelectCountyScreen> {
  Country? selectedCountry;
  String? countryEmoji;
  String? countryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          showSearch: false,
                          showPhoneCode: true,
                          useSafeArea: true,
                          countryListTheme: CountryListThemeData(
                            flagSize: 25,
                            backgroundColor: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                            bottomSheetHeight: 350,
                            bottomSheetWidth: 120,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                20,
                                100,
                                MediaQuery.sizeOf(context).width -
                                    130 -
                                    20 -
                                    50,
                                20),
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            borderRadius: BorderRadius.circular(10),
                            inputDecoration: InputDecoration(
                              labelText: 'Search',
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              hintText: 'Start typing to search',
                              // prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      const Color(0xFF8C98A8).withOpacity(0.2),
                                ),
                              ),
                            ),
                          ),
                          onSelect: (value) {
                            selectedCountry = value;
                            countryName = value.name;
                            debugPrint(
                                Country.tryParse(value.name)?.name ?? '');
                            setState(() {});
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            if (selectedCountry == null) ...[
                              Transform.translate(
                                offset: const Offset(0, 7),
                                child: const Text(
                                  "- - -",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ] else ...[
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      selectedCountry?.flagEmoji ?? '',
                                      style: const TextStyle(
                                        fontSize: 21,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    if (selectedCountry!.phoneCode.length >
                                        2) ...[
                                      Expanded(
                                        child: FittedBox(
                                          child: Text(
                                            selectedCountry?.phoneCode ?? '',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ] else ...[
                                      Expanded(
                                        child: Text(
                                          selectedCountry?.phoneCode ?? '',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ]
                                  ],
                                ),
                              ),
                            ],
                            const SizedBox(
                              width: 4,
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              if (selectedCountry != null)
                Text(
                  "${Country.tryParse(countryName ?? "")?.name}",
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
