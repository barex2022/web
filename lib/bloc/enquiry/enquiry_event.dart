part of 'enquiry_bloc.dart';

@immutable
abstract class EnquiryEvent {}


class SubmitEnquiry extends EnquiryEvent{
  Enquiry enquiry;
  SubmitEnquiry(this.enquiry);
}
