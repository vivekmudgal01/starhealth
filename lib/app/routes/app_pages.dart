import 'package:get/get.dart';

import '../modules/Audiopage/bindings/audiopage_binding.dart';
import '../modules/Audiopage/views/audiopage_view.dart';
import '../modules/enquiry/bindings/enquiry_binding.dart';
import '../modules/enquiry/views/enquiry_view.dart';
import '../modules/faqs/bindings/faqs_binding.dart';
import '../modules/faqs/views/faqs_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/leaderboard/bindings/leaderboard_binding.dart';
import '../modules/leaderboard/views/leaderboard_view.dart';
import '../modules/past_enquiry/bindings/past_enquiry_binding.dart';
import '../modules/past_enquiry/views/past_enquiry_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/redeem/bindings/redeem_binding.dart';
import '../modules/redeem/views/redeem_view.dart';
import '../modules/rewards/bindings/rewards_binding.dart';
import '../modules/rewards/views/rewards_view.dart';
import '../modules/support/bindings/support_binding.dart';
import '../modules/support/views/support_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.REWARDS,
      page: () => RewardsView(),
      binding: RewardsBinding(),
    ),
    GetPage(
      name: _Paths.REDEEM,
      page: () => RedeemView(),
      binding: RedeemBinding(),
      children: [],
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT,
      page: () => const SupportView(),
      binding: SupportBinding(),
    ),
    GetPage(
      name: _Paths.FAQS,
      page: () => const FaqsView(),
      binding: FaqsBinding(),
    ),
    GetPage(
      name: _Paths.ENQUIRY,
      page: () => const EnquiryView(),
      binding: EnquiryBinding(),
    ),
    GetPage(
      name: _Paths.PAST_ENQUIRY,
      page: () => const PastEnquiryView(),
      binding: PastEnquiryBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.LEADERBOARD,
      page: () => const LeaderboardView(),
      binding: LeaderboardBinding(),
    ),
    GetPage(
      name: _Paths.AUDIOPAGE,
      page: () => const AudiopageView(),
      binding: AudiopageBinding(),
    ),
  ];
}
