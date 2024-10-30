import 'package:fit_master/src/component/neutral_button.dart';
import 'package:fit_master/src/component/primary_button.dart';
import 'package:fit_master/src/component/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class WelcomePage3 extends StatelessWidget {
  const WelcomePage3({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevron_left),
          color: colorScheme.onSurface,
          onPressed: () => context.pop(),
        ),
        title: Text("Chọn loại dữ liệu",
            style: textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: StepProgressIndicator(
              totalSteps: 5,
              roundedEdges: Radius.circular(12),
            ),
          ),
        ),
      ),
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
              children: [
                Text(
                  "Để chúng tôi có thể hiểu rõ hơn về nhu cầu và sở thích của bạn, vui lòng cung cấp cho chúng tôi thêm thông tin chi tiết.",
                  style: textTheme.bodyLarge,
                ),
              ],
            ),
            Column(
              children: [
                PrimaryButton(
                    label: "Tiếp tục",
                    onPressed: () =>
                        context.pushNamed('welcome-choose-gender')),
                SecondaryButton(
                    label: "Nhập dữ liệu từ Inbody", onPressed: () {}),
                NeutralButton(label: "Bỏ qua", onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
