import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kurdish_names/src/kurdish_names/models/names_data_model.dart';
import 'package:kurdish_names/src/kurdish_names/services/kurdish_names_service.dart';
class KurdishNamesList extends StatelessWidget {
  KurdishNamesList({Key? key}) : super(key: key);

  KurdishNamesService _namesService = new KurdishNamesService();

  // TODO:create the DataModel

  //TODO:create a class for for the kurdish names service

  //TODO: create a . methode to get the list of kurdish names

  //TODO: render the list of users to the screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //DropdownButton(items: items, onChanged: onChanged)
                Text('data'),
                Text('data'),
                Text('data')
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: FutureBuilder<KurdishNames>(
                    future: _namesService.fetchListOfNames(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LinearProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else if (snapshot.data == null) {
                        return Text('no Data');
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.names.length,
                            itemBuilder: (context, index) {
                              return ExpansionTile(
                                  leading: Text(snapshot.data!.names[index].positive_votes.toString()),
                                  title:
                                      Text(snapshot.data!.names[index].name),
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Text(snapshot.data!.names[index].desc))
                                      ],
                              
                              );
                              
                            });
                      }
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
