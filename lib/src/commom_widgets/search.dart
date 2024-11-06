import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  
  const SearchWidget({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;

    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorTheme.surfaceBright, // Màu surface-bright từ theme
        borderRadius: BorderRadius.circular(20), // Góc bo tròn
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: colorTheme.onSurface, // Màu icon tùy chọn
            size: 20,
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: TextField(
                onChanged: onChanged,
                
                decoration: const InputDecoration(
                  hintText: 'Tìm kiếm...',
                  border: InputBorder.none,
                ),
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: colorTheme.onSurface, // Màu chữ tùy thuộc vào theme
                  
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
