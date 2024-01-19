import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  TextEditingController _controllerFirstName = TextEditingController();
  TextEditingController _controllerLastName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerNewPassword = TextEditingController();
  TextEditingController _controllerRepeatNewPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set the default value for the TextFormField
    _controllerFirstName.text = "Steve";
    _controllerLastName.text = "Jobs";
    _controllerEmail.text = "stevejobs@mail.com";
    _controllerPassword.text = "somepassword";
    _controllerNewPassword.text = "";
    _controllerRepeatNewPassword.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: IconButton(
            icon: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Back')
                ]),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        leadingWidth: 90,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Edit Account',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Gilroy',
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'FIRST NAME',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(color: Colors.transparent),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                              offset: Offset(1, 3),
                              blurRadius: 9,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _controllerFirstName,
                          maxLength: 25,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 16),
                            counterText: '',
                            hintText: 'Your new name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Gilroy',
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LAST NAME',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(color: Colors.transparent),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                              offset: Offset(1, 3),
                              blurRadius: 9,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _controllerLastName,
                          maxLength: 25,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 16),
                            counterText: '',
                            hintText: 'Your new last name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Gilroy',
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'EMAIL',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(color: Colors.transparent),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                          offset: Offset(1, 3),
                          blurRadius: 9,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: _controllerEmail,
                      maxLength: 25,
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'Your new Email',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Gilroy',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        prefixIcon:
                            Image.asset('assets/images/mail.png', width: 20),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PASSWORD',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(color: Colors.transparent),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                          offset: Offset(1, 3),
                          blurRadius: 9,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      obscureText: true,
                      controller: _controllerPassword,
                      maxLength: 25,
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'Your Password',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Gilroy',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        prefixIcon:
                            Image.asset('assets/images/key.png', width: 20),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'NEW PASSWORD',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(color: Colors.transparent),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                          offset: Offset(1, 3),
                          blurRadius: 9,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      obscureText: true,
                      controller: _controllerNewPassword,
                      maxLength: 25,
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'Enter new Password',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Gilroy',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        prefixIcon:
                            Image.asset('assets/images/key.png', width: 20),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'REPEAT NEW PASSWORD',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(color: Colors.transparent),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                          offset: Offset(1, 3),
                          blurRadius: 9,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      obscureText: true,
                      controller: _controllerRepeatNewPassword,
                      maxLength: 25,
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'Repeat new Password',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Gilroy',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        prefixIcon:
                            Image.asset('assets/images/key.png', width: 20),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 140),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: 52.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  gradient: const LinearGradient(
                    begin: Alignment(0.0, -1.0),
                    end: Alignment(1.0, 1.0),
                    colors: [
                      Color(0xFF59A7A7), Color(0xFFAFCD6D)
                    ],
                    stops: [0.0, 1.0],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Save',
                    style: TextStyle( 
                      color: Colors.white,
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
