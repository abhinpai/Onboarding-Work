// class DataModel {
//   String siteName;
//   String siteId;
//   String systemType;
//   Analysis analysis;

//   DataModel({this.siteName, this.siteId, this.systemType, this.analysis});

//   DataModel.fromJson(Map<String, dynamic> json) {
//     siteName = json['siteName'];
//     siteId = json['siteId'];
//     systemType = json['systemType'];
//     analysis = json['analysis'] != null
//         ? new Analysis.fromJson(json['analysis'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['siteName'] = this.siteName;
//     data['siteId'] = this.siteId;
//     data['systemType'] = this.systemType;
//     if (this.analysis != null) {
//       data['analysis'] = this.analysis.toJson();
//     }
//     return data;
//   }
// }

// class Analysis {
//   String predictedTime;
//   String timetaken;
//   String actualTime;
//   List<Stages> stages;

//   Analysis({this.predictedTime, this.timetaken, this.actualTime, this.stages});

//   Analysis.fromJson(Map<String, dynamic> json) {
//     predictedTime = json['predictedTime'];
//     timetaken = json['timetaken'];
//     actualTime = json['actualTime'];
//     if (json['stages'] != null) {
//       stages = new List<Stages>();
//       json['stages'].forEach((v) {
//         stages.add(new Stages.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['predictedTime'] = this.predictedTime;
//     data['timetaken'] = this.timetaken;
//     data['actualTime'] = this.actualTime;
//     if (this.stages != null) {
//       data['stages'] = this.stages.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Stages {
//   String name;
//   String predicted;
//   String actual;

//   Stages({this.name, this.predicted, this.actual});

//   Stages.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     predicted = json['predicted'];
//     actual = json['actual'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['predicted'] = this.predicted;
//     data['actual'] = this.actual;
//     return data;
//   }
// }

class DataModel {
  String siteName;
  String siteId;
  String systemType;
  Analysis analysis;

  DataModel({this.siteName, this.siteId, this.systemType, this.analysis});

  DataModel.fromJson(Map<String, dynamic> json) {
    siteName = json['siteName'];
    siteId = json['siteId'];
    systemType = json['systemType'];
    analysis = json['analysis'] != null
        ? new Analysis.fromJson(json['analysis'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['siteName'] = this.siteName;
    data['siteId'] = this.siteId;
    data['systemType'] = this.systemType;
    if (this.analysis != null) {
      data['analysis'] = this.analysis.toJson();
    }
    return data;
  }
}

class Analysis {
  String predictedTime;
  String timetaken;
  String actualTime;
  List<Stages> stages;

  Analysis({this.predictedTime, this.timetaken, this.actualTime, this.stages});

  Analysis.fromJson(Map<String, dynamic> json) {
    predictedTime = json['predictedTime'];
    timetaken = json['timetaken'];
    actualTime = json['actualTime'];
    if (json['stages'] != null) {
      stages = new List<Stages>();
      json['stages'].forEach((v) {
        stages.add(new Stages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['predictedTime'] = this.predictedTime;
    data['timetaken'] = this.timetaken;
    data['actualTime'] = this.actualTime;
    if (this.stages != null) {
      data['stages'] = this.stages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stages {
  String actual;
  String name;
  String timeType;
  String predicted;

  Stages({this.actual, this.name, this.timeType, this.predicted});

  Stages.fromJson(Map<String, dynamic> json) {
    actual = json['actual'];
    name = json['name'];
    timeType = json['timeType'];
    predicted = json['predicted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actual'] = this.actual;
    data['name'] = this.name;
    data['timeType'] = this.timeType;
    data['predicted'] = this.predicted;
    return data;
  }
}
