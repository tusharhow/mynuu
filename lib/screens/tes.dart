import 'dart:io';
import 'dart:io' show File;
//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:uuid/uuid.dart';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  List<Widget> itemPhotosWidgetList = <Widget>[];

  final ImagePicker _picker = ImagePicker();
  File? file;
  List<XFile>? photo = <XFile>[];
  List<XFile> itemImagesList = <XFile>[];

  List<String> downloadUrl = <String>[];

  bool uploading = false;

  @override
  Widget build(BuildContext context) {
    return displayWebUploadFormScreen();
  }

  displayWebUploadFormScreen() {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 200.0,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(0.0, 0.5),
                    blurRadius: 30.0,
                  )
                ]),
            width: 150,
            height: 150.0,
            child: Center(
              child: itemPhotosWidgetList.isEmpty
                  ? Center(
                      child: MaterialButton(
                        onPressed: pickPhotoFromGallery,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Center(
                            child: Image.network(
                              "https://static.thenounproject.com/png/3322766-200.png",
                              height: 80.0,
                              width: 80.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Wrap(
                        spacing: 5.0,
                        direction: Axis.horizontal,
                        children: itemPhotosWidgetList,
                        alignment: WrapAlignment.spaceEvenly,
                        runSpacing: 10.0,
                      ),
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                  left: 100.0,
                  right: 100.0,
                ),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    color: const Color.fromRGBO(0, 35, 102, 1),
                    onPressed:
                        uploading ? null : () => uplaodImageAndSaveItemInfo(),
                    child: uploading
                        ? const SizedBox(
                            child: CircularProgressIndicator(),
                            height: 15.0,
                          )
                        : const Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  addImage() {
    for (var bytes in photo!) {
      itemPhotosWidgetList.add(Padding(
        padding: const EdgeInsets.all(1.0),
        child: SizedBox(
          height: 100.0,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              child: kIsWeb
                  ? Image.network(File(bytes.path).path)
                  : Image.file(
                      File(bytes.path),
                    ),
            ),
          ),
        ),
      ));
    }
  }

  pickPhotoFromGallery() async {
    photo = await _picker.pickMultiImage();
    if (photo != null) {
      setState(() {
        itemImagesList = itemImagesList + photo!;
        addImage();
        photo!.clear();
      });
    } else {
      print("No image selected");
    }
  }

  Future<String> uplaodImageAndSaveItemInfo() async {
    setState(() {
      uploading = true;
    });
    PickedFile? pickedFile;
    String? productId = const Uuid().v4();
    for (int i = 0; i < itemImagesList.length; i++) {
      file = File(itemImagesList[i].path);
      pickedFile = PickedFile(file!.path);

      await uploadImageToStorage(pickedFile, productId);
    }
    return productId;
  }

  uploadImageToStorage(PickedFile? pickedFile, String productId) async {
    final String filePath = basename(pickedFile!.path);
    Reference reference = FirebaseStorage.instance.ref().child(filePath);
    await reference.putData(
      await pickedFile.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg'),
    );
    await reference.getDownloadURL().then((fileURL) {
      print('File URL: $fileURL');
      FirebaseFirestore.instance.collection('products').add({
        'id': '${DateTime.now().millisecondsSinceEpoch}',
        'name': "ttitleController.text",
        'price': 'priceController.text',
        'description': 'descriptionController.text',
        'image': fileURL,
        'category': 'categoryController.text',
        'times_likes': '',
        'times_viewed': '',
      });
    });
    if (itemImagesList.length == itemImagesList.length) {
      setState(() {
        uploading = false;
      });
    } else {
      print("error");
    }
  }
}
