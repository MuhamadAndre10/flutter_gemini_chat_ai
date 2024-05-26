import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/module/home_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeNotifier(context: context),
      child: Consumer<HomeNotifier>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.grey,
          body: Center(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width > 600
                  ? 400
                  : MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      "pattern.jpeg",
                      repeat: ImageRepeat.repeat,
                      opacity: AlwaysStoppedAnimation(.6),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 0,
                    right: 0,
                    bottom: 60,
                    child: ListView(
                      reverse: true,
                      children: value.chats
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(
                                  left: 50,
                                  right: 10,
                                ),
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.zero,
                                    ),
                                  ),
                                  child: Text("${e}"),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      color: const Color.fromARGB(238, 0, 0, 0),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        20), // Image radius
                                    child: Image.asset("icony.png",
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Muhamad Andre",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 120, 174, 218)),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.more_vert,
                            size: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          color: Colors.white),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.add,
                            size: 20,
                          ),
                          Expanded(
                            child: TextField(
                              maxLines: null,
                              controller: value.chat,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      value.addmessages();
                                    },
                                    icon: const Icon(Icons.send),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                          ),
                          const Icon(
                            Icons.camera,
                            size: 20,
                          ),
                          const Icon(
                            Icons.mic,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
