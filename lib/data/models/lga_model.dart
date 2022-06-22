class LgaModel {
  List<StateAbbr>? data;

  LgaModel({this.data});

  LgaModel.fromJson(Map<String, dynamic> json) {
    if (json['cities'] != null) {
      List<StateAbbr>? state = [];
      print(json['cities']);
      //print(state);

      json['cities'].forEach((k, v) {
        print(k);
        state.add(
          StateAbbr(
            abbreviation: k,
            name: v,
          ),
        );
      });
      data = state;
      print(data);
    } else {
      data = null;
    }
  }
}


class StateAbbr {
  String? abbreviation;
  String? name;

  StateAbbr({this.abbreviation, this.name});

  StateAbbr.fromJson(Map<String, dynamic> json) {
    abbreviation = json['abbreviation'];
    name = json['name'];
  }
}
