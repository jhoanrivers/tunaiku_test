

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_app/src/api_client/repository.dart';
import 'package:registration_app/src/bloc/alamat_ktp_bloc.dart';
import 'package:registration_app/src/bloc/alamat_ktp_event.dart';
import 'package:registration_app/src/bloc/alamat_ktp_state.dart';
import 'package:registration_app/src/model/semua_provinsi.dart';
import 'package:registration_app/src/utils/tempat_tinggal.dart';
import 'package:registration_app/src/utils/validator.dart';
import 'package:registration_app/src/view/review_data.dart';

class AlamatKtpForm extends StatefulWidget {

  final String ktpNumber;
  final String namaLengkap;
  final String nomorRekening;
  final String currentPendidikan;
  final String tanggalLahir;

  AlamatKtpForm(this.ktpNumber, this.namaLengkap, this.nomorRekening, this.currentPendidikan, this.tanggalLahir);


  @override
  _AlamatKtpFormState createState() => _AlamatKtpFormState();
}

class _AlamatKtpFormState extends State<AlamatKtpForm> {

  var _alamatKtp = TextEditingController();
  var _blokRumah = TextEditingController();

  AlamatKtpBloc alamatKtpBloc;
  bool validateTempatTinggal = false;
  TempatTinggal tempatTinggal;
  String currentTempatTinggal;
  String dropdownValue;
  List<SemuaProvinsi> data;
  var _updateProvinsi;

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BlocListener<AlamatKtpBloc, AlamatKtpState>(
      listener: (BuildContext context, AlamatKtpState state) {

        if(state is AlamatKtpAfterDataValidState)
          if(state.isValide == true){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                ReviewData(widget.ktpNumber,
                  widget.namaLengkap,
                  widget.nomorRekening,
                  widget.currentPendidikan,
                  widget.tanggalLahir,
                  _alamatKtp.text,
                  currentTempatTinggal,
                  _updateProvinsi,
                  _blokRumah.text

                )));
          }
      },
      child: BlocBuilder<AlamatKtpBloc,AlamatKtpState>(
        builder: (context, state){

          if(state is AlamatKtpSuccessState){
            data = state.provs;
          }

          if(state is AlamatKtpLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            padding: EdgeInsets.all(20),
            children: <Widget>[
              Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Alamat KTP',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide()
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    maxLines: 3,
                    autovalidate: true,
                    controller: _alamatKtp,
                    validator: Validator.alamatValidate,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InputDecorator(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0.0),
                              labelText: 'Tempat Tinggal',
                              errorText: validateTempatTinggal
                                  ? "Required"
                                  : null,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<TempatTinggal>(
                                hint: Text('Pilih tempat tinggal'),
                                value: tempatTinggal,
                                elevation: 1,
                                items: TempatTinggal.values.map((value) {
                                  String tempTempatTinggal = enumToTempatTinggal(
                                      value);
                                  return DropdownMenuItem<TempatTinggal>(
                                    child: Text(tempTempatTinggal),
                                    value: value,
                                  );
                                }).toList(),
                                onChanged: (TempatTinggal value) {
                                  setState(() {
                                    currentTempatTinggal =
                                        enumToTempatTinggal(value);

//                                        print(currentTempatTinggal);
                                    tempatTinggal = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InputDecorator(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0.0),
                              labelText: 'Provinsi',
                              errorText: validateTempatTinggal
                                  ? "Required"
                                  : null,
                            ),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Text('Pilih provinsi'),
                                  value: dropdownValue,
                                  items: data.map<DropdownMenuItem<String>>((value){
                                    return new DropdownMenuItem(
                                      child: new Text(value.nama),
                                      value: value.toString(),
                                    );
                                  }
                                  ).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                      _updateProvinsi= dropdownValue.substring(20,dropdownValue.length-1);
                                      print(_updateProvinsi);
                                    });
                                  },
                                )
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'No. Blok',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide()
                        )
                    ),
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    autovalidate: true,
                    autofocus: false,
                    controller: _blokRumah,
                    validator: Validator.validateNoBlok,
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),

              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.green,

                  padding: EdgeInsets.all(12),
                  onPressed: _onButtonAlamatPressed,
                  child: Text('Selesai',
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  ),
                ),
              ),

            ],

          );
        },
      ),

    );

  }

  _onButtonAlamatPressed(){



    BlocProvider.of<AlamatKtpBloc>(context).add(SubmittedAlamat(
        noBlok: _blokRumah.text,
        tempatTinggal: currentTempatTinggal,
        provinsi: _updateProvinsi,
        alamatKtp: _alamatKtp.text
    ));


  }




}
