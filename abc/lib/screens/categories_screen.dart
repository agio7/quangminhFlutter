import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/store_provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh mục'),
        actions: [
          if (storeProvider.selectedCategory != null)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                storeProvider.setSelectedCategory(null);
              },
              tooltip: 'Xóa bộ lọc',
            ),
        ],
      ),
      body: storeProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : storeProvider.categories.isEmpty
              ? const Center(child: Text('Chưa có danh mục'))
              : RefreshIndicator(
                  onRefresh: () => storeProvider.fetchCategories(),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: storeProvider.categories.length,
                    itemBuilder: (context, index) {
                      final category = storeProvider.categories[index];
                      final isSelected = storeProvider.selectedCategory != null &&
                          storeProvider.selectedCategory!.toLowerCase().trim() == 
                          category.toLowerCase().trim();
                      return Card(
                        color: isSelected ? Colors.indigo[100] : null,
                        child: InkWell(
                          onTap: () {
                            storeProvider.setSelectedCategory(category);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Đã lọc theo danh mục: ${category}'),
                                action: SnackBarAction(
                                  label: 'Xem',
                                  onPressed: () {
                                    // Có thể thêm điều hướng đến Products screen ở đây nếu cần
                                  },
                                ),
                              ),
                            );
                          },
                          child: Center(
                            child: Text(
                              category.toUpperCase(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? Colors.indigo[900]
                                    : Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}


