
import 'package:dio/dio.dart';
import 'package:terkelola/data/remote/client/dio_client.dart';

abstract class BaseRepository{

  DioClient dioClient = DioClient(Dio());

  BaseRepository(this.dioClient);
}