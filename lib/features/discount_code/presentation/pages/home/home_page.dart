import 'package:discountcodes/config/routes/routes.dart';
import 'package:discountcodes/features/discount_code/domain/entities/coupon.dart';
import 'package:discountcodes/features/discount_code/presentation/widgets/coupon_title.dart';
import 'package:flutter/material.dart';

// #docregion AppLocalizationsImport
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// #enddocregion AppLocalizationsImport

import '../../../domain/entities/article.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static const allItems = [
    CouponEntity(
        name: "test 1",
        description: "sadf asdf asdfasdfas dfasgasd ffasdfasdf "),
    CouponEntity(
        name: "test 2",
        description: "Sconto del 30% sulla componente energia per 12 mesi",
        category: "TECH"),
    CouponEntity(
        name: "test 3",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 4",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 5",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 6",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 7",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 8",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 9",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 10",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 11",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 12",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 13",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 14",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 15",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 16",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 17",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 18",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 19",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 20",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 21",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 22",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 23",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 24",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL"),
    CouponEntity(
        name: "test 25",
        description: "afdfsdfas asdf asdfas da",
        code: "CDSOADOISOOS",
        category: "TRAVEL")
  ];

  var _foundItems = [];

  @override
  void initState() {
    _foundItems = allItems;
    super.initState();
  }

  void _filterItems(String key){
    var results = [];
    if(key.isEmpty){
      results = allItems;
    } else {
    results = allItems.where((element) => element.name!.toLowerCase().contains(key.toLowerCase())).toList();
    }
    setState(() {
      _foundItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
      floatingActionButton: _buildFloatingButton(context),
    );
  }

  _buildFloatingButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      child: const Icon(Icons.add),
      onPressed: () => _onFloatingButtonTap(context),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text(
        AppLocalizations.of(context)!.appname,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => _goToSettings(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.settings, color: Colors.white),
          ),
        ),
      ],
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildHeader(context),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CouponTitle(
                coupon: _foundItems[index],
                isRemovable: true,
                onCouponTap: (coupon) => _onCouponPressed(context, coupon),
              );
            },
            itemCount: _foundItems.length,
          ),
        )
      ],
    );
  }

  void _onCouponPressed(BuildContext context, CouponEntity couponEntity) {
    Navigator.pushNamed(context, '/Details', arguments: couponEntity);
  }

  _goToSettings(BuildContext context) {
    Navigator.pushNamed(context, '/Settings');
  }

  _onFloatingButtonTap(BuildContext context) {
    Navigator.pushNamed(context, '/NewCoupon');
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SearchBar(
        hintText: AppLocalizations.of(context)!.searchYourCoupons,
        leading: const Icon(Icons.search),
        onChanged: (String value) {
          _filterItems(value);
        },
      ),
    );
  }
}
