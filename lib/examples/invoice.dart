import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/src/widgets/basic.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';
import '../data.dart';

Future<Uint8List> generateInvoice(
    PdfPageFormat pageFormat, CustomData data) async {
  String uuid = Uuid().v1();
  final String invoiceID = (uuid);

  final ByteData imageData = await rootBundle.load('invoice_background.jpg');
  final Uint8List backgroundImage = imageData.buffer.asUint8List();
  // final Uint8List qrImageData = generateQRCodeImage(invoiceID);
  final invoice = Invoice(
    numberOfShares: 500, // Increased number of shares
    clientTitle: 'Dr.', // Changed title
    clientName: 'Aster Gebremariam Weldemariam', // Changed name
    clientCompany: 'Beta Solutions', // Changed company
    clientCitizenship: 'Ethiopia', // Added details
    clientRegion:
        'Benishangul', // Changed city (assuming international investor)
    clientCity: 'Addis Ababa', // Changed city (assuming international investor)
    clientSubCity: 'Kolfe Keraniyo', // Added sub-city
    clientWoreda: 'N/A', // Adjusted for US location
    clientKebele: 'N/A', // Adjusted for US location
    clientPhone: '+251 9 112 334 55', // US phone number format
    clientEmail: 'aster.gebremariam@betasolutions.com', // Added domain to email
    invoiceNumber: invoiceID,
    baseColor: PdfColors.blue,
    accentColor: PdfColors.yellow900,
    companyInfo: CompanyInfo(
      companyName: 'FinTech Inc.', // Changed company name
      companyAddress: 'Tito Str , AA, ET', // Changed address
      contactNumber: '+1 650-999-8888', // US phone number format
      email: 'investor.relations@fintechinc.com', // Added domain to email
      website: 'www.fintechinc.com', // Added website
      paymentInstructions:
          'Payment instructions: Wire transfer or ACH. Details on back side.',
      pricepershare: 5000, // Updated instructions
    ),
  );

  return await invoice.buildPdf(pageFormat, backgroundImage);
}

class CompanyInfo {
  final String companyName;
  final String companyAddress;
  final String contactNumber;
  final double pricepershare;
  final String email;
  final String website;
  final String paymentInstructions;

  CompanyInfo({
    required this.companyName,
    required this.pricepershare,
    required this.companyAddress,
    required this.contactNumber,
    required this.email,
    required this.website,
    required this.paymentInstructions,
  });
}

class Invoice {
  final int numberOfShares;
  final String clientTitle;
  final String clientName;
  final String clientCompany;
  final String clientCitizenship;
  final String clientCity;
  final String clientRegion;
  final String clientSubCity;
  final String clientWoreda;
  final String clientKebele;
  final String clientPhone;
  final String clientEmail;
  final String invoiceNumber;
  final CompanyInfo companyInfo;
  final PdfColor baseColor;
  final PdfColor accentColor;

  Invoice({
    required this.companyInfo,
    required this.numberOfShares,
    required this.clientTitle,
    required this.clientName,
    required this.clientCompany,
    required this.clientCitizenship,
    required this.clientCity,
    required this.clientRegion,
    required this.clientSubCity,
    required this.clientWoreda,
    required this.clientKebele,
    required this.clientPhone,
    required this.clientEmail,
    required this.invoiceNumber,
    required this.baseColor,
    required this.accentColor,
  });
  static const _darkColor = PdfColors.blueGrey800;
  static const _lightColor = PdfColors.white;

  PdfColor get _baseTextColor => baseColor.isLight ? _lightColor : _darkColor;

