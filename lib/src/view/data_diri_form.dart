

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:registration_app/src/bloc/data_diri_bloc.dart';
import 'package:registration_app/src/bloc/data_diri_event.dart';
import 'package:registration_app/src/bloc/data_diri_state.dart';
import 'package:registration_app/src/utils/pendidikan.dart';
import 'package:registration_app/src/utils/validator.dart';
import 'package:registration_app/src/view/alamat_ktp_form.dart';
import 'package:registration_app/src/view/alamat_ktp_screen.dart';

import '../utils/pendidikan.dart';

class DataDiriForm extends StatefulWidget {
  @override
  _DataDiriFormState createState() => _DataDiriFormState();
}


class _DataDiriFormState extends State<DataDiriForm> {

  DateTime selectedDate = DateTime.now();
  bool _validate = false;
  String _ktpNotValid;
  Pendidikan pendidikan;
  String curentPendidikan;
  String _tanggalLahir = "-/ -/ -";
  final _ktpNumber = TextEditingController();
  final _namaLengkap = TextEditingController();
  final _nomorRekening = TextEditingController();

  bool validatePendikan = false;
  bool validateTanggalLahir = false;

  @override
  Widget build(BuildContext context) {

    return BlocListener<DataDiriBloc, DataDiriState>(
      listener: (context, state){
        if(state is DataDiriSuccess){
          if(state.isValidate == true){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                AlamatKtpScreen(_ktpNumber.text,_namaLengkap.text,_nomorRekening.text,curentPendidikan,_tanggalLahir))
            );
          } else{
            _validate = true;
          }
        }
      },
      child: BlocBuilder<DataDiriBloc, DataDiriState>(
        builder: (BuildContext context, DataDiriState state) {
          return ListView(
            padding: const EdgeInsets.all(20),
            children : <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'No. KTP',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide()
                        )
                    ),
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    autovalidate: true,
                    autofocus: false,
                    controller: _ktpNumber,
                    validator: Validator.validateKtpNum,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Nama Lengkap
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide()
                        )
                    ),
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    autofocus: false,
                    autovalidate: true,
                    controller: _namaLengkap,
                    validator: Validator.validateCompleteName,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Nama Lengkap
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Nomor Rekening',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide()
                        )
                    ),
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    autofocus: false,
                    autovalidate: true,
                    controller: _nomorRekening,
                    validator: Validator.validateNoRekening,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
//                      FocusScope.of(context).requestFocus(FocusNode());
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InputDecorator(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0.0),
                              labelText: 'Pendidikan',
                              errorText: validatePendikan ? "Required" : null,
                            ),
                            child: DropdownButtonHideUnderline(
                              child:DropdownButton<Pendidikan>(
                                hint: Text('Pilih Pendidikan'),
                                value: pendidikan,
                                elevation: 1,
                                items: Pendidikan.values.map((value){
                                  String tempPendidikan = enumToPendidikan(value);
                                  return DropdownMenuItem<Pendidikan>(
                                    child: Text(tempPendidikan),
                                    value: value,
                                  );
                                }).toList(),
                                onChanged: (Pendidikan value) {
                                  setState(() {
                                    curentPendidikan = enumToPendidikan(value);
                                    pendidikan = value;
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
//                      FocusScope.of(context).requestFocus(FocusNode());
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InputDecorator(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0.0),
                                labelText: 'Tanggal Lahir',
                                errorText: validateTanggalLahir ? "Required" : null
                            ),
                            child:  InkWell(
                              child: Text(_tanggalLahir,
                                style: TextStyle(
                                  fontSize: 16,
                                ),),
                              onTap: (){
                                DatePicker.showDatePicker(context,
                                    theme: DatePickerTheme(
                                      containerHeight: 210.0,
                                    ),
                                    showTitleActions: true,
                                    minTime: DateTime(1950, 1, 1),
                                    maxTime: DateTime(2012, 12, 31), onConfirm: (date) {
//                                print('confirm $date');
                                      _tanggalLahir = '${date.day}/ ${date.month}/ ${date.year}';
                                      setState(() {});
                                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(right: 0),
                    child: FlatButton(
                      padding: EdgeInsets.all(10),
                      onPressed: _onButtonPressed,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('Selanjutnya',
                            style: TextStyle(fontSize: 16),),
                          Icon(Icons.navigate_next)
                        ],
                      )
                    )
                  ),
                ],
              )
            ]
          );
        },

      ),
    );

  }



  _onButtonPressed(){

    curentPendidikan == null
        ? validatePendikan = true
        : validatePendikan = false;

    _tanggalLahir== "-/ -/ -"
        ? validateTanggalLahir = true
        : validateTanggalLahir = false;

    BlocProvider.of<DataDiriBloc>(context).add(
      Submitted(
        ktpNumber: _ktpNumber.text,
        tanggalLahir: _tanggalLahir,
        namaLengkap: _namaLengkap.text,
        pendidikan: curentPendidikan,
        noRekening: _nomorRekening.text,
      )
    );
  }




}
