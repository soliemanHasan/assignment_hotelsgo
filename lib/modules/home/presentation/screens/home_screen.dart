import 'package:base_project_v2/core/constants/app_colors.dart';
import 'package:base_project_v2/core/core_compoent/failuer_component.dart';
import 'package:base_project_v2/core/core_compoent/loading_compoent.dart';
import 'package:base_project_v2/modules/home/presentation/components/category_component.dart';
import 'package:base_project_v2/modules/home/presentation/components/custom_slider.dart';
import 'package:base_project_v2/modules/home/presentation/components/rate_container.dart';
import 'package:base_project_v2/modules/home/presentation/components/star_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/base_state.dart';
import '../../domin/entities/category_entity.dart';
import '../blocs/home_bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // provided a bloc
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(const FetchCategoryEvent()),
      // listen to bloc state changes
      child: BlocListener<HomeBloc, BaseState<List<CategoryEntity>>>(
        listener: _homeListener,
        // build screen by bloc builder
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: BlocBuilder<HomeBloc, BaseState<List<CategoryEntity>>>(
              builder: (context, state) {
                if (state.isSuccess) {
                  return Container(
                    color: Colors.white,
                    child: Column(children: [
                      Card(
                        elevation: 1,
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(30),
                                top: Radius.zero,
                              )),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () => _showFilter(context),
                                  icon: Icon(Icons.filter_alt_sharp))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.all(3.w),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 4.w),
                          itemCount: state.data!.length,
                          itemBuilder: (context, index) =>
                              CategoryComponent(category: state.data![index]),
                        ),
                      ),
                    ]),
                  );
                }
                if (state.isError) {
                  return FailureComponent(failure: state.failure);
                }

                return const LoadingComponent();
              },
            ),
          ),
        ),
      ),
    );
  }

  void _homeListener(
      BuildContext context, BaseState<List<CategoryEntity>> state) {
    // TODO: implement listen cases
  }
}

Future _showFilter(context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            _buildSlider(context),
            const Text('Rating'),
            _buildRating(),
            const Text('Hotel Class'),
            _buildHotelClass(),
            const Text('Distance From'),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Location'),
                DropdownButton(items: [], onChanged: null),
              ],
            ),
            Divider(),
          ],
        );
      });
}

Widget _buildSlider(BuildContext context) {
  return Column(
    children: [
      CustomSlider(),
      Row(
        children: [
          const SizedBox(width: 20),
          Text(
            '\$0',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const Spacer(),
          Text(
            '\$100',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    ],
  );
}

Widget _buildHotelClass() {
  return const Row(
    children: [
      StarContainer(
        widget: Row(
          children: [
            Icon(
              Icons.star,
              color: AppColors.containerStarColor,
            ),
            Icon(
              Icons.star,
              color: AppColors.containerStarColor,
            ),
          ],
        ),
      ),
      StarContainer(
        widget: Row(
          children: [
            Icon(
              Icons.star,
              color: AppColors.containerStarColor,
            ),
            Icon(
              Icons.star,
              color: AppColors.containerStarColor,
            ),
          ],
        ),
      ),
      StarContainer(
        widget: Column(
          children: [
            Icon(
              Icons.star,
              color: AppColors.containerStarColor,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.containerStarColor,
                ),
                Icon(
                  Icons.star,
                  color: AppColors.containerStarColor,
                ),
              ],
            ),
          ],
        ),
      ),
      StarContainer(
        widget: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.containerStarColor,
                ),
                Icon(
                  Icons.star,
                  color: AppColors.containerStarColor,
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.containerStarColor,
                ),
                Icon(
                  Icons.star,
                  color: AppColors.containerStarColor,
                ),
              ],
            ),
          ],
        ),
      ),
      StarContainer(
        widget: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.containerStarColor,
                ),
                Icon(
                  Icons.star,
                  color: AppColors.containerStarColor,
                ),
              ],
            ),
            Icon(
              Icons.star,
              color: AppColors.containerStarColor,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.containerStarColor,
                ),
                Icon(
                  Icons.star,
                  color: AppColors.containerStarColor,
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _buildRating() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      RateContainer(rate: Rate.veryBad),
      RateContainer(rate: Rate.bad),
      RateContainer(rate: Rate.good),
      RateContainer(rate: Rate.verygood),
      RateContainer(rate: Rate.exelent),
    ],
  );
}
