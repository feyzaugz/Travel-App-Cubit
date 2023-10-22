import 'package:bloc/bloc.dart';
import '../model/data_model.dart';
import '../services/data_services.dart';
import 'app_state.dart';

//Qubit kullanan her uygulamanın bir başlangıç ​​durumu olmalıdır
//Daha sonra first state'i initialized ediyoruz
class AppCubit extends Cubit<CubitState> {
  //cubit oluşturuldu
  final DataServices data;
  late final List<DataModel> places;

  AppCubit({required this.data}) : super(InitialState()) {
    //önce InitialState çağrılır daha sonra otomatik olarak WelcomeState çağrılır.
    emit(
        WelcomeState()); //initialized ettikten sonra welcomeState trigger ediyoruz.
  }

  void getData() async {
    try {
      emit(LoadingState());
       places = await data.getInfo();
      if (places.isEmpty) {
        emit(ErrorState('İstek atılırken bir hata oluştu'));
      } else {
        emit(LoadedState(places));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
