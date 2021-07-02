
import 'package:terkelola/data/remote/client/dio_client.dart';

abstract class BaseRepository{

  DioClient dioClient;

  BaseRepository(this.dioClient);
}