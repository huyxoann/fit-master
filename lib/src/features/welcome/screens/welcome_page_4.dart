import 'package:fit_master/core/enum/gender_enum.dart';
import 'package:fit_master/src/component/neutral_button.dart';
import 'package:fit_master/src/component/primary_button.dart';
import 'package:fit_master/src/component/secondary_button.dart';
import 'package:fit_master/src/features/welcome/widgets/gender_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class WelcomePage4 extends StatefulWidget {
  @override
  _WelcomePage4State createState() => _WelcomePage4State();
}

class _WelcomePage4State extends State<WelcomePage4> {
  GenderEnum _gender = GenderEnum.Male;
  int selectedCardIndex = -1;

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
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Bạn là... ?",
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: colorScheme.surfaceBright,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "“Giúp chúng tôi thiết kế lộ trình khớp với tỉ lệ trao chất của cơ thể.",
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:
                      3 / 4, // Adjust the aspect ratio to fit the child size
                ),
                itemCount: 2,
                itemBuilder: (context, index) {
                  GenderEnum gender;
                  if (index == 0) {
                    gender = GenderEnum.Male;
                  } else {
                    gender = GenderEnum.Female;
                  }
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCardIndex = index;
                        _gender = gender;
                      });
                    },
                    child: Card(
                      color: selectedCardIndex == index
                          ? colorScheme.primaryContainer
                          : colorScheme.surfaceBright,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: selectedCardIndex == index
                              ? colorScheme.outline
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: GenderSelectionCard(
                        gender: gender,
                      ),
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                PrimaryButton(
                    label: "Tiếp tục",
                    onPressed: selectedCardIndex != -1 ? () {} : null),
              ],
            ),
          ],
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //       Container(
      //         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(12),
      //           color: colorScheme.surfaceBright,
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               "“Giúp chúng tôi thiết kế lộ trình khớp với tỉ lệ trao chất của cơ thể.",
      //               style: textTheme.bodyLarge,
      //             ),
      //           ],
      //         ),
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           Expanded(
      //             child: ListTile(
      //               title: GenderSelectionCard(gender: GenderEnum.Male),
      //               trailing: Radio<GenderEnum>(
      //                 value: GenderEnum.Male,
      //                 groupValue: _gender,
      //                 onChanged: (GenderEnum? value) {
      //                   setState(() {
      //                     _gender = value!;
      //                   });
      //                 },
      //               ),
      //             ),
      //           ),
      //           Expanded(
      //             child: ListTile(
      //               title: GenderSelectionCard(gender: GenderEnum.Female),
      //               trailing: Radio<GenderEnum>(
      //                 value: GenderEnum.Female,
      //                 groupValue: _gender,
      //                 onChanged: (GenderEnum? value) {
      //                   setState(() {
      //                     _gender = value!;
      //                   });
      //                 },
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       Column(
      //         children: [
      //           PrimaryButton(label: "Tiếp tục", onPressed: () {}),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
