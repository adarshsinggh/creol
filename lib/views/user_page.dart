import 'package:creole/bloc/user_bloc.dart';
import 'package:creole/events/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/user_event.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late AvatarBloc _avatarBloc;

  @override
  void initState() {
    super.initState();
    _avatarBloc = context.read<AvatarBloc>();
    _avatarBloc.add(FetchAvatarEvent());
  }

  @override
  void dispose() {
    _avatarBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
        actions: [
          IconButton(onPressed: (){
            _avatarBloc.add(FetchAvatarEvent());
          }, icon: Icon(Icons.refresh))
        ],
      ),
      body: BlocBuilder<AvatarBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserLoadedState) {
            final users = state.users;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(users[index].avatarUrl),
                ),
                title: Text('${users[index].firstName} ${users[index].lastName}'),
                subtitle: Text(users[index].email),
              ),
            );
          } else if (state is UserErrorState) {
            return Center(child: Text(state.errorMessage));
          }

          return Container();
        },
      ),

    );
  }
}
