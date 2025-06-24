import 'package:dartz/dartz.dart';
import 'package:data/network_info/network_info.dart';
import 'package:domain/entities/failure.dart';
import 'package:domain/entities/localised_message.dart';

Future<Either<Failure, T >> safeApiCall<T>(NetworkInfo networkInfo , Future<T> Function() apiCall) async {
  if(await networkInfo.isConnected){

    try
    {
      final response = await apiCall();
      return Right(response);
    }catch(e){
      return Left(Failure(0 , LocalisedMessage("","")));
    }
  }else {
    // no internet connection
    return Left(Failure(0 , LocalisedMessage("please,connect to the internet","")));

  }
}