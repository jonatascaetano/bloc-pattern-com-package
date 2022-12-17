import '../model/contact.dart';

class ContactBookRepository {
  final List<Contact> _contacts = [];

  List<Contact> loadContact() {
    _contacts.addAll([
      Contact(name: "Bela", phone: "14132123121"),
      Contact(name: "Mel", phone: "116521323"),
      Contact(name: 'Marley', phone: "1684232132"),
    ]);
    return _contacts;
  }

  List<Contact> addContact({required Contact contact}) {
    _contacts.add(contact);
    return _contacts;
  }

  List<Contact> removeContact({required Contact contact}) {
    _contacts.remove(contact);
    return _contacts;
  }
}
