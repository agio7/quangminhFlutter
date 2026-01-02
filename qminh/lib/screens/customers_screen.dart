import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/store_provider.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Khách hàng'),
      ),
      body: storeProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : storeProvider.users.isEmpty
              ? const Center(child: Text('Chưa có khách hàng'))
              : RefreshIndicator(
                  onRefresh: () => storeProvider.fetchUsers(),
                  child: ListView.builder(
                    itemCount: storeProvider.users.length,
                    itemBuilder: (context, index) {
                      final user = storeProvider.users[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.indigo,
                            child: Text(
                              user.fullName[0].toUpperCase(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            user.fullName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(user.email),
                          trailing: const Icon(Icons.chevron_right),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}


