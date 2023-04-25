// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_demo_news_app/app_settings/resources/app_colors.dart';
import 'package:flutter_demo_news_app/app_settings/resources/app_strings.dart';

class ActionElevatedButton extends StatelessWidget {
  const ActionElevatedButton({
    Key? key,
    // Data
    required this.label,
    this.icon,
    this.isLoading = false,
    this.isOrderSubmitted = false,
    // Actions
    this.onPressed,
  }) : super(key: key);

  // Data
  final String label;
  final Widget? icon;
  final bool isLoading;
  final bool isOrderSubmitted;

  // Actions
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onPressed,
      child: Ink(
        color: AppColors.primaryColor,
        child: SizedBox(
          height: 50.0,
          width: isLoading
              ? 250.0
              : isOrderSubmitted
                  ? 245.0
                  : 144.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: AppColors.white,
                      ),
                    )
                  : icon ?? Container(),
              isLoading
                  ? const Expanded(
                      child: Text(
                        AppStrings.loadingLabelText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 0.8,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 15,
                      ),
                      child: Text(
                        label,
                        style: const TextStyle(
                          letterSpacing: 0.8,
                          color: AppColors.white,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
