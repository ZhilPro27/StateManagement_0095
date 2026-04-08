import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FormEvent {}

class NamaChanged extends FormEvent {
  final String nama;
  NamaChanged(this.nama);
}

class EmailChanged extends FormEvent {
  final String email;
  EmailChanged(this.email);
}

//STATE
class FormState {
  final String nama;
  final String email;

  FormState({this.nama = "", this.email = ""});
}

//BLOC
class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(FormState()) {
    on<NamaChanged>((event, emit) {
      emit(FormState(nama: event.nama, email: state.email));
    });

    on<EmailChanged>((event, emit) {
      emit(FormState(nama: state.nama, email: event.email));
    });
  }
}

//UI
class FormPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Bloc")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<FormBloc, FormState>(
          builder: (context, state) {
            return Column(
              children: [
                TextField(
                  onChanged: (value) => context.read<FormBloc>().add(NamaChanged(value)),
                  decoration: InputDecoration(labelText: "Nama"),
                ),
                TextField(
                  onChanged: (value) => context.read<FormBloc>().add(EmailChanged(value)),
                  decoration: InputDecoration(labelText: "Email"),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(//content: Text("Nama: ${state.nama}, Email: ${state.email}"
                      content: Text("Sumbit Sukses!"),
                      )
                    );
                  }, 
                  child: Text("Submit"),
                ),
                SizedBox(height: 10),

                Text("Nama: ${state.nama}"),
                Text("Email: ${state.email}"),
              ],
            );
          },
        ),
      ),
    );
  }
}