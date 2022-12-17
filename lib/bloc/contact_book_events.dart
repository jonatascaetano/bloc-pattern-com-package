// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../model/contact.dart';

abstract class ContactBookEvent {}

class LoadContactBookEvent extends ContactBookEvent {}

class AddContactBookEvent extends ContactBookEvent {
  Contact contact;

  AddContactBookEvent({
    required this.contact,
  });
}

class RemoveContactBoookEvent extends ContactBookEvent {
  Contact contact;

  RemoveContactBoookEvent({
    required this.contact,
  });
}
