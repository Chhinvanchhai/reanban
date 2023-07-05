import 'package:flutter/material.dart';
import 'package:reanban/controllers/TodoController.dart';
import 'package:reanban/models/Todo2.dart';
import 'package:get/get.dart';

class AddPost extends StatelessWidget {
  String name = '';
  String email = '';
  String address = '';
  int age = 0;
  String phone = '';
  int id = 0;
  final int index;
  final TodoController todoController = Get.find();
  AddPost({Key? key, this.index = -1}) : super(key: key);

  void handleName(val) {
    print("Name is handling==$val");
    name = val;
  }

  void addPest() async {
    var data = Todo2(
        age: age, address: address, email: email, name: name, phone: phone);
    var getAddPost = await todoController.addPost(data);
    print('add responed $getAddPost');
    if (getAddPost > 0) {
      Get.back();
      Get.snackbar('Added Successfull', 'Your data have been recoded!');
    } else {
      Get.snackbar('Faied', 'Insert failed!');
    }
  }

  void updatePost() async {
    var data = Todo2(
        age: age,
        address: address,
        email: email,
        name: name,
        phone: phone,
        id: id);
    var updatePost = await todoController.updatePost(data);
    print('Date update repsone');
    if (updatePost >= 1) {
      Get.back();
      Get.snackbar('Updated Successfull', 'Your data have been Updated!');
    } else {
      Get.snackbar('Fialed Successfull', 'Updated Faild!');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    if (index > -1) {
      print(todoController.posts[index].name + index.toString());
      name = todoController.posts[index].name;
      age = todoController.posts[index].age ?? 0;
      phone = todoController.posts[index].phone ?? "99";
      email = todoController.posts[index].email ?? "maim";
      address = todoController.posts[index].address ?? "kamport";
      id = todoController.posts[index].id as int;
      nameController.text = name;
      ageController.text = age.toString();
      emailController.text = email;
      phoneController.text = phone;
      addressController.text = address;
    }
    print("index: " + index.toString());

    // TextEditingController idController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: index == -1 ? Text('Add New post') : Text('Edit')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
                controller: nameController,
                onChanged: (text) {
                  handleName(text);
                },
                autofocus: true,
                decoration: InputDecoration(hintText: 'Name')),
            TextField(
                autofocus: true,
                controller: emailController,
                onChanged: (text) {
                  email = text;
                },
                decoration: InputDecoration(hintText: 'Email')),
            TextField(
                onChanged: (text) {
                  age = int.parse(text);
                },
                controller: ageController,
                autofocus: true,
                decoration: InputDecoration(hintText: 'Age')),
            TextField(
                autofocus: true,
                controller: addressController,
                onChanged: (text) {
                  address = text;
                },
                decoration: InputDecoration(hintText: 'Address')),
            TextField(
                autofocus: true,
                controller: phoneController,
                onChanged: (text) {
                  phone = text;
                },
                decoration: InputDecoration(hintText: 'Phone')),
            index == -1
                ? TextButton(onPressed: () => addPest(), child: Text('Add'))
                : TextButton(
                    onPressed: () => updatePost(), child: Text('Update')),
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: index > -1
                        ? todoController.posts[index].post!.length
                        : 0,
                    itemBuilder: (BuildContext context, int index2) {
                      var postData =
                          index > -1 ? todoController.posts[index].post : [];
                      return Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        color: Colors.green,
                        child: Center(
                            child: Text('Entry ${postData![index2].title}')),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
