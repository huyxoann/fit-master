import 'package:fit_master/src/component/primary_button.dart';
import 'package:fit_master/src/features/login/widgets/login_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Center(
              child: Container(
                width: 164,
                height: 164,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo/fitmaster_logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "FIT MASTER",
                  style: textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "#1 Gym Assistant",
                  style: textTheme.headlineSmall,
                ),
              ],
            ),
            Column(
              children: [
                PrimaryButton(
                  label: "Create My Plan",
                  onPressed: () => context.pushNamed('sign-up'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Divider(
                      color: colorScheme.outline,
                    )),
                    Text(
                      "\tHave an account?\t",
                      style: textTheme.bodyMedium,
                    ),
                    Expanded(
                        child: Divider(
                      color: colorScheme.outline,
                    )),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const LoginBottomSheet();
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Click here to login",
                        style: textTheme.bodyMedium,
                      ),
                      Icon(
                        LucideIcons.chevron_right,
                        color: colorScheme.onSurface,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
