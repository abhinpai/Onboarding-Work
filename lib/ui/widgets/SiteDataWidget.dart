import 'package:flutter/material.dart';

class SiteDataWidget extends StatelessWidget {
  TextStyle siteNameStyle =
      TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.red);
  TextStyle systemTypeStyle = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    color: Colors.black45,
  );

  TextStyle siteIdStyle =
      TextStyle(color: Colors.black38, fontWeight: FontWeight.bold);

  String siteName;
  String siteId;
  String systemtype;

  SiteDataWidget(this.siteName, this.siteId, this.systemtype);

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      color: Colors.black12,
      border: Border.all(width: 1.0, color: Colors.black12),
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 8.0, 0),
                child: Text(
                  this.siteName,
                  style: siteNameStyle,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
                decoration: myBoxDecoration(),
                child: Text(this.systemtype, style: systemTypeStyle),
              ),
            ],
          ),
          Text(
            this.siteId,
            style: siteIdStyle,
          ),
        ],
      ),
    );
  }
}
