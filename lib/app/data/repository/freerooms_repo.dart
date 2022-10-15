import '../providers/freerooms_provider.dart';

class FreeroomsRepository {
  Future<List<String>> getFreeRooms() async {
    final freeroomsProvider = FreeroomsProvider();
    return await freeroomsProvider.getFreeRooms();
  }
}
