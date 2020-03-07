import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pa_flutter_t4H/models/avatar.dart';
import 'package:pa_flutter_t4H/services/auth.dart';
import 'package:pa_flutter_t4H/services/firestore.dart';
import 'package:pa_flutter_t4H/services/image_picker.dart';
import 'package:pa_flutter_t4H/services/storage.dart';
import 'package:pa_flutter_t4H/widgets/avatar.dart';
import 'package:pa_flutter_t4H/widgets/custom_header.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';

  Widget _buildUserInfo({BuildContext context}) {
    final database = Provider.of<FirestoreService>(context);
    final user = Provider.of<User>(context, listen: false);
    return StreamBuilder<AvatarReference>(
      stream: database.avatarReferenceStream(uid: user.uid),
      builder: (context, snapshot) {
        final avatarReference = snapshot.data;
        return Avatar(
          photoUrl: avatarReference?.downloadUrl,
          radius: 75,
        );
      },
    );
  }

  Future<void> _chooseAvatar(BuildContext context) async {
    try {
      // 1. Get image from picker
      final imagePicker = Provider.of<ImagePickerService>(context, listen: false);
      final file = await imagePicker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        // 2. Upload to storage
        final user = Provider.of<User>(context, listen: false);
        final storage = Provider.of<FirebaseStorageService>(context, listen: false);
        final downloadUrl =
            await storage.uploadAvatar(uid: user.uid, file: file);
        // 3. Save url to Firestore
        final database = Provider.of<FirestoreService>(context, listen: false);
        await database.setAvatarReference(
          uid: user.uid,
          avatarReference: AvatarReference(downloadUrl),
        );
        // 4. (optional) delete local file as no longer needed
        // await file.delete();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Theme.of(context).accentColor,
                systemNavigationBarColor: Colors.white),
            child: SafeArea(
                child: Column(children: <Widget>[
              WavyAppHeader(
                title: 'Profile',
                logoutBtn: true,
              ),
              Form(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        _buildUserInfo(context: context),
                        Positioned(
                            bottom: 5.0,
                            right: 5.0,
                            child: GestureDetector(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                ),
                                onTap: () => _chooseAvatar(context))),
                      ],
                    )
                  ],
                ),
              )
            ]))));
  }
}