  PdfColor get _accentTextColor => baseColor.isLight ? _lightColor : _darkColor;
  Future<Uint8List> buildPdf(
      PdfPageFormat pageFormat, Uint8List backgroundImage) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageTheme: _buildTheme(
          PdfPageFormat.a4,
          await PdfGoogleFonts.montserratRegular(),
          await PdfGoogleFonts.montserratBold(),
          await PdfGoogleFonts.montserratItalic(),
          backgroundImage,
        ),
        build: (context) => [
          _contentHeader(context),
          pw.SizedBox(height: 20),
          // _contentFooter(context),
          pw.SizedBox(height: 20),
          // _termsAndConditions(context),
        ],
      ),
    );

    return pdf.save();
  }

  pw.PageTheme _buildTheme(
    PdfPageFormat pageFormat,
    pw.Font base,
    pw.Font bold,
    pw.Font italic,
    Uint8List backgroundImage,
  ) {
    return pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      orientation: pw.PageOrientation.portrait,
      theme: pw.ThemeData.withFont(
        base: base,
        bold: bold,
        italic: italic,
      ),
      buildBackground: (context) => pw.FullPage(
        ignoreMargins: true,
        child: pw.Image(pw.MemoryImage(backgroundImage), fit: pw.BoxFit.cover),
      ),
    );
  }

  pw.Widget _contentHeader(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Center(
          child: pw.Text(
            companyInfo.companyName,
            style: pw.TextStyle(
              fontSize: 20,
              fontWeight: pw.FontWeight.bold,
              color: baseColor,
            ),
          ),
        ),
        pw.SizedBox(height: 25),
        pw.Container(
            child: pw.Row(children: [
          pw.SizedBox(width: 300),
          pw.Text(
            invoiceNumber,
            style: pw.TextStyle(
              fontSize: 10,
              fontWeight: pw.FontWeight.bold,
              color: baseColor,
            ),
          ),
        ])),
        pw.SizedBox(height: 35),
        _buildClientInfo(),
        pw.SizedBox(height: 13),
        _buildAddressSection(),
        pw.SizedBox(height: 6),
        _buildShareDetail(),
      ],
    );
  }

  pw.Widget _buildClientInfo() {
    double widthVal;
    if (clientName.length >= 25) {
      widthVal = 150;
    } else if (clientName.length < 20 && clientName.length >= 15) {
      widthVal = 200;
    } else if (clientName.length <= 15) {
      widthVal = 300;
    } else {
      widthVal = 250;
    }
    return pw.Row(
      children: [
        pw.SizedBox(width: 15),
        pw.Text(
          clientTitle,
          // style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(width: 20),
        pw.Text(
          clientName,
        ),
        pw.SizedBox(width: widthVal),
        pw.Text(clientCitizenship),
      ],
    );
  }

  pw.Widget _buildAddressSection() {
    double widthVal;
    if (clientRegion.length >= 12) {
      widthVal = 80;
    } else if (clientRegion.length <= 6) {
      widthVal = 200;
    } else {
      widthVal = 120;
    }
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          children: [
            pw.SizedBox(width: 120),
            pw.Text(clientRegion),
            pw.SizedBox(width: widthVal),
            pw.Text(clientCity),
          ],
        ),
        pw.Row(
          children: [
            pw.SizedBox(width: 50),
            pw.Text(clientSubCity),
            pw.SizedBox(width: 200),
            pw.Text('$clientWoreda    $clientKebele'),
          ],
        ),
        pw.Row(
          children: [
            pw.SizedBox(width: 100),
            pw.Text(clientWoreda),
          ],
        ),
        pw.Row(children: [
          pw.SizedBox(height: 35),
          pw.SizedBox(width: 60),
          pw.Text(clientPhone),
          pw.SizedBox(width: 120),
          pw.Text('N/A'),
        ]),
        pw.Row(children: [
          pw.SizedBox(width: 60),
          pw.Text(clientEmail),
        ]),
      ],
    );
  }

  pw.Widget _buildShareDetail() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          children: [
            pw.SizedBox(width: 100),
            pw.Text('$numberOfShares'),
          ],
        ),
        pw.SizedBox(height: 15),
        pw.Row(
          children: [
            pw.SizedBox(width: 150),
            pw.Text(
                '$numberOfShares'), // Placeholder for the second number of shares
          ],
        ),
        pw.SizedBox(height: 5),
        pw.Row(
          children: [
            pw.SizedBox(width: 10),
            pw.Text(companyInfo.pricepershare.toString()),
            // pw.SizedBox(width: 10),
            pw.SizedBox(width: 215),
            pw.Text('Birr'),
            pw.SizedBox(
                width: 50), // Placeholder for the second number of shares
            pw.Text('${numberOfShares * companyInfo.pricepershare}'),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildFooterSection() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'I hereby recognize that I have read the Prospectus prepared for sale of the ordinary shares and agree to abide by the terms and conditions stated in the Prospectus.',
          style: pw.TextStyle(fontSize: 12, color: baseColor),
        ),
        pw.SizedBox(height: 20),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              'Shareholder\'s Signature',
              style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.black,
                decoration: pw.TextDecoration.underline,
              ),
            ),
            pw.Text(
              'Bank\'s Authorized Signature',
              style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.black,
                decoration: pw.TextDecoration.underline,
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 5),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              'Name: $clientName',
              style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.black,
                decoration: pw.TextDecoration.underline,
              ),
            ),
            pw.Text(
              'Name: ${companyInfo.companyName}',
              style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.black,
                decoration: pw.TextDecoration.underline,
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 5),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              'Date: ..........................................',
              style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.black,
                decoration: pw.TextDecoration.underline,
              ),
            ),
            pw.Text(
              'Date: ..........................................',
              style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.black,
                decoration: pw.TextDecoration.underline,
              ),
            ),
          ],
        ),
      ],
    );
  }

  pw.Widget _contentFooter(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.RichText(
          text: pw.TextSpan(
            text: companyInfo.paymentInstructions,
            style: pw.TextStyle(
              color: _darkColor,
              decoration: pw.TextDecoration.underline,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.SizedBox(height: 1 * PdfPageFormat.mm),
        pw.Container(
          width: double.infinity,
          height: 1,
          color: accentColor,
        ),
        pw.SizedBox(height: 1 * PdfPageFormat.mm),
        pw.Text(
          companyInfo.companyName,
          style: pw.TextStyle(
            color: _darkColor,
            fontWeight: pw.FontWeight.bold,
            decoration: pw.TextDecoration.underline,
          ),
        ),
        pw.Text(
          companyInfo.companyAddress,
          style: pw.TextStyle(
            color: _darkColor,
            fontWeight: pw.FontWeight.bold,
            decoration: pw.TextDecoration.underline,
          ),
        ),
        pw.Text(
          companyInfo.contactNumber,
          style: pw.TextStyle(
            color: _darkColor,
            fontWeight: pw.FontWeight.bold,
            decoration: pw.TextDecoration.underline,
          ),
        ),
        pw.Text(
          companyInfo.email,
          style: pw.TextStyle(
            color: _darkColor,
            fontWeight: pw.FontWeight.bold,
            decoration: pw.TextDecoration.underline,
          ),
        ),
        pw.Text(
          companyInfo.website,
          style: pw.TextStyle(
            color: _darkColor,
            fontWeight: pw.FontWeight.bold,
            decoration: pw.TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  pw.Widget _termsAndConditions(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Terms & Conditions',
          style: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
            color: baseColor,
            decoration: pw.TextDecoration.underline,
          ),
        ),
        pw.SizedBox(height: 10),
        pw.Text(
          'Please refer to the additional information on the back side.',
          textAlign: pw.TextAlign.justify,
          style: pw.TextStyle(
            fontSize: 12,
            lineSpacing: 2,
            color: _darkColor,
            decoration: pw.TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
