import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firebase.dart';

//Replace These Values With Yours
class FirebaseHelper  {
  static fb.Database initDatabase() {
    try {
      if (fb.apps.isEmpty) {
        fb.initializeApp(
            // ====> Insira aqui os dados do seu SDK do Firebase <====
        );
      }
    } on fb.FirebaseJsNotLoadedException catch (e) {
      print(e);
    }
    return fb.database();
  }
}

class fire{
  static fb.Database database = FirebaseHelper.initDatabase();
}


Future<String> getOnce(fb.DatabaseReference AdsRef) async {
  String aux;
  await AdsRef.once('value').then((value) => {aux = value.snapshot.val()});
  return aux;
}

Future<List> getList(fb.DatabaseReference AdsRef) async {
  List list = [""];
  await AdsRef.once('value').then((value) => {
    list = result(value.snapshot, list)
  });
  return list;
}

List result(DataSnapshot dp,List list){
  list.clear();
  dp.forEach((v) {
    list.add(v);
  });
  return list;
}
