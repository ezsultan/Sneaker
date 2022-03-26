import 'package:flutter/material.dart';
import 'package:sneaker/model/product_model.dart';
import 'package:sneaker/theme/color.dart';
import 'package:sneaker/theme/size.dart';
import 'package:sneaker/theme/text.dart';

class NewArivalsTile extends StatelessWidget {
  final List<ProductModel> product;
  const NewArivalsTile({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              childAspectRatio: 2 / 2.9,
              crossAxisCount: 2,
              mainAxisSpacing: AppSize.contentMargin,
              crossAxisSpacing: AppSize.contentMargin,
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
                                  maxLines: 1,
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
                          Container(
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
}
