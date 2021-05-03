
import 'package:base_flutter_2/data/remote/client/dio_client.dart';

abstract class BaseRepository{

  DioClient dioClient;

  BaseRepository(this.dioClient);
}