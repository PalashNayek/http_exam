import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../di/service_locator.dart';
import '../view_models/PostViewModel.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<PostViewModel>(),
      child: Scaffold(
        appBar: AppBar(title: Text('Post')),
        body: Consumer<PostViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (viewModel.post != null) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title: ${viewModel.post!.title}', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8),
                    Text('Body: ${viewModel.post!.body}'),
                  ],
                ),
              );
            }

            return Center(
              child: ElevatedButton(
                onPressed: viewModel.fetchPost,
                child: Text('Fetch Post'),
              ),
            );
          },
        ),
      ),
    );
  }
}