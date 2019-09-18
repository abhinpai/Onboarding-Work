class DataModel {
  String _siteName;
  String _siteId;
  String _systemType;
  Analysis _analysis;

  DataModel(
      {String siteName, String siteId, String systemType, Analysis analysis}) {
    this._siteName = siteName;
    this._siteId = siteId;
    this._systemType = systemType;
    this._analysis = analysis;
  }

  String get siteName => _siteName;
  set siteName(String siteName) => _siteName = siteName;
  String get siteId => _siteId;
  set siteId(String siteId) => _siteId = siteId;
  String get systemType => _systemType;
  set systemType(String systemType) => _systemType = systemType;
  Analysis get analysis => _analysis;
  set analysis(Analysis analysis) => _analysis = analysis;

  DataModel.fromJson(Map<String, dynamic> json) {
    _siteName = json['siteName'];
    _siteId = json['siteId'];
    _systemType = json['systemType'];
    _analysis = json['analysis'] != null
        ? new Analysis.fromJson(json['analysis'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['siteName'] = this._siteName;
    data['siteId'] = this._siteId;
    data['systemType'] = this._systemType;
    if (this._analysis != null) {
      data['analysis'] = this._analysis.toJson();
    }
    return data;
  }
}

class Analysis {
  String _predictedTime;
  String _timetaken;
  Null _actualTime;
  List<Stages> _stages;

  Analysis(
      {String predictedTime,
      String timetaken,
      Null actualTime,
      List<Stages> stages}) {
    this._predictedTime = predictedTime;
    this._timetaken = timetaken;
    this._actualTime = actualTime;
    this._stages = stages;
  }

  String get predictedTime => _predictedTime;
  set predictedTime(String predictedTime) => _predictedTime = predictedTime;
  String get timetaken => _timetaken;
  set timetaken(String timetaken) => _timetaken = timetaken;
  Null get actualTime => _actualTime;
  set actualTime(Null actualTime) => _actualTime = actualTime;
  List<Stages> get stages => _stages;
  set stages(List<Stages> stages) => _stages = stages;

  Analysis.fromJson(Map<String, dynamic> json) {
    _predictedTime = json['predictedTime'];
    _timetaken = json['timetaken'];
    _actualTime = json['actualTime'];
    if (json['stages'] != null) {
      _stages = new List<Stages>();
      json['stages'].forEach((v) {
        _stages.add(new Stages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['predictedTime'] = this._predictedTime;
    data['timetaken'] = this._timetaken;
    data['actualTime'] = this._actualTime;
    if (this._stages != null) {
      data['stages'] = this._stages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stages {
  String _name;
  String _predicted;
  String _actual;

  Stages({String name, String predicted, String actual}) {
    this._name = name;
    this._predicted = predicted;
    this._actual = actual;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get predicted => _predicted;
  set predicted(String predicted) => _predicted = predicted;
  String get actual => _actual;
  set actual(String actual) => _actual = actual;

  Stages.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _predicted = json['predicted'];
    _actual = json['actual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['predicted'] = this._predicted;
    data['actual'] = this._actual;
    return data;
  }
}
