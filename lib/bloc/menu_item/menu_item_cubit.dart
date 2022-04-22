import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'menu_item_state.dart';

class MenuItemCubit extends Cubit<MenuItemState> {
  MenuItemCubit() : super(MenuItemInitial());

  void selectIndex(int index) => emit(MenuItemSelected(index));
}
