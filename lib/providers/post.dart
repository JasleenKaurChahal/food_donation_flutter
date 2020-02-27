import 'package:flutter/cupertino.dart';
import 'package:flutter_food_donation/utils/constants/images.dart';

class PostProvider extends ChangeNotifier {
  String name = 'Someone';
  int index = 2;
  var image = POST_IMAGES[0];
  var currentGalleryImage;
  setPostName(String n) {
    print('New name $n');
    name = n;
    print(name);
    // notifyListeners();
  }

  setPostIndex(int i) {
    index = i;
    // notifyListeners();
  }

  setPostImage(var img) {
    image = img;
    // notifyListeners();
  }
}
