






// enum TodoEvent { add, remove, toggle }
//
// class Todo extends Equatable {
//   final String title;
//   final String description;
//   final bool completed;
//
//   Todo({
//     @required this.title,
//     @required this.description,
//     this.completed = false,
//   }) : super([title, description, completed]);
//
//   Todo copyWith({
//     String title,
//     String description,
//     bool completed,
//   }) {
//     return Todo(
//       title: title ?? this.title,
//       description: description ?? this.description,
//       completed: completed ?? this.completed,
//     );
//   }
// }
//
//
// class TodoState extends Equatable {
//   final List<Todo> items;
//
//   TodoState({
//     @required this.items,
//   }) : super([items]);
// }
//
//
// class TodoBloc extends Bloc<TodoEvent, TodoState> {
//   @override
//   TodoState get initialState => TodoState(items: []);
//
//   @override
//   Stream<TodoState> mapEventToState(TodoEvent event) async* {
//     if (event == TodoEvent.add) {
//       yield TodoState(
//         items: List.from(state.items)..add(Todo(title: 'New todo')),
//       );
//     }
//     if (event == TodoEvent.remove) {
//       yield TodoState(
//         items: List.from(state.items)..removeLast(),
//       );
//     }
//     if (event == TodoEvent.toggle) {
//     final List<Todo>();
//   }
//   }
// }
//
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     MediaQueryData windowData = MediaQuery.of(context);
// //     windowData = windowData.copyWith(textScaler: const TextScaler.linear(1.0));
// //
// //     return MediaQuery(
// //       data: windowData,
// //       child: MaterialApp(
// //         title: "MyApp",
// //         theme: ThemeData(
// //           primarySwatch: Colors.blue,
// //           fontFamily: 'Pretendard',
// //         ),
// //         //initialRoute: SplashScreen.routeName,
// //         // routes: {
// //         //   SplashScreen.routeName: (context) => const SplashScreen(),
// //         //   HomeScreen.routeName: (context) => const HomeScreen(),
// //         //   PlayerScreen.routeName: (context) => const PlayerScreen(),
// //         //   DeepsleepScreen.routeName: (context) => const DeepsleepScreen(),
// //         //   NapScreen.routeName: (context) => const NapScreen(),
// //         //   MusicListScreen.routeName: (context) => const MusicListScreen(),
// //         //   SettingScreen.routeName: (context) => const SettingScreen(),
// //         //   WebviewScreen.routeName: (context) => const WebviewScreen(),
// //         //   TermsPrivacyScreen.routeName: (context) => const TermsPrivacyScreen(),
// //         //   OAuthScreen.routeName: (context) => const OAuthScreen(),
// //         //   DeleteScreen.routeName: (context) => const DeleteScreen(),
// //         //   SurveyScreen.routeName: (context) => const SurveyScreen(),
// //         //   PaymentScreen.routeName: (context) => const PaymentScreen(),
// //         //   PurchaseScreen.routeName: (context) => const PurchaseScreen(),
// //         //   PurchaseHistory.routeName: (context) => const PurchaseHistory(),
// //         // },
// //       ),
// //     );
// //   }
// // }
//
// class AppScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Todo App'),
//       ),
//       body: TodoList(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) => AddTodoScreen(),
//             ),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class TodoList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TodoBloc, TodoState>(
//       builder: (context, state) {
//         return ListView.builder(
//           itemCount: state.items.length,
//           itemBuilder: (context, index) {
//             final todo = state.items[index];
//             return TodoListItem(todo: todo);
//           },
//         );
//       },
//     );
//   }
// }
//
// class TodoListItem extends StatelessWidget {
//   final Todo todo;
//
//   const TodoListItem({
//     Key key,
//     @required this.todo,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(todo.title),
//       subtitle: Text(todo.description),
//       trailing: Checkbox(
//         value: todo.completed,
//         onChanged: (value) {
//           BlocProvider.of<TodoBloc>(context).add(TodoEvent.toggle);
//         },
//       ),
//     );
//   }
// }
//
// class AddTodoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Todo'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Title',
//                 ),
//               ),
//               SizedBox(height: 8),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Description',
//                 ),
//               ),
//               SizedBox(height: 16),
//               RaisedButton(
//                 onPressed: () {
//                   // Dispatch event to add a new todo
//                 },
//                 child: Text('Add Todo'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
