import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/helper/theme.dart';
import 'package:onlineShopUIKit/provider/productsProvider.dart';
import 'package:onlineShopUIKit/widget/appText.dart';
import 'package:onlineShopUIKit/widget/header.dart';
import 'package:onlineShopUIKit/screens/filterScreen/filtters.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class ColorsCalss {
  final int colorId;
  final Color color;
  final String colorText;

  ColorsCalss(
    this.colorId,
    this.color,
    this.colorText,
  );
}

class SizeModale {
  final int sizeId;
  final String size;

  SizeModale(
    this.sizeId,
    this.size,
  );
}

class BrandName {
  final int id;
  final String name;

  BrandName(
    this.id,
    this.name,
  );
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  List<ColorsCalss> colorsList = [
    new ColorsCalss(0, Colors.red, "Red"),
    new ColorsCalss(1, Colors.pink, "pink"),
    new ColorsCalss(2, Colors.brown, "brown"),
    new ColorsCalss(3, Colors.blue, "blue"),
    new ColorsCalss(4, Colors.green, "green"),
    new ColorsCalss(5, Colors.orange, "orange"),
    new ColorsCalss(6, Colors.white, "white"),
  ];
  List<SizeModale> sizeList = [
    new SizeModale(0, "s"),
    new SizeModale(1, "m"),
    new SizeModale(2, "l"),
    new SizeModale(3, "xl"),
    new SizeModale(4, "xxl"),
  ];
  List<BrandName> brandList = [
    new BrandName(0, "Arrow"),
    new BrandName(1, "American Crew"),
    new BrandName(2, "Ducati"),
    new BrandName(3, "Flying Machine"),
    new BrandName(4, "HIGHLANDER"),
    new BrandName(5, "Roadster"),
  ];
  List<int> selectedcolorIds = [];
  List<int> selectedSizeList = [];
  List<int> selectedbrandList = [];

  void changePriceSlider(RangeValues values) {
    setState(() {
      _currentRangeValues = values;
    });
  }

  void selectBrand(BrandName brandName) {
    bool isPresent = selectedbrandList.contains(brandName.id);
    if (isPresent) {
      setState(() {
        selectedbrandList.remove(brandName.id);
      });
    } else {
      setState(() {
        selectedbrandList.add(brandName.id);
      });
    }
  }

  void selecteSize(SizeModale sizeModale) {
    bool isPresent = selectedSizeList.contains(sizeModale.sizeId);
    if (isPresent) {
      setState(() {
        selectedSizeList.remove(sizeModale.sizeId);
      });
    } else {
      setState(() {
        selectedSizeList.add(sizeModale.sizeId);
      });
    }
  }

  void selecteColorId(ColorsCalss colorsCalss) {
//   var contain = listOfDownloadedFile.where((element) => element.Url == "your URL link");
// if (contain.isEmpty)
//    //value not exists
// else
    bool isPresent = selectedcolorIds.contains(colorsCalss.colorId);
    if (isPresent) {
      setState(() {
        selectedcolorIds.remove(colorsCalss.colorId);
      });
    } else {
      setState(() {
        selectedcolorIds.add(colorsCalss.colorId);
      });
    }
  }

  clearAllFitter() {
    setState(() {
      selectedcolorIds.clear();
      selectedSizeList.clear();
      selectedbrandList.clear();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, loginStateProvider, child) {
        return Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier notifier, child) {
          return Scaffold(
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: FadeAnimation(
                    0.5,
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: AppHearder(
                          hideBackButton: false,
                          buttonText: "cart",
                          leftButtonColor:
                              notifier.darkTheme ? Colors.white : Colors.black,
                          rightAction: [
                            Container(
                              height: 30,
                              margin: EdgeInsets.only(right: 16),
                              child: Chip(
                                backgroundColor: Theme.of(context).accentColor,
                                deleteIcon: Icon(
                                  EvaIcons.close,
                                  color: Colors.white,
                                ),
                                onDeleted: () {
                                  clearAllFitter();
                                },
                                label: Text("clear".toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ],
                          leftButton: true,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeAnimation(0.5, Divider()),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 28,
                  ),
                ),
                SliverToBoxAdapter(
                    child: FadeAnimation(
                        0.5,
                        RengPicker(
                          function: changePriceSlider,
                          rangeValues: _currentRangeValues,
                          title: "Price",
                        ))),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 28,
                  ),
                ),
                SliverToBoxAdapter(
                    child: FadeAnimation(
                        0.5,
                        ColorsFiltter(
                          title: "Color",
                          selectedcolorIds: selectedcolorIds,
                          colorsList: colorsList,
                          selecteColorId: selecteColorId,
                          smallView: false,
                        ))),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 28,
                  ),
                ),
                SliverToBoxAdapter(
                    child: FadeAnimation(
                        0.5,
                        SizeFlitter(
                            sizeList: sizeList,
                            title: "Size",
                            selecteSize: selecteSize,
                            selectedSizeList: selectedSizeList))),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 28,
                  ),
                ),
                SliverToBoxAdapter(
                    child: FadeAnimation(
                        0.5,
                        Container(
                          margin: EdgeInsets.only(left: 18),
                          child: CategoryText(
                            text: "Brands",
                            color: notifier.darkTheme
                                ? Colors.white
                                : Colors.black,
                          ),
                        ))),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 12,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    BrandName brandName = brandList[index];
                    return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 18),
                      child: FadeAnimation(
                        0.5,
                        Column(
                          children: [
                            ListTile(
                              onTap: () {
                                selectBrand(brandName);
                              },
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 0),
                              title: BrandText(
                                fontWeight:
                                    selectedbrandList.contains(brandName.id)
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                color: selectedbrandList.contains(brandName.id)
                                    ? Theme.of(context).accentColor
                                    : Colors.grey,
                                text: brandName.name,
                              ),
                              trailing: selectedbrandList.contains(brandName.id)
                                  ? Icon(
                                      EvaIcons.checkmark,
                                      color: Theme.of(context).accentColor,
                                    )
                                  : Text(""),
                            ),
                            Divider()
                          ],
                        ),
                      ),
                    );
                  }, childCount: brandList.length),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
