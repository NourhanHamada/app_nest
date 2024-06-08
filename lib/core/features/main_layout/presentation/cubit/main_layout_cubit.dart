import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutCubit extends Cubit<int> {
  MainLayoutCubit() : super(0);
  static MainLayoutCubit get(context) =>
      BlocProvider.of<MainLayoutCubit>(context);

  void changeCurrentPageIndex(int index, {bool withAnimation = true}) {
    emit(index);
  }
}
