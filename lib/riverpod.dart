import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

//PROVIDER
final namaProvider = StateProvider<String>((ref) => "");
final emailProvider = StateProvider<String>((ref) => "");

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormPage(),
    );
  }
}

//UI
class FormPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nama = ref.watch(namaProvider);
    final email = ref.watch(emailProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Form Riverpod")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => ref.read(namaProvider.notifier).state = value,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            TextField(
              onChanged: (value) => ref.read(emailProvider.notifier).state = value,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Nama: $nama, Email: $email")),
                );
              },
              child: Text("Submit"),
            ),
            SizedBox(height: 10),

            Text("Nama: $nama"),
            Text("Email: $email"),
          ],
        ),
      ),
    );
  }
}