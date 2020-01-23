

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_app/src/bloc/register_bloc.dart';
import 'package:registration_app/src/view/data_diri_form.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Data Diri Form'),
        ),
        body: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
          child: DataDiriForm(),
        )
    );
  }
}
