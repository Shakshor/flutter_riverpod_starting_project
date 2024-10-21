import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_starting_project/providers/lines_provider.dart';
import 'package:flutter_riverpod_starting_project/repository/lines_repo.dart';


class LinesScreen extends ConsumerStatefulWidget {
  const LinesScreen({super.key});

  @override
  ConsumerState<LinesScreen> createState() => _LinesScreenState();
}

class _LinesScreenState extends ConsumerState<LinesScreen> {
  
  @override
  Widget build(BuildContext context) {
    // final linesRepo = ref.watch(linesRepoProvider);
    final linesAsyncProvider = ref.watch(linesNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(
       title: Text('Lines Screen'),
        centerTitle: true,
      ),
      body: linesAsyncProvider.when(
        data: (lines) => ListView.builder(
          itemCount: lines.length,
          itemBuilder: (context, index) {
            log('inside_lines_screen: ${lines[0]['lines']}');
            final line = lines[0]['lines'][index];
            return ListTile(
              title: Text(line),
            );
            // return Container();
          },
        ),
        loading: () => Center(
            child: CircularProgressIndicator()
        ),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
