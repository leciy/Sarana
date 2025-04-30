import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PreviewMateri extends StatefulWidget {
  const PreviewMateri({super.key});

  @override
  State<PreviewMateri> createState() => _PreviewMateriState();
}

class _PreviewMateriState extends State<PreviewMateri> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF34C1F0),
                  Color(0xFFEEFBFF),
                ],
                stops: [
                  0.0,
                  0.09
                ]),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 100.0),
                          child: Text(
                            "Materi",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 550,
                  width: double.infinity,
                  child: Expanded(
                    child: SfPdfViewer.network(
                      'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                      key: _pdfViewerKey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Helping a local business reinvent itself",
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold), 
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in elit massa. Vestibulum auctor arcu velit, a convallis quam cursus vel. Nunc quis orci ipsum. Cras vitae gravida urna, ac vestibulum elit. In eget dui ut mauris sollicitudin euismod id non eros. Cras volutpat arcu neque, nec dictum turpis suscipit quis. Nunc non risus ultrices, semper turpis eget, dictum nisl. Aliquam erat volutpat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.Suspendisse id nulla et massa tristique sodales eu a velit. Maecenas quam dui, pellentesque sit amet consectetur eget, convallis et tortor. Vivamus est justo, rutrum ut malesuada quis, commodo eget risus. Maecenas varius varius orci eu ullamcorper. Sed nec blandit lorem, non tincidunt felis. Donec ultrices, orci ut lacinia auctor, leo magna vestibulum metus, eget porttitor mi massa rutrum lectus. Nullam egestas vulputate ante eu vulputate. Nunc sollicitudin eu massa eget elementum. Maecenas turpis metus, elementum vel accumsan sit amet, viverra hendrerit nisl.",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
