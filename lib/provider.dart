import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FormProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormPage(),
    );
  }
}

//MODEL
class FormProvider extends ChangeNotifier {
  String nama = "";
  String email = "";

  void setNama(String value) {
    nama = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }
}

//UI
class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final form = Provider.of<FormProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Form Provider")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: form.setNama,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            TextField(
              onChanged: form.setEmail,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(//content: Text("Nama: ${form.nama}, Email: ${form.email}")
                  content: Text("Submit Sukses!"),
                  )
                );
              },
              child: Text("Submit"),
            ),
            SizedBox(height: 10),

            Text("Nama: ${form.nama}"),
            Text("Email: ${form.email}"),
          ],
        ),
      ),
    );
  }
}