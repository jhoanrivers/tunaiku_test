

import 'package:flutter/material.dart';

class ReviewData extends StatelessWidget {


  final String ktpNumber;
  final String namaLengkap;
  final String noRekening;
  final String currentPendidikan;
  final String tanggalLahir;

  final String alamatktp;
  final String tempatTinggal;
  final String provinsi;
  final String blok;



  const ReviewData( this.ktpNumber, this.namaLengkap, this.noRekening, this.currentPendidikan, this.tanggalLahir, this.alamatktp, this.tempatTinggal, this.provinsi, this.blok);




  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        title: Text('Review Data'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),

        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Nomor KTP'),
              Text(ktpNumber,
                style: TextStyle(
                    color: Colors.green,
                  fontSize: 16
                ),)
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Nama Lengkap'),
              Text(namaLengkap,
                style: TextStyle(
                    color: Colors.green,
                  fontSize: 16
                ),)

            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Nomor Rekening'),
              Text(noRekening,
                style: TextStyle(
                    color: Colors.green,
                  fontSize: 16
                ),)

            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Pendidikan'),
              Text(currentPendidikan,
                style: TextStyle(
                    color: Colors.green,
                  fontSize: 16
                ),
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Tanggal Lahir'),
              Text(tanggalLahir,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16
                ),)

            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Alamat KTP'),
              Text(alamatktp,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16
                ),)

            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Tempat Tinggal'),
              Text(tempatTinggal,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16
                ),)

            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Provinsi'),
              Text(provinsi,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16
                ),)
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Blok Rumah'),
              Text(blok,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16
                ),)
            ],
          ),
        ],
      )
    );
  }
}
