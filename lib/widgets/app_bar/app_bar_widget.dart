// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_demo_news_app/app_settings/resources/app_colors.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? appBarActions;
  final bool isBackButtonRequired;
  final String title;

  const AppBarWidget({
    Key? key,
    this.appBarActions,
    this.isBackButtonRequired = false,
    this.title = '',
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarBgColor,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: isBackButtonRequired
          ? Row(
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: const Icon(
                    Icons.chevron_left,
                    color: AppColors.white,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      top: 9.0,
                      bottom: 9.0,
                      left: 8.0,
                    ),
                    child: Text(title)),
              ],
            )
          : Padding(
              padding: const EdgeInsets.only(
                top: 9.0,
                bottom: 9.0,
                left: 38.0,
              ),
              child: Text(title)),
      actions: appBarActions,
    );
  }
}
