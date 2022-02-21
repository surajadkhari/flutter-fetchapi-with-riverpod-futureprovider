import 'package:api_future/providers/data_provider.dart';
import 'package:api_future/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homepage extends ConsumerWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        body: _data.when(
          data: (_data) {
            return Column(
              children: [
                ..._data.map((e) => ListView(shrinkWrap: true, children: [
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              e: e,
                            ),
                          ),
                        ),
                        child: ListTile(
                          title: Text(e.firstname),
                          subtitle: Text(e.lastname),
                          trailing: CircleAvatar(
                            backgroundImage: NetworkImage(e.avatar),
                          ),
                        ),
                      ),
                    ])),
              ],
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
         
        ));
  }
}
