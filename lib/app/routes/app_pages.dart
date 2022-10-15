import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/task_1/bindings/task_1_binding.dart';
import '../modules/task_1/booking/bindings/booking_binding.dart';
import '../modules/task_1/booking/views/booking_view.dart';
import '../modules/task_1/views/task_1_view.dart';
import '../modules/task_2/bindings/task_2_binding.dart';
import '../modules/task_2/views/task_2_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.TASK_1,
        page: () => const Task1View(),
        binding: Task1Binding(),
        children: [
          GetPage(
            name: _Paths.BOOKING,
            page: () => const BookingView(),
            binding: BookingBinding(),
          ),
        ]),
    // GetPage(
    //   name: _Paths.BOOKING,
    //   page: () => BookingView(),
    //   // binding: Task1Binding(),
    // ),
    GetPage(
      name: _Paths.TASK_2,
      page: () => const Task2View(),
      binding: Task2Binding(),
      children: const [],
    ),
  ];
}
