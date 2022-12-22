import 'package:flutter/material.dart';
import 'package:tapshyrma_9/app/constants/app_colors/app_colors.dart';
import 'package:tapshyrma_9/app/constants/app_text_style/app_text_style.dart';
import 'package:tapshyrma_9/app/constants/app_texts/app_texts.dart';
import 'package:tapshyrma_9/data/service/service_weather.dart';

import '../../../data/model/model_weather.dart';
import '../widgets/chip_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/bg.jpg'),
          ),
        ),
        child: Scaffold(
          backgroundColor: AppColors.tranColor,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: AppColors.tranColor,
            leading: const Icon(Icons.menu),
            centerTitle: true,
            title: const ChipTextWidget(
              titleText: AppTexts.weather_app,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  child: Text(
                    AppTexts.country,
                    style: AppTextStyles.whiteColor30,
                  ),
                ),
                FutureBuilder(
                  future: ServiceWeather.getWeather(),
                  builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error Service'),
                      );
                    } else {
                      var data = snapshot.data;

                      return Column(
                        children: [
                          Text(
                            data!.name! + AppTexts.osh,
                            style: AppTextStyles.whiteColor30,
                          ),
                          Text(
                            data.main!.temp.toStringAsFixed(1),
                            style: AppTextStyles.whiteColor30,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
