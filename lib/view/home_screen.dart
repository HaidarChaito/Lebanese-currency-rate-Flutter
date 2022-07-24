import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';

import 'package:lirarate/controller/home_controller.dart';

import 'package:lirarate/shared/app_assets.dart';
import 'package:lirarate/shared/app_colors.dart';
import 'package:lirarate/shared/app_strings.dart';
import 'package:lirarate/shared/constants.dart';

import 'package:lirarate/widgets/bottom_card.dart';
import 'package:lirarate/widgets/fuel_data_row.dart';
import 'package:lirarate/widgets/hero_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: AppColors.kPrimaryBlue,
      appBar: AppBar(
        title: Center(
            child: Text(
          AppStrings.kAppBarTitle,
          style: AppTextStyles.kAppBarTitle,
        )),
        backgroundColor: AppColors.kPrimaryBlue,
        elevation: 0,
      ),
      body: Obx(
        () => _controller.isOffline.value
            ? const Scaffold(
                body: Center(child: Text('No Internet connection.')),
              )
            : _controller.isLoading.value
                ? const SpinKitSpinningLines(color: AppColors.kSplashScreen)
                : LayoutBuilder(
                    builder: (context, constraints) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(AppSize.d20),
                            child: HeroCard(
                              width: constraints.maxWidth,
                              height: constraints.maxHeight * 0.42,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: constraints.maxHeight * 0.03,
                                  ),
                                  Lottie.asset(
                                    AppAssets.kDollarAnimated,
                                    fit: BoxFit.fill,
                                    width: AppSize.d50,
                                    height: AppSize.d50,
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * 0.03,
                                  ),
                                  Text(
                                    'Buy : ${_controller.data?.buyPrice}',
                                    style: AppTextStyles.kMainTextStyleWhite,
                                  ),
                                  SizedBox(
                                      height: constraints.maxHeight * 0.04,
                                      width: constraints.maxWidth * 0.4,
                                      child: const Divider(
                                        color: AppColors.kDividerColor,
                                        thickness: 3,
                                      )),
                                  Text(
                                    'Sell : ${_controller.data?.sellPrice}',
                                    style: AppTextStyles.kMainTextStyleWhite,
                                  ),
                                  SizedBox(
                                      height: constraints.maxHeight * 0.04,
                                      width: constraints.maxWidth * 0.4,
                                      child: const Divider(
                                        color: AppColors.kDividerColor,
                                        thickness: 3,
                                      )),
                                  Text(
                                    'Sayrafa : ${_controller.data?.sayrafa}',
                                    style: AppTextStyles.kMainTextStyleWhite,
                                  ),
                                  Text(
                                    "${_controller.data?.rateCurrentTime}",
                                    style: AppTextStyles.kCurrentTime,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: constraints.maxHeight * 0.065,
                                child: Lottie.asset(AppAssets.kFuelAnimated),
                              ),
                              IconButton(
                                splashRadius: AppSize.d20,
                                onPressed: () {
                                  _controller.fetchData();
                                },
                                icon: const Icon(
                                  Icons.refresh,
                                  color: AppColors.kSecondaryWhite,
                                ),
                              )
                            ],
                          ),
                          Text(
                            "${_controller.data?.gasCurrentTime}",
                            style: AppTextStyles.kCurrentTime,
                          ),
                          BottomCard(
                            child: [
                              FuelDataRow(
                                  name: 'UNL98: ',
                                  price: "${_controller.data?.unl98Price}"),
                              FuelDataRow(
                                  name: 'UNL95: ',
                                  price: "${_controller.data?.unl95Price}"),
                              FuelDataRow(
                                  name: 'Disel: ',
                                  price: "${_controller.data?.diselPrice}"),
                              FuelDataRow(
                                  name: 'Gas: ',
                                  price: "${_controller.data?.gasPrice}"),
                            ],
                            width: constraints.maxWidth,
                            height: constraints.maxHeight * 0.395,
                          ),
                        ],
                      );
                    },
                  ),
      ),
    );
  }
}
