import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class RecentSearchTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(left: 14, right: 14),
          child: ListTile(
            title: Text("Recent Search",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 22, height: 1.3, fontWeight: FontWeight.bold)),
            trailing: Container(
              height: 30,
              child: Chip(
                backgroundColor: Theme.of(context).accentColor,
                deleteIcon: Icon(
                  EvaIcons.close,
                  color: Colors.white,
                ),
                onDeleted: () {},
                label: Text("clear".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
          ),
        ),
        Divider(),
        SizedBox(
          height: 4,
        )
      ],
    );
  }
}
