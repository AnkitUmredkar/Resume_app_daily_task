import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

GlobalKey<FormState> formkey = GlobalKey();
TextEditingController txtName = TextEditingController();
TextEditingController txtCategory = TextEditingController();
TextEditingController txtPrice = TextEditingController();

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
        body: Form(
          key: formkey,
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
                          return SimpleDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            title: const Text('Add Details'),
                            titlePadding: const EdgeInsets.all(12),
                            children: [
                              TextFormField(
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
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    label: const Text('Name')),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(bottom: 20, top: 20),
                                child: TextFormField(
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
                                      borderRadius: BorderRadius.circular(5),
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
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    label: const Text('Price')),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (formkey.currentState!.validate()) {
                                        invoiceList.add(InvoiceModel(
                                          name: txtName.text,
                                          category: txtCategory.text,
                                          prise: txtPrice.text,
                                        ));
                                      }
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(color: Colors.blue),
                                  ),
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
    build: (context) => pw.Center(
      child: pw.Column(children: [
        pw.Row(
          children: [pw.Text('Name', style: const pw.TextStyle(fontSize: 25))],
        ),
        pw.SizedBox(
          height: 20,
        ),
        ...List.generate(
          invoiceList.length,
          (index) => pw.Row(
              children: List.generate(
            invoiceList.length,
            (index) => pw.Text(
              '${invoiceList[index].name}\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t ${invoiceList[index].category}\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t ${invoiceList[index].prise}',
              style: const pw.TextStyle(fontSize: 18),
            ),
          )),
        ),
      ]),
    ),
  ));
  return pdf.save();
}
