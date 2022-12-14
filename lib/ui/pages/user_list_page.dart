import 'package:f_chat_template/ui/controllers/chat_controller.dart';
import 'package:f_chat_template/ui/my_theme.dart';
import 'package:f_chat_template/ui/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import '../../data/model/app_user.dart';
import '../controllers/authentication_controller.dart';
import '../controllers/user_controller.dart';

// Widget donde se presentan los usuarios con los que se puede comenzar un chat
class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  // obtenemos la instancia de los controladores
  AuthenticationController authenticationController = Get.find();
  ChatController chatController = Get.find();
  UserController userController = Get.find();

  @override
  void initState() {
    // le decimos al userController que se suscriba a los streams
    userController.start();
    super.initState();
  }

  @override
  void dispose() {
    // le decimos al userController que se cierre los streams
    userController.stop();
    super.dispose();
  }

  _logout() async {
    try {
      await authenticationController.logout();
    } catch (e) {
      logError(e);
    }
  }

  Widget _item(AppUser element) {
    // Widget usado en la lista de los usuarios
    // mostramos un avatar, el correo y uid
    return Card(
      margin: const EdgeInsets.all(6),
      child: ListTile(
        onTap: () {
          Get.to(
            () => const ChatPage(),
            arguments: [
              element.uid,
              element.email,
              element.urlImage,
            ],
          );
        },
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: NetworkImage(element.urlImage),
        ),
        title: Text(
          element.email,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: MyTheme.primaryColor,
          ),
        ),
        subtitle: Text(element.uid, style: const TextStyle(fontSize: 17)),
      ),
    );
  }

  Widget _list() {
    // Un widget con La lista de los usuarios con una validaci??n para cu??ndo la misma este vacia
    // la lista de usuarios la obtenemos del userController
    return GetX<UserController>(builder: (controller) {
      if (userController.users.length == 0) {
        return const Center(
          child: Text('No users'),
        );
      }
      return ListView.builder(
        itemCount: userController.users.length,
        itemBuilder: (context, index) {
          var element = userController.users[index];
          return _item(element);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final userEmail = authenticationController.userEmail();
    return Scaffold(
        appBar: AppBar(
          title: Text("User $userEmail chats"),
          actions: [
            // bot??n para crear unos chats para arrancar el demo
            IconButton(
                onPressed: () {
                  chatController.initializeChats();
                },
                icon: const Icon(Icons.play_circle_outlined)),
            // bot??n para cerrar la sesi??n con el usuario
            IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  _logout();
                }),
          ],
        ),
        body: _list());
  }
}
