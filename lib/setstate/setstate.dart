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
}