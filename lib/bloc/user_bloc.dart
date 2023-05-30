
import 'package:creole/events/user_event.dart';
import 'package:creole/events/user_state.dart';
import 'package:creole/models/User.dart';
import 'package:creole/repo/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvatarBloc extends Bloc<AvatarEvent, UserState> {
  final AvatarRepository userRepository;

  AvatarBloc(this.userRepository) : super(UserLoadingState());

  @override
  Stream<UserState> mapEventToState(AvatarEvent event) async* {
    if (event is FetchAvatarEvent) {
      yield UserLoadingState();

      try {
        int currentPage = 1;
        List<User> allUsers = [];

        while (true) {
          final users = await userRepository.getUsers(page: currentPage);
          allUsers.addAll(users.users);

          if (currentPage >= users.totalPages) {
            break;
          }

          currentPage++;
        }

        yield UserLoadedState(allUsers);
      } catch (e) {
        yield UserErrorState(e.toString());
      }
    }
  }
}