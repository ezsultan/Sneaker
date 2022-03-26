import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/product_model.dart';
import '../theme/size.dart';
import '../theme/text.dart';
import '../widget/custom_size_button.dart';
import '../theme/color.dart';

class DetailPage extends StatefulWidget {
  final ProductModel product;
  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int onTap = -1;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarDividerColor: backgroundColor,
      ),
    );
    Widget productImage() {
      return Stack(
        children: [
          Positioned(
            child: Container(
              width: double.maxFinite,
              height: 300,
              margin: const EdgeInsets.fromLTRB(
                AppSize.contentMargin / 4,
                AppSize.contentMargin / 4,
                AppSize.contentMargin / 4,
                0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.radius),
                image: DecorationImage(
                  image: NetworkImage(widget.product.gallery![0].url!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(
              margin: const EdgeInsets.only(
                top: 60,
                left: AppSize.contentMargin,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget productInformation() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSize.contentMargin,
          AppSize.mainMargin,
          AppSize.contentMargin,
          AppSize.contentMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product.name!,
              style: titleText.copyWith(
                color: textColor,
                fontWeight: extraBold,
              ),
            ),
            const SizedBox(
              height: AppSize.mainMargin / 2,
            ),
            Wrap(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  size: 20,
                  color: gottenStars > index ? Colors.amber : greyColor,
                );
              }),
            ),
            const SizedBox(
              height: AppSize.mainMargin,
            ),
            Text(
              'Description',
              style: bodyText.copyWith(
                color: textColor,
                fontWeight: extraBold,
              ),
            ),
            const SizedBox(
              height: AppSize.contentMargin / 2,
            ),
            Text(
              widget.product.description!,
              style: smallText.copyWith(
                fontSize: 14,
                color: greyColor,
                height: 1.5,
              ),
            ),
            const SizedBox(
              height: AppSize.mainMargin,
            ),
            Text(
              'Size',
              style: bodyText.copyWith(
                color: textColor,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: AppSize.contentMargin / 1.5,
            ),
            Wrap(
              children: List.generate(5, (index) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        onTap = index;
                      });
                    },
                    child: SizeButton(
                      text: (index + 38).toString(),
                      borderColor: primaryColor,
                      textColor: onTap == index ? Colors.black : textColor,
                      gradient: onTap == index ? gradientColor : gradientColor2,
                    ));
              }),
            ),
          ],
        ),
      );
    }

    Widget bottomCheckoutButton() {
      return Container(
        width: double.infinity,
        height: 100,
        margin: const EdgeInsets.fromLTRB(
          AppSize.contentMargin / 4,
          AppSize.contentMargin / 4,
          AppSize.contentMargin / 4,
          0,
        ),
        decoration: BoxDecoration(
          gradient: gradientColor1,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: AppSize.contentMargin,
                    left: AppSize.mainMargin,
                    right: AppSize.mainMargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.price!.round().toString() + ' USD',
                        style: titleText.copyWith(
                          color: textColor,
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('price', style: bodyText.copyWith(color: textColor)),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: 120,
              height: 50,
              margin: const EdgeInsets.only(
                top: AppSize.contentMargin,
                right: AppSize.mainMargin,
              ),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(AppSize.radius),
              ),
              child: Center(
                child: Text(
                  'Buy Now',
                  style: bodyText.copyWith(
                    color: Colors.white,
                    fontWeight: bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productImage(),
            productInformation(),
          ],
        ),
      ),
      bottomNavigationBar: bottomCheckoutButton(),
    );
  }
}
