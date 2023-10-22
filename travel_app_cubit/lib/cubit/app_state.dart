import 'package:equatable/equatable.dart';

import '../model/data_model.dart';

abstract class CubitState extends Equatable{}

//Buradaki değişikliker UI etkiler, rebuild edilir
//ilk önce states yaratılır.
//Qubit kullanan her uygulamanın bir başlangıç ​​durumu olmalıdır
class InitialState extends CubitState { 
  @override
  List<Object> get props => [];
  
}

class WelcomeState extends CubitState{
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}


class LoadingState extends CubitState{ //state oluşturuldu
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}

class LoadedState extends CubitState{
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  // TODO: implement props
  List<Object> get props => [places];
  
}

class DetailState extends CubitState{
  DetailState(this.place);
  final DataModel place;
  @override
  // TODO: implement props
  List<Object> get props => [place];
  
}

class ErrorState extends CubitState{
  ErrorState(this.message);
  final String message;
  @override
  // TODO: implement props
  List<Object?> get props => [message];

}