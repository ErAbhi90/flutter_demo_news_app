// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_demo_news_app/app_settings/resources/app_images.dart';
import 'package:flutter_demo_news_app/app_settings/resources/app_sized_box.dart';
import 'package:flutter_demo_news_app/app_settings/resources/app_strings.dart';
import 'package:flutter_demo_news_app/app_settings/router/app_router.dart';
import 'package:flutter_demo_news_app/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_demo_news_app/widgets/buttons/action_elevated_button.dart';

class ErrorScene extends StatelessWidget {
  const ErrorScene({Key? key, this.error}) : super(key: key);

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 4,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppSizedBox.heightBoxXXXLarge,
              Image.asset(
                AppImages.pageNotFound,
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height / 2,
              ),
              AppSizedBox.heightBoxXXLarge,
              Text(
                AppStrings.nothingHere,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3,
              ),
              AppSizedBox.heightBoxSmall,
              Text(
                AppStrings.pageNotFound,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              AppSizedBox.heightBoxLarge,
              ActionElevatedButton(
                label: AppStrings.backToHomePage,
                onPressed: () => AppRouter.goToRoot(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
