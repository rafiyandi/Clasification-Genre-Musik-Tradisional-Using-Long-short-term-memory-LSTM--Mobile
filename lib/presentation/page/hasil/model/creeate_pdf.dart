import 'dart:io';
import 'dart:typed_data';

import 'package:genremusik/model/hasil_model.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

// class Users {
//   String? name;
//   int? age;

//   Users(this.age, this.name);
// }

class CreatePdf {
  // final HasilModel hasil;

  // CreatePdf({required this.hasil});

  static Future<File> generateTable(List<List<dynamic>> data) async {
    final pdf = pw.Document();
    final header = ["Nama Musik", "Klasifikasi"];

    // final users = [
    //   Users(18, "jAmes"),
    //   Users(18, "jAmes"),
    //   Users(18, "jAmes"),
    //   Users(18, "jAmes"),
    // ];

    // final data = users.map((user) => [user.name, user.age]).toList();

    pdf.addPage(pw.Page(
        build: (context) => pw.Table.fromTextArray(
              data: data,
              headers: header,
              headerHeight: 2,
              headerStyle: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.black,
              ),
            )));

    return saveDocumet("hasilKlasifikasi.pdf", pdf);
  }

  static Future<File> saveDocumet(
    String name,
    pw.Document pdf,
  ) async {
    Uint8List bytes = await pdf.save();

    //create file null for directory in path_provider
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/$name");

    //write bytes to file
    await file.writeAsBytes(bytes);
    return file;
    //open file
  }

  static Future<void> openPdf(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}
