<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
![finalLogo(fancylist)](https://user-images.githubusercontent.com/90024312/192208076-7fd887e6-711a-4b8c-9de1-c91833eca844.png)


# FancyList : Custom Modern Look ListView

Fancy List is a Custom and Modern look ListView in flutter. It is ver easy to implent with JSON and its functionaly can be changed with JSON file

## Features

1.) Change color of rounded rectangular box <br />
2.) Modern Look <br />
3.) Implement Images <br />
4.) Name and description can be given to the list with JSON <br />
5.) List will be implemeted with the help of JSON <br />
6.) Functionality of List easily changable with JSON file <br />

## Getting started
### prerequisites
1.) Velocity_x dependency needed <br />
2.) Json file needed in the below given format <br />

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

### 1st Step -> create a JSON file
create a json file in this format <br/>
#### Do not forget to add nextpager - in nextpager your app pages routes are written
![Screenshot 2022-09-26 111340](https://user-images.githubusercontent.com/90024312/192202027-557c5c75-9437-4c84-8966-64429cf086ed.png)


``` json

{
    "products": [
        {
            "id": 1,
            "name": "30 days fit",
            "desc": "30 Days Obese to fit challenge",
            "nextPager": "/listDone",
            "image": "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjOiJ-wZHOAdfTHd18YvpMgRDTtCJMOUr8NRJ1O-0r31dozvX1X9P6UYiKVyV_LsjzhMy6OJx67zyvZ1vHrj4RlhJO_Vf8Onihd4zluASFN085jNqtXSd0JlCpept9bfbiEMCMyOb9y3ssSfvaq_EunfrAodyJVHcKtSW4GuCYUphp5bIo9wiXL7Kf8Mg/s320/White%20with%20Mint%20Tooth%20Icon%20Dental%20LogoWhite%20with%20Mint%20Tooth%20Icon%20Dental%20Logo.png"
        },
        {
            "id": 2,
            "name": "Healthy Diet",
            "desc": "Best healthy diet for kids",
            "nextPager": "/listDone",
            "image": "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgIT-DUwDcYjs76JoZHfqZ8lxFbEMu2c35mECBMFiaGf6C21I_CYz7kFStnp_CaJnKk1bWjtCJGBcJ2zTLl1jwy5_gMEte3HrTirHpQNs6Bjlh2CKE586TvUUZcmg61Q2aGays7T5RimW7bDqv4E4aFT0DRDSXJ7hFjHrxaCvDzy6smqy1IObtKZ5wsFA/s320/White%20with%20Mint%20Tooth%20Icon%20Dental%20LogoWhite%20with%20Mint%20Tooth%20Icon%20Dental%20Logo%20(2).png"
        },
        {
            "id": 3,
            "name": "Yoga for Kids",
            "desc": "A fit, healthy body — that is the best fashion statement",
            "nextPager": "/Yoga",
            "image": "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg-GTrlEzlVJomoF0HXcS-79RaMwe254PsSUx3rLXO4V5vpDGJ5f2kTCglhJn-bawKnbCx3vehHy7lEsKFUHTq2ofzpcR91GYFrkoYj5MbpXZ65U6_-xKyY03BGj4YJyv71IBpB5vYmbwv6RSKX7SeNJssxGqkKjsyPl7yN5Wp1zeryKopJpN8qNgJjIQ/s320/White%20with%20Mint%20Tooth%20Icon%20Dental%20LogoWhite%20with%20Mint%20Tooth%20Icon%20Dental%20Logo%20(1).png"
        }
        
        
    ],
}

```
### 2nd Step-> How to call the list

![Screenshot 2022-09-26 111221](https://user-images.githubusercontent.com/90024312/192202456-878949a3-6d23-471b-9fad-2ba28e91f217.png)

![Screenshot 2022-09-26 111926](https://user-images.githubusercontent.com/90024312/192202593-e615b377-9770-4239-96a1-ed1d12942a9b.png)

```dart
body: Padding(
        padding: const EdgeInsets.only(left: 21, right: 21),
        child: CatalogList(),
      ),
```

### full code example

``` dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:my_new_package/my_new_package.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson = await rootBundle.loadString("lib/assets/customList.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];

    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Custom Package testing",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.done_all),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 21, right: 21),
        child: CatalogList(),
      ),
    );
  }
}

```

## ScreenShot of the list
![Screenshot_2022-09-26-11-26-09-037_com example flutter_catalog](https://user-images.githubusercontent.com/90024312/192203868-75d5f000-4658-43e1-a7f3-07e81c7776db.jpg)




If anyone faces any issue regarding this fancylist project, You can easly raise the issue and also contribute to this project
