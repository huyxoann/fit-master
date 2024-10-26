import 'package:fit_master/src/component/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 32,
                    height: 4,
                    child: Divider(
                      color: colorScheme.outline,
                      height: 16,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Đăng nhập bằng",
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: colorScheme.inverseSurface,
                foregroundColor: colorScheme.onInverseSurface,
                alignment: Alignment.centerLeft,
                minimumSize:
                    const Size(double.infinity, 40), // Set the width to maximum
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/icon/google.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Google",
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onInverseSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            PrimaryButton(
              label: 'Email',
              onPressed: () {},
              prefixIcon: LucideIcons.mail,
            ),
          ],
        ),
      ),
    );
  }
}
