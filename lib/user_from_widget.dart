import 'package:flutter/material.dart';
import 'package:p1/button_widget.dart';
import 'package:p1/user.dart';

class UserFromWidget extends StatefulWidget {
  final User? user;
  final ValueChanged<User> onSavedUser;

  const UserFromWidget({
    Key?key,
    this.user,
    required this.onSavedUser,
  }):super(key: key);
  

  @override
  State<UserFromWidget> createState() => _UserFromWidgetState();
}

class _UserFromWidgetState extends State<UserFromWidget> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerId;
  // late TextEditingController controllerEmail;
  @override
  void initState() {
    super.initState();
    initUser();
  }
  @override
  void didUpdateWidget(covariant UserFromWidget oldWidget){
    super.didUpdateWidget(oldWidget);

    initUser();
  }

  void initUser() {
    final id= widget.user==null?'':widget.user!.id;
    // final email =widget.user==null?'':widget.user!.email;

    setState(() {
      controllerId = TextEditingController(text: id);
      // controllerEmail = TextEditingController(text: email);
    });
  }

  @override
  Widget build(BuildContext context) => Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildId(),
            const SizedBox(height: 16),
            // buildEmail(),
            // const SizedBox(height: 16),
            buildSubmit(),
          ],
        ),
      );
  
  Widget buildId() => TextFormField(
        controller: controllerId,
        decoration: const InputDecoration(
          labelText: 'Id',
          border: OutlineInputBorder(),
        ),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter Id' : null,
      );
  
  // Widget buildEmail() => TextFormField(
  //       controller: controllerEmail,
  //       decoration: const InputDecoration(
  //         labelText: 'Email',
  //         border: OutlineInputBorder(),
  //       ),
  //       validator: (value) =>
  //           value !=null&& !value.contains('@') ? 'Enter Email' : null,
  //     );

  Widget buildSubmit() => ButtonWidget(
        text: 'save',
        onClicked: () {
          final form = formKey.currentState!;
          final isValid = form.validate();
          if (isValid) {
            final user = User(
              id: controllerId.text,
              // email: controllerEmail.text,
            );
            widget.onSavedUser(user);
          }
        },
      );
}
