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