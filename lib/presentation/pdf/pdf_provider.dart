import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testayurvedicproject/constants/colors.dart';

import 'model.dart';


class PdfProvider with ChangeNotifier {

  final List<String> headerNames = ['Treatment', 'Price', 'Male', 'Female', 'Total'];
  final List<TableRowData> tableData = [
    TableRowData(treatment: 'Panchakarma', price: '₹230', male: 4, female: 4, total: '₹2,540'),
    TableRowData(treatment: 'Njavara Kizhi Treatment', price: '₹230', male: 4, female: 4, total: '₹2,540'),
    TableRowData(treatment: 'Panchakarma', price: '₹230', male: 4, female: 6, total: '₹2,540'),
  ];
  Future savePdf() async {
    final pdf = pw.Document();
    final image1 = pw.MemoryImage(
      (await rootBundle.load('assets/images/bgLogo.png')).buffer.asUint8List(),
    );
    final logo = pw.MemoryImage(
      (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List(),
    );
    final sign = pw.MemoryImage(
      (await rootBundle.load('assets/images/sign.png')).buffer.asUint8List(),
    );
    PdfColor pdfMainGreen = PdfColor.fromInt(maingreen.value);

    // final image2 = pw.MemoryImage(
    //   (await rootBundle.load('assets/signature.png')).buffer.asUint8List(),
    // );
    // final font = await rootBundle.load("assets/Hind-Regular.ttf");
    // final ttf = pw.Font.ttf(font);
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return
            pw.Container(
              decoration: pw.BoxDecoration(
              image: pw.DecorationImage(
              image: image1,
              fit: pw.BoxFit.contain,
          ),
          ),
          child:
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              // mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,

                    children: [
                  pw.Image(logo,width:76 ,height:80 ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text("KUMARAKOM",
                          textAlign: pw.TextAlign.end,
                          style: pw.TextStyle(
                        fontSize: 10,fontWeight: pw.FontWeight.bold
                      )),
                      pw.Text("Cheepunkal P.O. Kumarakom, kottayam, Kerala - 686563"),
                      pw.Text("e-mail: unknown@gmail.com"),
                      pw.Text("Mob: +91 9876543210 | +91 9786543210"),
                      pw.Text("GST No: 32AABCU9603R1ZW",style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),

                    ],
                  ),


                    ]),
                pw.SizedBox(height: 20),
                pw.Divider(color: PdfColors.grey.shade(0.2),height: 2,thickness: 1),
                pw.SizedBox(height: 18),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Text(
                    "Patient Details",
                    style: pw.TextStyle(
                      color: pdfMainGreen,
                      fontSize: 13,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              pw.SizedBox(height: 18),
                pw.Row(
                  children: [
                    pw.Flexible(
                      fit: pw.FlexFit.tight,
                      child:
                    pw.Container(color: PdfColors.red,child:
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("Name",
                        textAlign: pw.TextAlign.start,
                        style: pw.TextStyle(
                            fontSize: 10,fontWeight: pw.FontWeight.bold
                        )),
                    pw.Text("Address",
                        textAlign: pw.TextAlign.start,
                        style: pw.TextStyle(
                            fontSize: 10,fontWeight: pw.FontWeight.bold
                        )),
                    pw.Text("WhatsApp Number",
                        textAlign: pw.TextAlign.start,
                        style: pw.TextStyle(
                            fontSize: 10,fontWeight: pw.FontWeight.bold
                        )),
                  ],
                )   ),


                    ),
                    pw.Container(
                      color: PdfColors.amber,
                      width: 200,
                      child:
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("Salih T",
                            textAlign: pw.TextAlign.start,
                            style: pw.TextStyle(
                                fontSize: 10,
                            )),
                        pw.Text("Nadakkave, Kozhikkode",
                            textAlign: pw.TextAlign.start,
                            style: pw.TextStyle(
                                fontSize: 10,
                            )),
                        pw.Text("+91 987654321",
                            textAlign: pw.TextAlign.start,
                            style: pw.TextStyle(
                                fontSize: 10,
                            )),
                      ],
                    ),


                    ),
                    pw.Flexible(
                      fit: pw.FlexFit.tight,
                      child:
                    pw.Container(color: PdfColors.red,child:
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("Booked On",
                            textAlign: pw.TextAlign.start,
                            style: pw.TextStyle(
                                fontSize: 10,fontWeight: pw.FontWeight.bold
                            )),
                        pw.Text("Treatment Date",
                            textAlign: pw.TextAlign.start,
                            style: pw.TextStyle(
                                fontSize: 10,fontWeight: pw.FontWeight.bold
                            )),
                        pw.Text("Treatment Time ",
                            textAlign: pw.TextAlign.start,
                            style: pw.TextStyle(
                                fontSize: 10,fontWeight: pw.FontWeight.bold
                            )),
                      ],
                    ),


                    )  ),
                    pw.Flexible(
                      fit: pw.FlexFit.tight,
                    child:
                    pw.Container(
                        color: PdfColors.amber,
                        width: 200,
                        child:
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text("31/01/2024",
                                  textAlign: pw.TextAlign.start,
                                  style: pw.TextStyle(
                                    fontSize: 10,
                                  )),
                              pw.Text("21/02/2024",
                                  textAlign: pw.TextAlign.start,
                                  style: pw.TextStyle(
                                    fontSize: 10,
                                  )),
                              pw.Text("11:00 am",
                                  textAlign: pw.TextAlign.start,
                                  style: pw.TextStyle(
                                    fontSize: 10,
                                  )),


                            ])
                    ),




                    )],),
                pw.SizedBox(height: 10),

                pw.Container(
                  height: 1, // Height of the divider
                  child: pw.Row(
                    children: List.generate(
                      30, // Adjust the number of dots as needed
                          (index) => pw.Container(
                        width: 14, // Width of each dot
                        height: .2, // Height of the dotted line
                        margin: pw.EdgeInsets.symmetric(horizontal: 1), // Adjust spacing between dots
                        color: PdfColors.grey, // Color of the dots
                      ),
                    ),
                  ),
                ),
                pw.Table(
                  children: [
                    buildHeaderRow(headerNames), //
                    for (var rowData in tableData)
                      pw.TableRow(
                        children: [
                          pw.Text(rowData.treatment),
                          pw.Text(rowData.price),
                          pw.Text(rowData.male.toString()),
                          pw.Text(rowData.female.toString()),
                          pw.Text(rowData.total),
                        ],
                      ),
                  ],// Header row
                    // Add your data rows here

                ),

                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Text("Total Amount",
                          textAlign: pw.TextAlign.start,
                          style: pw.TextStyle(
                              fontSize: 10,fontWeight: pw.FontWeight.bold
                          )),
                      pw.Text("₹7,620",
                          textAlign: pw.TextAlign.start,
                          style: pw.TextStyle(
                              fontSize: 10,fontWeight: pw.FontWeight.bold
                          )),

                    ]),

                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,

                    children: [

                      pw.Text("Discount",
                          textAlign: pw.TextAlign.start,
                          style: pw.TextStyle(
                            fontSize: 10,
                          )),


                      pw.Text("500",
                          textAlign: pw.TextAlign.start,
                          style: pw.TextStyle(
                            fontSize: 10,
                          )),


                    ]),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,

                    children: [

                      pw.Text("Advance  ",
                          textAlign: pw.TextAlign.start,
                          style: pw.TextStyle(
                            fontSize: 10,
                          )),


                      pw.Text("500",
                          textAlign: pw.TextAlign.start,
                          style: pw.TextStyle(
                            fontSize: 10,
                          )),


                    ]),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [

                pw.Container(
                  height: 1, // Height of the divider
                  child: pw.Row(
                    children: List.generate(
                      5, // Adjust the number of dots as needed
                          (index) => pw.Container(
                        width: 14, // Width of each dot
                        height: .2, // Height of the dotted line
                        margin: pw.EdgeInsets.symmetric(horizontal: 1), // Adjust spacing between dots
                        color: PdfColors.grey, // Color of the dots
                      ),
                    ),
                  ),
                ),]),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,

                    children: [
                      pw.Text("Balance",
                          textAlign: pw.TextAlign.start,
                          style: pw.TextStyle(
                              fontSize: 10,fontWeight: pw.FontWeight.bold
                          )),
                      pw.Text("7,620",
                          textAlign: pw.TextAlign.start,
                          style: pw.TextStyle(
                              fontSize: 10,fontWeight: pw.FontWeight.bold
                          )),

                    ]),

                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [

                pw.Text("Thank you for choosing us",
                    textAlign: pw.TextAlign.start,
                    style: pw.TextStyle(
                        fontSize: 16,fontWeight: pw.FontWeight.bold,
                      color: pdfMainGreen,
                    )),
                ]),
                pw.Text("Your well-being is our commitment, and we're honored \n you've entrusted us with your health journey",
                    textAlign: pw.TextAlign.end,
                    style: pw.TextStyle(
                      fontSize: 10,fontWeight: pw.FontWeight.normal,
                      color: PdfColors.grey,
                    )),
                pw.Image(sign,width:76 ,height:80 ),
