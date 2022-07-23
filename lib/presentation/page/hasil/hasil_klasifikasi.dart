import 'package:flutter/material.dart';
import 'package:genremusik/presentation/page/hasil/model/output_klasifikasi.dart';
import 'package:genremusik/provider/hasil_provider.dart';
import 'package:genremusik/shared/theme.dart';
import 'package:genremusik/widgets/appBar/appbar_title.dart';
import 'package:provider/provider.dart';

class HasilKlasifikasi extends StatefulWidget {
  HasilKlasifikasi({Key? key}) : super(key: key);

  @override
  State<HasilKlasifikasi> createState() => _HasilKlasifikasiState();
}

class _HasilKlasifikasiState extends State<HasilKlasifikasi> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    getDataHasil();
  }

  Future<void> getDataHasil() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<HasilProvider>(context, listen: false).gethasil();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    HasilProvider hasilProvider = Provider.of<HasilProvider>(context);

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
          title: Text(
            "Hasil Klasifikasi",
            style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
          ),
          centerTitle: true,
          backgroundColor: backgroundColor1,
          automaticallyImplyLeading: false,
          elevation: 2),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : OutputKlasifikasi(hasilProvider: hasilProvider),
    );
  }
}
