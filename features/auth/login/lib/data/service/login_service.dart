import 'package:dio/dio.dart';
import '../response/login_response.dart';
import 'package:retrofit/retrofit.dart';
part 'login_service.g.dart';

const String baseUrl = "https://valet.vps.kirellos.com/api/Valet";

@RestApi(baseUrl: baseUrl)
abstract class LoginService {
  factory LoginService(Dio dio, {String? baseUrl, ParseErrorLogger errorLogger }) = _LoginService;

  @POST('/login')
  Future<HttpResponse<LoginResponse>> login(
      @Field("phone") String phone, @Field("password") String password
       );
}
