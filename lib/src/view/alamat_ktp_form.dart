

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_app/src/api_client/repository.dart';
import 'package:registration_app/src/bloc/alamat_ktp_bloc.dart';
import 'package:registration_app/src/bloc/alamat_ktp_event.dart';
import 'package:registration_app/src/bloc/alamat_ktp_state.dart';
import 'package:registration_app/src/model/semua_provinsi.dart';
import 'package:registration_app/src/utils/tempat_tinggal.dart';

class AlamatKtpForm extends StatefulWidget {
  @override
  _AlamatKtpFormState createState() => _AlamatKtpFormState();
}

class _AlamatKtpFormState extends State<AlamatKtpForm> {

  final _alamatKtp = TextEditingController();
  final _blokRumah = TextEditingController();

  AlamatKtpBloc alamatKtpBloc;
  bool validateTempatTinggal = false;
  TempatTinggal tempatTinggal;
  String currentTempatTinggal;
  List<SemuaProvinsi> data;

  @override
  void initState() {
    super.initState();
//    alamatKtpBloc = BlocProvider.of<AlamatKtpBloc>(context);
//    alamatKtpBloc.add(FetchProvinsi());
  }

  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alamat KTP Form'),
      ),
      body: BlocProvider<AlamatKtpBloc>(
        create: (context) => AlamatKtpBloc(repository: Repository())..add(FetchProvinsi()),
        child: BlocBuilder<AlamatKtpBloc,AlamatKtpState>(
          builder: (context, state){


            if(state is AlamatKtpSuccessState){
              data = state.provs;
              print(data);
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
                      validator: _alamatValidate,
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
                      validator: _validateNoBlok,
                    )
                  ],
                ),
                Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(right: 0),
                    child: FlatButton(
                        padding: EdgeInsets.all(10),
                        onPressed: (){
//                         _onButtonAlamatPressed
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('Selesai',
                              style: TextStyle(fontSize: 16),),
                            Icon(Icons.done)
                          ],
                        )
                    )
                ),
              ],

            );
          },
        ),
      )
    );

  }



  String _alamatValidate(String value){
    if(value.isEmpty){
      return '';
    }
    if(value.length > 100){
      return "Alamat KTP tidak boleh lebih dari 100";
    }

  }

  String _validateNoBlok(String value){

    if(value.isEmpty){
      return '';
    }
    if (!value.contains(RegExp(r'[a-zA-Z0-9.-]')))
      return 'Masukkan Blok yang valid';

  }

  _onButtonAlamatPressed(){



  }




}
