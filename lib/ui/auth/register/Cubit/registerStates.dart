import 'package:movies/Data/models/registerResponse.dart';
import 'package:movies/errors/Errors.dart';

abstract class  RegisterStates {
}
class  RegisterInitialStates extends RegisterStates{
}
class  RegisterLoadingStates extends RegisterStates{
}
class  RegisterErrorStates extends RegisterStates{
  Errors error ;
  RegisterErrorStates({required this.error});
}
class  RegisterSuccessStates extends RegisterStates{
  RegisterResponse registerResponse;
  RegisterSuccessStates({required this.registerResponse});
}



