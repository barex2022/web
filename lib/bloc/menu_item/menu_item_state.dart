part of 'menu_item_cubit.dart';

@immutable
abstract class MenuItemState extends Equatable {}

class MenuItemInitial extends MenuItemState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class MenuItemSelected extends MenuItemState {
  int index;
  MenuItemSelected(this.index);
  @override
  // TODO: implement props
  List<Object?> get props => [this.index] ;

}
