import 'package:base_project_v2/core/constants/app_colors.dart';
import 'package:base_project_v2/core/core_compoent/app_network_image.dart';
import 'package:base_project_v2/core/extensions/ui_extensions/category_component_theme.dart';
import 'package:base_project_v2/modules/home/domin/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({super.key, required this.category});

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: Theme.of(context).categoryDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppNetworkImage(
            url: category.image,
            borderRadius: BorderRadius.circular(10),
            height: 40.w,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...List.generate(
                  category.starts, (index) => const Icon(Icons.star)),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Hotel',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          Text(
            category.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.darkGreen),
                child: Text(
                  '${category.reviewScore}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Text(
                category.review,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Icon(Icons.pin_drop),
              const SizedBox(
                width: 10,
              ),
              Text(
                category.address,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: AppColors.grey,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Our lowest price',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      '\$ ${category.price}',
                      style: Theme.of(context).textTheme.displayMedium,
                    )
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: null,
                        child: Text(
                          'View Deal',
                          style: Theme.of(context).textTheme.labelMedium,
                        )),
                    const Icon(Icons.keyboard_arrow_right_sharp),
                  ],
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: null,
              child: Text(
                'More prices',
                style: Theme.of(context).textTheme.labelMedium,
              )),
        ],
      ),
    );
  }
}
