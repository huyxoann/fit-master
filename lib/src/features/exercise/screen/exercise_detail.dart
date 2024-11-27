import 'package:fit_master/src/commom_widgets/header_back.dart';
import 'package:fit_master/src/core/constants/app_info.dart';
import 'package:fit_master/src/features/exercise/screen/widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import '../../../core/models/enum.dart';
import '../../../core/exception/response/status.dart';
import '../view_model/exercise.view_model.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final int exerciseId;
  final String title;
  final String coverImage;
  final int exerProfileId;

  const ExerciseDetailScreen({
    super.key,
    required this.exerciseId,
    required this.title,
    required this.coverImage,
    required this.exerProfileId,
  });

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    var widthScreen = AppInfo.getScreenWidth(context);
    var heightScreen = AppInfo.getScreenHeight(context);

    // Gọi API khi widget được xây dựng
    Future.microtask(() {
      context.read<ExerciseViewModel>().fetchExerciseDetail(exerciseId);
    });

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  child: HeaderAppBarCanBack(
                    key: key,
                    title: title,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                  child: SizedBox(
                height: 12,
              )),
              SliverList(
                delegate: SliverChildListDelegate([
                  // Hình ảnh bài tập
                  SizedBox(
                    height: heightScreen * 0.3,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/placeholder.png',
                        image: coverImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  // Exercise profile information
                  SizedBox(
                    height: heightScreen * 0.35,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: colorTheme.onBackground,
                                  ),
                                ),
                                const Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Text(
                                      "Thông tin bài tập",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: colorTheme.onBackground,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Chờ dữ liệu từ ViewModel và hiển thị
                          Consumer<ExerciseViewModel>(
                            builder: (context, viewModel, child) {
                              if (viewModel.exerciseDetail.status ==
                                  Status.LOADING) {
                                return const CircularProgressIndicator();
                              }

                              if (viewModel.exerciseDetail.status ==
                                  Status.ERROR) {
                                return Text(
                                    "Có lỗi xảy ra: ${viewModel.exerciseDetail.message}");
                              }

                              final exerciseDetail =
                                  viewModel.exerciseDetail.data;
                              if (exerciseDetail != null) {
                                return Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: colorTheme.surfaceBright,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          LabelTextExeProfile(
                                              iconData: LucideIcons.goal,
                                              label: TargetMuscle
                                                  .values[
                                                      viewModel.targetMuscle]
                                                  .vietnameseName),
                                          LabelTextExeProfile(
                                              iconData: LucideIcons.dumbbell,
                                              label: ExerciseType
                                                  .values[exerciseDetail
                                                          .exerciseProfile
                                                          .exerciseType -
                                                      1]
                                                  .vietnameseName),
                                          LabelTextExeProfile(
                                              iconData: LucideIcons.chevrons_up,
                                              label: ExperienceLevel
                                                  .values[
                                                      viewModel.experienceLevel]
                                                  .vietnameseName),
                                          LabelTextExeProfile(
                                              iconData:
                                                  LucideIcons.biceps_flexed,
                                              label: Mechanic
                                                  .values[exerciseDetail
                                                          .exerciseProfile
                                                          .mechanic -
                                                      1]
                                                  .vietnameseName),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }

                              return const Text("Dữ liệu bài tập không có");
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          // TabBar section
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: colorTheme.surfaceContainerHigh,
                    //margin: const EdgeInsets.only(top: 8),
                    child: DefaultTabController(
                      animationDuration: const Duration(milliseconds: 400),
                      length: 2, // Number of tabs
                      child: Consumer<ExerciseViewModel>(
                          builder: (context, viewModel, child) {
                        if (viewModel.exerciseDetail.status == Status.LOADING) {
                          return const CircularProgressIndicator();
                        }

                        if (viewModel.exerciseDetail.status == Status.ERROR) {
                          return Text(
                              "Có lỗi xảy ra: ${viewModel.exerciseDetail.message}");
                        }

                        final exerciseDetail = viewModel.exerciseDetail.data;

                        if (exerciseDetail != null) {
                          return Column(
                            children: [
                              TabBar(
                                labelStyle: textTheme.bodyLarge,
                                tabs: const [
                                  Tab(text: "Hướng dẫn"),
                                  Tab(text: "Mẹo"),
                                ],
                                labelColor: colorTheme.onSurface,
                                unselectedLabelColor: Colors.grey[350],
                                indicator: UnderlineTabIndicator(
                                    borderSide: BorderSide(
                                        width: 1, color: colorTheme.outline),
                                    insets: EdgeInsets.symmetric(
                                        horizontal: widthScreen * 0.25)),
                              ),
                              Container(
                                height: 160, // Tab content height
                                child: TabBarView(
                                  children: [
                                    // Tab 1: Hướng dẫn
                                    Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: SingleChildScrollView(
                                          child: ReadMoreText(
                                        exerciseDetail.instruction.join("\n"),
                                        trimMode: TrimMode.Line,
                                        trimLines: 4,
                                        colorClickableText: Colors.pink,
                                        trimCollapsedText: 'Show more',
                                        trimExpandedText: 'Show less',
                                        moreStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                    // Tab 2: Mẹo
                                    Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: SingleChildScrollView(
                                          child: ReadMoreText(
                                        exerciseDetail.tip.join("\n"),
                                        trimMode: TrimMode.Line,
                                        trimLines: 4,
                                        colorClickableText: Colors.pink,
                                        trimCollapsedText: 'Show more',
                                        trimExpandedText: 'Show less',
                                        moreStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                        return const Text("Dữ liệu bài tập không có");
                      }),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom delegate to handle the persistent header (HeaderAppBarCanBack)
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverAppBarDelegate({required this.child});

  @override
  double get maxExtent => 58; // Chiều cao tối đa của header
  @override
  double get minExtent => 58; // Chiều cao tối thiểu của header

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }
}
