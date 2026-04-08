import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}
class _FormPageState extends State<FormPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String hasil = "";

  void submitData(){
    setState(() {
      hasil = "Nama: ${namaController.text}, Email: ${emailController.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Input"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: "Nama", border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitData,
              child: Text("Submit"),
            ),
            SizedBox(height: 20),
            Text(
              hasil,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      )
    );
  }
}