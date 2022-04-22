import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/enquiry.dart';

part 'enquiry_event.dart';
part 'enquiry_state.dart';

class EnquiryBloc extends Bloc<EnquiryEvent, EnquiryState> {
  EnquiryBloc() : super(EnquiryInitial()) {
    on<EnquiryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
