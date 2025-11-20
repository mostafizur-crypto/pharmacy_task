import 'dart:typed_data';
import 'package:flutter/foundation.dart'; // kIsWeb
import 'dart:io' show File;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmacy_task/color_section/color.dart';
import 'package:pharmacy_task/model/prescriptionModel.dart';

class PrecriptionSection extends StatefulWidget {
  final Function(PrescriptionModel model)? onUpload;

  const PrecriptionSection({super.key, this.onUpload});

  @override
  State<PrecriptionSection> createState() => _PrecriptionSectionCardState();
}

class _PrecriptionSectionCardState extends State<PrecriptionSection> {
  File? selectedImage;
  Uint8List? webImage;

  Future<void> pickPrescription() async {
    final ImagePicker picker = ImagePicker();
    final XFile? xfile = await picker.pickImage(source: ImageSource.gallery);

    if (xfile != null) {
      if (kIsWeb) {
        webImage = await xfile.readAsBytes();
      } else {
        selectedImage = File(xfile.path);
      }

      setState(() {});
      PrescriptionModel model = PrescriptionModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: xfile.path,
      );

      if (widget.onUpload != null) {
        widget.onUpload!(model);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: pickPrescription,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.textColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Upload Now",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Upload Prescription",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (webImage == null && selectedImage == null)
                    Image.asset(
                      'assets/image/categories1.png',
                      height: 100,
                      width: 140,
                      fit: BoxFit.cover,
                    )
                  else
                    (kIsWeb
                        ? Image.memory(
                            webImage!,
                            height: 100,
                            width: 124,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            selectedImage!,
                            height: 100,
                            width: 140,
                            fit: BoxFit.cover,
                          )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
