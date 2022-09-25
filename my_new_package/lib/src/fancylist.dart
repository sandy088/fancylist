import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  final double size;
  const CatalogList({
    Key? key,
    this.size = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          // ignore: missing_required_param
          return InkWell(
              onTap: () {},
              child: CatalogItem(
                catalog: catalog,
                color: Colors.white,
                sizebt: size,
              ));
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  final Color color;
  final double sizebt;
  const CatalogItem(
      {Key? key,
      required this.catalog,
      this.color = Colors.white,
      this.sizebt = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            catalog.name.text.lg.color(context.theme.buttonColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                // "\$${catalog.id}".text.bold.make(),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, catalog.nextPager);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                  child: Icon(Icons.arrow_right_alt_sharp),
                )
              ],
            ).pOnly(right: 8.0),
          ],
        ))
      ],
    )).color(context.cardColor).roundedLg.square(150).make().py(sizebt);
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(context.canvasColor)
        .make()
        .p16()
        .w40(context);
  }
}

//model

class CatalogModel {
  static List<Item> items = [
    Item(
        id: 1,
        name: "!! Internet Connection",
        desc: "Connection to the internet failed",
        nextPager: "/honmepage",
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Simple_Alert.svg/1200px-Simple_Alert.svg.png")
  ];

  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String nextPager;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.nextPager,
    required this.image,
  });

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    String? nextPager,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      nextPager: nextPager ?? this.nextPager,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'nextPager': nextPager,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      nextPager: map['nextPager'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, nestPager: $nextPager, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.nextPager == nextPager &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        nextPager.hashCode ^
        image.hashCode;
  }
}
