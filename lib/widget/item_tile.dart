import 'package:flutter/material.dart';
import 'package:sneaker/page/detail_page.dart';
import '../model/product_model.dart';
import '../theme/color.dart';
import '../theme/size.dart';
import '../theme/text.dart';

class ItemTile extends StatelessWidget {
  final ProductModel? product;
  const ItemTile({
    this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: AppSize.contentMargin),
          child: Stack(
            children: [
              Container(
                width: 185,
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppSize.radius / 2,
                  ),
                  color: backgroundColor1,
                ),
              ),
              Container(
                width: 155,
                height: 165,
                margin: const EdgeInsets.only(
                  right: 15,
                  left: 15,
                  top: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.radius / 4),
                  image: DecorationImage(
                    image: NetworkImage(product!.gallery![0].url!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Positioned(
                top: 195,
                left: 15,
                right: 15,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product!.category!.name!,
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
                            product!.name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: bodyText.copyWith(
                              fontSize: 12,
                              color: textColor,
                              fontWeight: semiBold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${product!.price!.round()} USD',
                            style: smallText.copyWith(
                              color: Colors.amber,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(product: product!),
                          ),
                        );
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          gradient: gradientColor,
                          borderRadius: BorderRadius.circular(
                            AppSize.radius / 3,
                          ),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.chevron_right_outlined,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
