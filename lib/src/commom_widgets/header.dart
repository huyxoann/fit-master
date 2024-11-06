import 'package:fit_master/src/commom_widgets/search.dart';
import 'package:fit_master/src/core/constants/app_info.dart';
import 'package:flutter/material.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 104,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 44,
                  width: 44,
                  child: Image.asset("assets/images/logo.png"),
                ),
                Container(
                  color: colorTheme.surface,
                  height: 40,
                  width: 32,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                        width: 22,
                        child: Image.asset("assets/images/steak.png"),
                      ),
                      Text(
                        "5",
                        style: TextStyle(color: colorTheme.onSurface, fontSize: 8),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 16,),
            SearchWidget()
          ],
        ),
      ),
    );
  }
}
