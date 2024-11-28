import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderAppBarCanBack extends StatelessWidget {
  const HeaderAppBarCanBack({super.key, required this.title});
  final String title; 

  @override
  Widget build(BuildContext context) {
     var colorTheme = Theme.of(context).colorScheme;
     var textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 58,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Căn các phần tử theo chiều ngang (trái sang phải)
          crossAxisAlignment: CrossAxisAlignment.center, // Căn phần tử theo chiều dọc (giữa)
          children: [
            // Biểu tượng back
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new, 
                  size: 24, 
                  color: colorTheme.onSurface,
                ),
            ),
            // Tiêu đề ở giữa
            Expanded(
              child: Center(
                child: Text(
                  title, 
                  style: textTheme.titleMedium,
                  textAlign: TextAlign.center,  // Đảm bảo văn bản căn giữa
                ),
              ),
            ),
            const SizedBox(width: 20,)
          ],
        ),
      ),
    );
  }
}
