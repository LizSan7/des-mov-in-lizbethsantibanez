import 'package:flutter/material.dart';
import 'package:proyectos_flutter/dio/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _api = ApiService();
  List<dynamic> posts = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final result = await _api.getUsers();
    setState(() {
      posts = result;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo con DIO Lizbeth'),),
      body: loading ? Center(child: CircularProgressIndicator(),)
      : ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final item = posts[index];
          return ListTile(
            title: Text(item['name']),
            subtitle: Text(item['email']),
          );
        },
      ),
    );
  }
    
}