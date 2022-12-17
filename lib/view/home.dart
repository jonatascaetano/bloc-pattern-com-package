import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/contact_book_bloc.dart';
import '../bloc/contact_book_events.dart';
import '../bloc/contact_book_states.dart';
import '../model/contact.dart';
import 'new_contact.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final ContactBookBloc contactBookBloc;

  @override
  void initState() {
    super.initState();
    contactBookBloc = ContactBookBloc();
    contactBookBloc.add(LoadContactBookEvent());
  }

  @override
  void dispose() {
    contactBookBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de contatos"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewContactBook(
                              contactBookBloc: contactBookBloc,
                            )));
              },
              icon: const Icon(Icons.person_add))
        ],
      ),
      body: BlocBuilder<ContactBookBloc, ContactBookState>(
          bloc: contactBookBloc,
          builder: ((_, state) {
            if (state is ContactBookInitialState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ContactBookSucessState) {
              final List<Contact> contacts = state.contacts;
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: ((_, index) {
                  return ListTile(
                    title: Text(contacts[index].name),
                    subtitle: Text(contacts[index].phone),
                    trailing: IconButton(
                        onPressed: () {
                          contactBookBloc.add(RemoveContactBoookEvent(
                              contact: contacts[index]));
                        },
                        icon: const Icon(Icons.remove)),
                  );
                }),
              );
            } else {
              return Container();
            }
          })),
    );
  }
}
