import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class DaftarLayanan extends HookConsumerWidget {
  const DaftarLayanan({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  right: 20,
                  bottom: 15,
                  left: 20,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                ),
                child: Column(
                  children: [
                    TextFormFieldInput(
                      readOnly: true,
                      onTap: () {},
                      placeHolder: 'Cari paket/layanan',
                      suffixIcon: const Icon(
                        Icons.search,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 60,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                'Semua',
                                style: TextStyle(
                                  color: AppColors.textWhite,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 60,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                'Tes',
                                style: TextStyle(
                                  color: AppColors.textWhite,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 60,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                'Paket',
                                style: TextStyle(
                                  color: AppColors.textWhite,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: AppColors.textWhite,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                AppStyle.boxShadow,
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'Paket 1',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: AppColors.textWhite,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                AppStyle.boxShadow,
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'Paket 2',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: AppColors.textWhite,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                AppStyle.boxShadow,
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'Paket 1',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: AppColors.textWhite,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                AppStyle.boxShadow,
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'Paket 2',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: AppColors.textWhite,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                AppStyle.boxShadow,
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'Paket 1',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: AppColors.textWhite,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                AppStyle.boxShadow,
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'Paket 2',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: AppColors.textWhite,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                AppStyle.boxShadow,
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'Paket 1',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: AppColors.textWhite,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                AppStyle.boxShadow,
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'Paket 2',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: AppColors.textWhite,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                AppStyle.boxShadow,
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'Paket 1',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: AppColors.textWhite,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                AppStyle.boxShadow,
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'Paket 2',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
