import 'package:scoped_model/scoped_model.dart';
import '../models/posts.dart';
import '../models/user.dart';

class Post_scope extends Model {
  List<Posts> _posts = [
    Posts(
        user: Users(
            userName: 'AhmedSalah',
            userEmail: 'Ahmed@tes.com',
            picture: 'assets/home.jpg'),
        image: 'assets/home.jpg',
        label: 'this From My trip',
        likes: 10,
        favorite: false),
    Posts(
        user: Users(
            userName: 'AhmedSalah',
            userEmail: 'Ahmed@tes.com',
            picture: 'assets/home.jpg'),
        image: 'assets/home.jpg',
        label: 'this From My trip',
        likes: 10,
        favorite: true),
  ];

  get getPosts {
    return _posts;
  }

  List<Comments> comments = [
    Comments(
        Users(
            userName: 'ahmed',
            picture: 'assets/home.jpg',
            userEmail: 'ahmed@tes.com'),
        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin'),
    Comments(
        Users(
            userName: 'ahmed',
            picture: 'assets/home.jpg',
            userEmail: 'ahmed@tes.com'),
        'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration'),
    Comments(
        Users(
            userName: 'ahmed',
            picture: 'assets/home.jpg',
            userEmail: 'ahmed@tes.com'),
        'It is a long established fact that a reader'),
  ];

  void isFavorite(int index, isFavorite) {
    _posts[index].favorite = isFavorite;
    isFavorite ? _posts[index].likes += 1 : _posts[index].likes -= 1;
    notifyListeners();
  }
  void addPost(user , image , label){
  _posts.add(Posts(user: user , image: image , label: label));
  notifyListeners();

  }
}
