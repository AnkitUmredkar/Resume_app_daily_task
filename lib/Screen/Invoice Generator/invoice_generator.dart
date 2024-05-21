import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

GlobalKey<FormState> formkey = GlobalKey();
TextEditingController txtName = TextEditingController();
TextEditingController txtCategory = TextEditingController();
TextEditingController txtPrice = TextEditingController();

var c1 = txtName.clear();
var c2 = txtCategory.clear();
var c3 = txtPrice.clear();

class InvoiceGenerator extends StatefulWidget {
  const InvoiceGenerator({super.key});

  @override
  State<InvoiceGenerator> createState() => _InvoiceGeneratorState();
}

class _InvoiceGeneratorState extends State<InvoiceGenerator> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.blue,
          title: const Text(
            'Invoice Generator',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(
                invoiceList.length,
                (index) => ListTile(
                      title: Text(
                        '${invoiceList[index].name}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      subtitle: Text('${invoiceList[index].category}',
                          style: const TextStyle(fontSize: 18)),
                      trailing: Text('${invoiceList[index].prise}',
                          style: const TextStyle(fontSize: 18)),

                    )),
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
                onPressed: () {
                  setState(() {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            title: const Text('Add Details'),
                            titlePadding:
                                const EdgeInsets.only(left: 18, top: 12),
                            content: Form(
                              key: formkey,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      textInputAction: TextInputAction.next,
                                      controller: txtName,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Field Must Be Required';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          label: const Text('Name')),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 20, top: 20),
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        controller: txtCategory,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Field Must Be Required';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          label: const Text('Category'),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: txtPrice,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Field Must Be Required';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          label: const Text('Price')),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (formkey.currentState!.validate()) {
                                      invoiceList.add(
                                        InvoiceModel(
                                          name: txtName.text,
                                          category: txtCategory.text,
                                          prise: txtPrice.text,
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                      txtName.clear();
                                      txtCategory.clear();
                                      txtPrice.clear();
                                    }
                                  });
                                },
                                child: const Text(
                                  'OK',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 18),
                                ),
                              ),
                            ],
                          );
                        });
                  });
                },
                child: const Icon(Icons.add)),
            const SizedBox(width: 15),
            FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/pdf');
                },
                child: const Icon(Icons.send)),
          ],
        ),
      ),
    );
  }
}

List<InvoiceModel> invoiceList = [];

class InvoiceModel {
  String? name, category, prise;

  InvoiceModel({this.name, this.category, this.prise});
}

Future<Uint8List> generatePdf() {
  final pdf = pw.Document();
  pdf.addPage(pw.Page(
    build: (context) => pw.Column(children: [
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text('Name', style: const pw.TextStyle(fontSize: 28)),
          pw.Text('Category', style: const pw.TextStyle(fontSize: 28)),
          pw.Text('Price', style: const pw.TextStyle(fontSize: 28)),
        ],
      ),
      pw.SizedBox(
        height: 24,
      ),
      ...List.generate(
        invoiceList.length,
        (index) => pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              '${invoiceList[index].name}',
              style: const pw.TextStyle(fontSize: 21),
            ),
            pw.Text(
              '${invoiceList[index].category}',
              style: const pw.TextStyle(fontSize: 21),
            ),
            pw.Text(
              '${invoiceList[index].prise}',
              style: const pw.TextStyle(fontSize: 21),
            )
          ],
        ),
      ),
    ]),
  ));
  return pdf.save();
}
