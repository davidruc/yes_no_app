
import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
   // Hay mucho código para hacer una petición en dart por lo que hay un paquete que lo permite en pub.dev -> http o también existe  -> dio
  final _peticionDio = Dio();
  Future<Message> getAnsWer() async{
    final response = await _peticionDio.get("https://yesno.wtf/api");

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
