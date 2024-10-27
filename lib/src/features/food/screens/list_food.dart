import 'package:flutter/material.dart';

class ListFoodScreen extends StatefulWidget {
  @override
  _ListFoodScreenState createState() => _ListFoodScreenState();
}

class _ListFoodScreenState extends State<ListFoodScreen> {
  String _filter = ''; // Biến lưu trữ bộ lọc
  final TextEditingController _filterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FoodViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Danh Sách Thực Phẩm"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _filterController,
              decoration: InputDecoration(
                hintText: 'Nhập tên thực phẩm để lọc',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _filter = value; // Cập nhật bộ lọc mỗi khi người dùng nhập
                });
              },
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: viewModel.fetchFoodList("your_token_here"), // Gọi hàm lấy dữ liệu
        builder: (context, snapshot) {
          if (viewModel.foodListResponse?.status == Status.LOADING) {
            return Center(child: CircularProgressIndicator());
          } else if (viewModel.foodListResponse?.status == Status.ERROR) {
            return Center(child: Text(viewModel.foodListResponse!.message!));
          } else if (viewModel.foodListResponse?.status == Status.COMPLETED) {
            final foodList = viewModel.foodListResponse!.data?.listFood ?? [];
            // Lọc danh sách thực phẩm dựa trên bộ lọc
            final filteredList = foodList.where((food) {
              return food.foodName.toLowerCase().contains(_filter.toLowerCase());
            }).toList();
            
            return ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final food = filteredList[index];
                return ListTile(
                  title: Text(food.foodName),
                  subtitle: Text(food.categoryFood),
                );
              },
            );
          } else {
            return Center(child: Text("Không có dữ liệu"));
          }
        },
      ),
    );
  }
}
