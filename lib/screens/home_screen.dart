import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lirarate/models/data_handler.dart';
import 'package:lirarate/shared/app_assets.dart';
import 'package:lirarate/shared/app_colors.dart';
import 'package:lirarate/shared/app_strings.dart';
import 'package:lirarate/shared/constants.dart';
import 'package:lirarate/widgets/bottom_card.dart';
import 'package:lirarate/widgets/fuel_data_row.dart';
import 'package:lirarate/widgets/hero_card.dart';
import 'package:flutter/services.dart';

import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<DataHandler>(context, listen: false).initRateGrabber();
    Provider.of<DataHandler>(context, listen: false).initFuelGrabber();
  }

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
      body: Provider.of<DataHandler>(context).fuelGrabber.fuelData.unl98Price ==
                  '0' ||
              Provider.of<DataHandler>(context).rateGrabber.rateData.buyPrice ==
                  '0p'
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
                              'Buy : ${Provider.of<DataHandler>(context).rateGrabber.rateData.buyPrice}',
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
                              'Sell : ${Provider.of<DataHandler>(context).rateGrabber.rateData.sellPrice}',
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
                              'Sayrafa : ${Provider.of<DataHandler>(context).rateGrabber.rateData.sayrafa}',
                              style: AppTextStyles.kMainTextStyleWhite,
                            ),
                            Text(
                              Provider.of<DataHandler>(context)
                                  .rateGrabber
                                  .rateData
                                  .currentTime,
                              style: AppTextStyles.kCurrentTime,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.065,
                      child: Lottie.asset('resources/animations/fuel.json'),
                    ),
                    Text(
                      Provider.of<DataHandler>(context)
                          .fuelGrabber
                          .fuelData
                          .currentTime,
                      style: AppTextStyles.kCurrentTime,
                    ),
                    BottomCard(
                      child: [
                        FuelDataRow(
                            name: 'UNL98: ',
                            price: Provider.of<DataHandler>(context)
                                .fuelGrabber
                                .fuelData
                                .unl98Price),
                        FuelDataRow(
                            name: 'UNL95: ',
                            price: Provider.of<DataHandler>(context)
                                .fuelGrabber
                                .fuelData
                                .unl95Price),
                        FuelDataRow(
                            name: 'Disel: ',
                            price: Provider.of<DataHandler>(context)
                                .fuelGrabber
                                .fuelData
                                .diselPrice),
                        FuelDataRow(
                            name: 'Gas: ',
                            price: Provider.of<DataHandler>(context)
                                .fuelGrabber
                                .fuelData
                                .gasPrice),
                      ],
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.41,
                    ),
                  ],
                );
              },
            ),
    );
  }
}
