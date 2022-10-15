import '../providers/freerooms_provider.dart';

class FreeroomsRepository {
  List<String> getFreeRooms() {
    final freeroomsProvider = FreeroomsProvider();
    return freeroomsProvider.getFreeRooms();
  }
}
