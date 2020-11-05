import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxTitle extends StatelessWidget {
  const BoxTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 320.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(23.0),
        color: Color(0xFF393737),
        border: Border.all(
          color: Color(0xFFFFFFFF),
          width: 3.0,
        ),
      ),
      child: Center(
        child: Text(
          'Lịch Sử Việt Nam',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(fontSize: 37.0, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
