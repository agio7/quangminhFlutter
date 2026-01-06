import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/store_provider.dart';
import '../models/product.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<StoreProvider, ({bool isLoading, List<Product> products, String? category})>(
      selector: (_, store) => (
        isLoading: store.isLoading,
        products: store.products,
        category: store.selectedCategory,
      ),
      builder: (context, data, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              data.category != null ? 'Danh mục: ${data.category}' : 'Sản phẩm',
            ),
            actions: [
              if (data.category != null)
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    context.read<StoreProvider>().setSelectedCategory(null);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Đã xóa bộ lọc')),
                    );
                  },
                  tooltip: 'Xóa bộ lọc',
                ),
            ],
          ),
          body: data.isLoading
              ? const Center(child: CircularProgressIndicator())
              : data.products.isEmpty
                  ? const Center(child: Text('Không có sản phẩm'))
                  : RefreshIndicator(
                      onRefresh: () => context.read<StoreProvider>().fetchProducts(),
                      child: ListView.separated(
                        itemCount: data.products.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          return _ProductListItem(product: data.products[index]);
                        },
                      ),
                    ),
        );
      },
    );
  }
}

class _ProductListItem extends StatelessWidget {
  final Product product;

  const _ProductListItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          product.image,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            width: 60,
            height: 60,
            color: Colors.grey[300],
            child: const Icon(Icons.image_not_supported),
          ),
        ),
      ),
      title: Text(
        product.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        product.category,
        style: TextStyle(color: Colors.grey[600], fontSize: 12),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'edit') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tính năng sửa đang phát triển')),
                );
              } else if (value == 'delete') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tính năng xóa đang phát triển')),
                );
              }
            },
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: 'edit',
                child: Row(
                  children: [
                    Icon(Icons.edit, size: 20),
                    SizedBox(width: 8),
                    Text('Sửa'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete, size: 20, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Xóa', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


