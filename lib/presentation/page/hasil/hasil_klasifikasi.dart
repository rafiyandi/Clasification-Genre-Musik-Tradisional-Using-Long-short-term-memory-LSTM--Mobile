import 'package:flutter/material.dart';
import 'package:genremusik/presentation/page/hasil/model/creeate_pdf.dart';
import 'package:genremusik/presentation/page/hasil/model/output_klasifikasi.dart';
import 'package:genremusik/provider/hasil_provider.dart';
import 'package:genremusik/shared/theme.dart';
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
            actions: [
              IconButton(
                icon: Image.asset(
                  "assets/icon/icon_download.png",
                  color: Colors.white,
                ),
                onPressed: () async {
                  final data = hasilProvider.hasil
                      .map((output) => ["${output.file}", "${output.hasil}"]);
                  final pdfFile = await CreatePdf.generateTable(data.toList());
                  await CreatePdf.openPdf(pdfFile);
                },
              ),
            ],
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context)),
            title: Text(
              "Hasil Klasifikasi",
              style:
                  primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
            ),
            centerTitle: true,
            backgroundColor: backgroundColor1,
            automaticallyImplyLeading: false,
            elevation: 2),
        body: RefreshIndicator(
          onRefresh: getDataHasil,
          backgroundColor: secondaryTextColor,
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          strokeWidth: 3,
          color: whiteColor,
          displacement: 20,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : OutputKlasifikasi(hasilProvider: hasilProvider),
        ));
  }
}
