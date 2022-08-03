import 'package:flutter/material.dart';
import 'package:genremusik/provider/hasil_provider.dart';
import 'package:genremusik/shared/theme.dart';

class OutputKlasifikasi extends StatelessWidget {
  const OutputKlasifikasi({
    Key? key,
    required this.hasilProvider,
  }) : super(key: key);

  final HasilProvider hasilProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hasilProvider.hasil[index].file.toUpperCase(),
                  style: primaryTextStyle.copyWith(
                      fontSize: 18, fontWeight: medium),
                ),
                Text(
                  hasilProvider.hasil[index].hasil.toUpperCase(),
                  style: secondaryTextStyle,
                ),
                Divider(
                  color: primaryTextColor,
                )
              ]);
        },
        itemCount: hasilProvider.hasil.length,
      ),
    );
  }
}
