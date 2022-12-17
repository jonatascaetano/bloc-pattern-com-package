import 'package:bloc_package/bloc/contact_book_events.dart';
import 'package:bloc_package/bloc/contact_book_states.dart';
import 'package:bloc_package/repository/contact_book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactBookBloc extends Bloc<ContactBookEvent, ContactBookState> {
  final _contactBookRepository = ContactBookRepository();

  ContactBookBloc() : super(ContactBookInitialState()) {
    on<LoadContactBookEvent>((event, emit) => emit(ContactBookSucessState(
        contacts: _contactBookRepository.loadContact())));
    on<AddContactBookEvent>((event, emit) => emit(ContactBookSucessState(
        contacts: _contactBookRepository.addContact(contact: event.contact))));
    on<RemoveContactBoookEvent>((event, emit) => emit(ContactBookSucessState(
        contacts:
            _contactBookRepository.removeContact(contact: event.contact))));
  }
}
