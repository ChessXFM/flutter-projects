import 'package:equatable/equatable.dart';


// ignore: must_be_immutable
class Todo extends Equatable{
        int? id;
  final String title;
  final String subtitle;
  final bool isDone;

  
    Todo({
    required this.title,
    this.subtitle ='',
    this.isDone =false,
    this.id
  });
 

Todo copyWith(){
    return Todo(title: title, subtitle: subtitle, isDone: isDone);
}

factory Todo.fromJson(Map<String,dynamic> json){
  return Todo(title: json['title'],subtitle: json['subtitle'],isDone:json['completed'],id:json['id'] );
}
Map<String,dynamic> toJson(Todo todo){
    return {
      'title': todo.title,
      'subtitle': todo.subtitle,
      'completed': todo.isDone,
      'id':todo.id,
    };
}

  @override
  List<Object?> get props => [title,subtitle,isDone,id];


}