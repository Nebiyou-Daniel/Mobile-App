import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  String name = "John Doe";
  String bio = "A passionate developer and a lifelong learner.";
  String image = "https://picsum.photos/200";
  String email = "";
  String phoneNumber = "";

  bool isEditingName = false;
  bool isEditingBio = false;
  bool isEditingEmail = false;
  bool isEditingPhoneNumber = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = name;
    bioController.text = bio;
    emailController.text = email;
    phoneNumberController.text = phoneNumber;
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  save() {
    saveBio();
    saveName();
    saveEmail();
    savePhoneNumber();
  }

  void saveName() {
    setState(() {
      name = nameController.text;
      isEditingName = false;
    });
  }

  void saveBio() {
    setState(() {
      bio = bioController.text;
      isEditingBio = false;
    });
  }

  void saveEmail() {
    setState(() {
      email = emailController.text;
      isEditingEmail = false;
    });
  }

  void savePhoneNumber() {
    setState(() {
      phoneNumber = phoneNumberController.text;
      isEditingPhoneNumber = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(image),
            ),
          ),
          const SizedBox(height: 20),
          isEditingName
              ? Row(
                  children: [
                    const Icon(Icons.person),
                    Expanded(
                      child: TextField(
                        controller: nameController,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.save),
                      onPressed: saveName,
                    ),
                  ],
                )
              : Row(
                  children: [
                    const Icon(Icons.person),
                    Expanded(child: Text(name)),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        save();
                        setState(() {
                          isEditingName = true;
                        });
                      },
                    ),
                  ],
                ),
          const SizedBox(height: 10),
          isEditingBio
              ? Row(
                  children: [
                    const Icon(Icons.info),
                    Expanded(
                      child: TextField(
                        controller: bioController,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.save),
                      onPressed: saveBio,
                    ),
                  ],
                )
              : Row(
                  children: [
                    const Icon(Icons.info),
                    Expanded(child: Text(bio)),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        save();
                        setState(() {
                          isEditingBio = true;
                        });
                      },
                    ),
                  ],
                ),
          const SizedBox(height: 10),
          isEditingEmail
              ? Row(
                  children: [
                    const Icon(Icons.email),
                    Expanded(
                      child: TextField(
                        controller: emailController,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.save),
                      onPressed: saveEmail,
                    ),
                  ],
                )
              : Row(
                  children: [
                    const Icon(Icons.email),
                    const Expanded(child: Text("Email")),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        save();
                        setState(() {
                          isEditingEmail = true;
                        });
                      },
                    ),
                  ],
                ),
          const SizedBox(height: 10),
          isEditingPhoneNumber
              ? Row(
                  children: [
                    const Icon(Icons.phone),
                    Expanded(
                      child: TextField(
                        controller: phoneNumberController,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.save),
                      onPressed: savePhoneNumber,
                    ),
                  ],
                )
              : Row(
                  children: [
                    const Icon(Icons.phone),
                    const Expanded(child: Text("Phone Number")),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        save();
                        setState(() {
                          isEditingPhoneNumber = true;
                        });
                      },
                    ),
                  ],
                ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 255, 163, 26))),
            child: const Text('Log Out'),
            onPressed: () {
              // Log out logic here
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)),
            child: const Text(
              'Terminate Account',
              // style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              // Terminate account logic here
            },
          ),
        ],
      ),
    );
  }
}
