import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';

class HomeRoute {
  static const String name = '/home';
  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => const HomeScreen(),
  );
}
