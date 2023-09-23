import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:poster/features/posts/presentation/bloc/posts/posts_bloc.dart';

import 'injection_dep.dart' as di;

class GenerateMultiBloc extends StatelessWidget {
  final Widget child;

  const GenerateMultiBloc({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<PostsBloc>()
            ..add(
              GetAllPostsEvent(),
            ),
        ),
        BlocProvider(
          create: (_) => di.sl<AddDeleteUpdatePostBloc>(),
        ),
      ],
      child: child,
    );
  }
}
