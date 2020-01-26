

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_app/src/api_client/repository.dart';
import 'package:registration_app/src/bloc/alamat_ktp_bloc.dart';
import 'package:registration_app/src/bloc/alamat_ktp_event.dart';
import 'package:registration_app/src/view/alamat_ktp_form.dart';

class AlamatKtpScreen extends StatefulWidget {

  final String ktpNumber;
  final String namaLengkap;
  final String nomorRekening;
  final String currentPendidikan;
  final String tanggalLahir;

  AlamatKtpScreen(this.ktpNumber,this.namaLengkap,this.nomorRekening, this.currentPendidikan, this.tanggalLahir);


  @override
  _AlamatKtpScreenState createState() => _AlamatKtpScreenState();
}

class _AlamatKtpScreenState extends State<AlamatKtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alamat KTP Form'),
      ),
      body: BlocProvider<AlamatKtpBloc>(
        create: (context) => AlamatKtpBloc(repository: Repository())..add(FetchProvinsi()),
        child: AlamatKtpForm(widget.ktpNumber,widget.namaLengkap,widget.nomorRekening,widget.currentPendidikan,widget.tanggalLahir),
      ),
    );
  }
}
