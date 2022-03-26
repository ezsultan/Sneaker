import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sneaker/page/detail_page.dart';
import '../cubit/product_cubit.dart';
import '../cubit/product_states.dart';
import '../model/product_model.dart';
import '../theme/color.dart';
import '../theme/size.dart';
import '../theme/text.dart';
import '../widget/item_tile.dart';
import '../widget/loading_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProduct();
    super.initState();
  }

  List brand = [
    'adidas_logo.png',
    'nike_logo.png',
    'puma_logo.png',
    'jordan_logo.png'
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget appbar() {
      return AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: AppSize.mainMargin),
          child: Icon(
            Icons.menu,
            color: textColor,
          ),
        ),
        title: Text(
          'Home',
          style: subtitleText,
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: AppSize.mainMargin),
            child: Icon(
              Icons.search,
              color: textColor,
            ),
          ),
        ],
      );
    }

    Widget brandTile() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: AppSize.mainMargin,
              top: AppSize.contentMargin,
            ),
            child: Text(
              'Top Brands',
              style: subtitleText.copyWith(
                color: textColor,
                fontWeight: bold,
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.contentMargin,
          ),
          SizedBox(
            width: double.maxFinite,
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brand.length,
              itemBuilder: (context, index) {
                return Builder(builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.only(left: AppSize.mainMargin),
                        decoration: BoxDecoration(
                          color: backgroundColor1,
                          borderRadius: BorderRadiusDirectional.circular(
                            AppSize.radius / 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(
                                  AppSize.radius,
                                ),
                              ),
                              child: Image.asset(
                                'assets/' + brand.elementAt(index),
                                color: textColor,
                                // fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                });
              },
            ),
          ),
        ],
      );
    }

    Widget itemTile(List<ProductModel> product) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: AppSize.contentMargin,
              left: AppSize.mainMargin,
              right: AppSize.mainMargin,
            ),
            child: Text(
              'Daily Footwear',
              style: subtitleText.copyWith(
                color: textColor,
                fontWeight: bold,
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.contentMargin,
          ),
          SizedBox(
            width: double.maxFinite,
            height: 280,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: product.map((item) {
                  return ItemTile(
                    product: item,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      );
    }

    Widget newArivals(List<ProductModel> product) {
      return Container(
        margin: const EdgeInsets.only(
          right: AppSize.mainMargin / 2,
          top: AppSize.contentMargin,
          left: AppSize.mainMargin / 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Arivals',
              style: subtitleText.copyWith(
                color: textColor,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: AppSize.contentMargin,
            ),
            GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: product.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2 / 2.7,
                crossAxisCount: 2,
                mainAxisSpacing: AppSize.mainMargin / 2,
                crossAxisSpacing: AppSize.mainMargin / 2,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: backgroundColor1,
                    borderRadius: BorderRadius.circular(AppSize.radius / 3),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 15,
                      top: 15,
                      right: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppSize.radius / 4,
                            ),
                            image: DecorationImage(
                              image:
                                  NetworkImage(product[index].gallery![0].url!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product[index].category!.name!,
                                    style: bodyText.copyWith(
                                      fontSize: 10,
                                      color: greyColor,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    product[index].name!,
                                    style: bodyText.copyWith(
                                      fontSize: 11,
                                      color: textColor,
                                      fontWeight: semiBold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '110 USD',
                                    style: smallText.copyWith(
                                      fontSize: 10,
                                      color: Colors.amber,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPage(product: product[index]),
                                  ),
                                );
                              },
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  gradient: gradientColor,
                                  borderRadius: BorderRadius.circular(
                                    AppSize.radius / 3,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.chevron_right_outlined,
                                    color: textColor,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      );
    }

    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state is ProductError) {
          Get.snackbar(
            'Error',
            state.error,
            icon: const Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      },
      builder: (context, state) {
        if (state is ProductLoaded) {
          return Scaffold(
            backgroundColor: backgroundColor,
            body: ListView(
              children: [
                brandTile(),
                itemTile(state.products),
                newArivals(state.products),
              ],
            ),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: appbar(),
            ),
          );
        }
        return const Center(
          child: LoadingIndicator(),
        );
      },
    );
  }
}
