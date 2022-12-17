// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../model/contact.dart';

abstract class ContactBookState {
  List<Contact> contacts;

  ContactBookState({
    required this.contacts,
  });
}

class ContactBookInitialState extends ContactBookState {
  ContactBookInitialState() : super(contacts: []);
}

class ContactBookSucessState extends ContactBookState {
  ContactBookSucessState({required super.contacts});
}
