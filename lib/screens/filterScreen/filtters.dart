import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/widget/appText.dart';
import 'package:onlineShopUIKit/screens/filterScreen/filterScreen.dart';

class RengPicker extends StatelessWidget {
  final String title;
  final RangeValues rangeValues;
  final Function function;

  const RengPicker(
      {Key key,
      @required this.rangeValues,
      @required this.function,
      @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 18),
          child: CategoryText(
            text: "Price",
          ),
        ),
        SizedBox(
          height: 16,
        ),
        RangeSlider(
          values: rangeValues,
          min: 0,
          max: 100,
          divisions: 10,
          labels: RangeLabels(
            rangeValues.start.round().toString(),
            rangeValues.end.round().toString(),
          ),
          onChanged: function,
        ),
      ],
    );
  }
}

class ColorsFiltter extends StatelessWidget {
  final String title;
  final List<ColorsCalss> colorsList;
  final List<int> selectedcolorIds;
  final Function selecteColorId;
  final bool smallView;
  const ColorsFiltter(
      {Key key,
      @required this.colorsList,
      @required this.selectedcolorIds,
      this.selecteColorId,
      @required this.title,
      @required this.smallView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Container(
                margin: EdgeInsets.only(left: 18),
                child: CategoryText(
                  text: title,
                ),
              )
            : SizedBox(
                height: 1,
              ),
        SizedBox(
          height: 16,
        ),
        Container(
          margin: EdgeInsets.only(left: 9),
          height: 50.0,
          width: double.infinity,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: colorsList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  selecteColorId(colorsList[index]);
                },
                child: Container(
                  child: Center(
                    child: Icon(
                      EvaIcons.checkmark,
                      color: selectedcolorIds.contains(index)
                          ? Colors.black
                          : Colors.transparent,
                      size: 19,
                    ),
                  ),
                  width: smallView ? 24 : 36,
                  height: smallView ? 24 : 36,
                  margin: EdgeInsets.symmetric(horizontal: smallView ? 8 : 10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                    border: Border.all(
                        color:
                            selectedcolorIds.contains(colorsList[index].colorId)
                                ? Colors.black
                                : Colors.transparent,
                        width: 2),
                    color: colorsList[index].color,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SizeFlitter extends StatelessWidget {
  final String title;
  final Function selecteSize;
  final List<SizeModale> sizeList;
  final List<int> selectedSizeList;

  const SizeFlitter(
      {Key key,
      @required this.sizeList,
      @required this.title,
      @required this.selecteSize,
      @required this.selectedSizeList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Container(
                margin: EdgeInsets.only(left: 18),
                child: CategoryText(
                  text: title,
                ),
              )
            : SizedBox(
                height: 1,
              ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 40.0,
          width: double.infinity,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: sizeList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                key: UniqueKey(),
                margin: EdgeInsets.symmetric(horizontal: 6),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  color: selectedSizeList.contains(sizeList[index].sizeId)
                      ? Colors.black
                      : Colors.grey,
                  onPressed: () {
                    selecteSize(sizeList[index]);
                  },
                  child: Container(
                    width: 80,
                    child: Center(
                      child: Text(
                        sizeList[index].size.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
