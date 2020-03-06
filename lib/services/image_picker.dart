import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<File> pickImage({@required ImageSource source}) {
    return ImagePicker.pickImage(source: source);
  }
}