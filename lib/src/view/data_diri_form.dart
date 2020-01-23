

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:registration_app/src/bloc/register_bloc.dart';
import 'package:registration_app/src/bloc/register_event.dart';
import 'package:registration_app/src/bloc/register_state.dart';
import 'package:registration_app/src/utils/jenjang_pendidikan.dart';
import 'package:registration_app/src/view/alamat_ktp_form.dart';

class DataDiriForm extends StatefulWidget {
  @override
  _DataDiriFormState createState() => _DataDiriFormState();
}


class _DataDiriFormState extends State<DataDiriForm> {

  DateTime selectedDate = DateTime.now();
  final _ktpNumber = TextEditingController();
  bool _validate = false;
  String _ktpNotValid;
  JenjangPendidikan currentState = JenjangPendidikan.SD;
  String viewModel;
  String _date = "Not set";
  


  @override
  Widget build(BuildContext context) {

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state){
        if(state is DataDiriSuccess){
          if(state.isValidate == true){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>AlamatKtpForm()));
          } else{
            _validate = true;
          }
        }
        if(state is DataDiriError){
          _ktpNotValid = state.dataIsNotValidate;
        }

      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (BuildContext context, RegisterState state) {
          return ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'No KTP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide()
                  )
                ),
                keyboardType: TextInputType.text,
                autocorrect: false,
                autovalidate: true,
                controller: _ktpNumber,
                validator: _validateKtpNum,
              ),

              SizedBox(
                height: 20,
              ),
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
                autovalidate: true,
                controller: _ktpNumber,
                validator: _validateKtpNum,
              ),
              SizedBox(
                height: 10,
              ),

              RaisedButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1),
                      maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                        print('confirm $date');
                        _date = '${date.year} - ${date.month} - ${date.day}';
                        setState(() {});
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 18.0,
                                  color: Colors.black54,
                                ),
                                Text(
                                  " $_date",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  Change",
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),

              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: state is! DataDiriLoading
                    ? _onButtonPressed
                    : null,
                child: Text('Check'),
              )
            ],
          );
        },

      ),
    );

  }

  _onButtonPressed(){
    BlocProvider.of<RegisterBloc>(context).add(
      Submitted(
        ktpNumber: _ktpNumber.text,
      )
    );
  }


  String _validateKtpNum(String value){



    if(double.tryParse(value) == null){

      return "No KTP terdiri dari angka";
    } else if(value.length  != 16){
      return "No KTP harus berjumlah 16 digit";
    } else{
      return null;
    }





  }


}