pw.Spacer(),
                pw.Container(
                  height: 1, // Height of the divider
                  child: pw.Row(
                    children: List.generate(
                      30, // Adjust the number of dots as needed
                          (index) => pw.Container(
                        width: 14, // Width of each dot
                        height: .2, // Height of the dotted line
                        margin: pw.EdgeInsets.symmetric(horizontal: 1), // Adjust spacing between dots
                        color: PdfColors.grey, // Color of the dots
                      ),
                    ),
                  ),
                ),

                pw.Text("“Booking amount is non-refundable, and it's important to arrive on the allotted time for your treatment”",
                    textAlign: pw.TextAlign.end,
                    style: pw.TextStyle(
                      fontSize: 10,fontWeight: pw.FontWeight.normal,
                      color: PdfColors.grey,
                    )),



              ])


              );

        }));
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    print(documentPath.toString() + "bbbbbbbbbbbbbbbbb");
    File file = File("$documentPath/Invoice2.pdf");
    print(file.toString() + "vvvvvvvvv");
    return await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
    notifyListeners();
  }
}


pw.TableRow buildHeaderRow(List<String> headerNames) {
  return pw.TableRow(
    children: headerNames.map(
          (header) {
        return pw.Text(
          header,
          style: pw.TextStyle(),
        );
      },
    ).toList(),
  );
}