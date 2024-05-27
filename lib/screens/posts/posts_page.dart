import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mera_pariwar/components/home_components/user_overview.dart';
import 'package:mera_pariwar/components/interactive_elements/mini_button.dart';
import 'package:mera_pariwar/components/post_components/post_component.dart';
import 'package:mera_pariwar/hive/fav.dart';
import 'package:mera_pariwar/models/post_model.dart';
import 'package:mera_pariwar/scrollphysics/custom_scroll_physics.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mera_pariwar/screens/posts/events.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Posts> posts = [];
  late Box<FavPostData> favoritesBox;
  final PageController _pageController = PageController();
  bool isLoading = true;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    fetchPosts();
    favoritesBox = Hive.box<FavPostData>('favorites');
    _pageController.addListener(_handlePageChange);
  }

  @override
  void dispose() {
    _pageController.removeListener(_handlePageChange);
    _pageController.dispose();
    super.dispose();
  }

  void _handlePageChange() {
    setState(() {
      _currentPage = _pageController.page?.round() ?? 0;
    });
  }

  Future<void> fetchPosts() async {
    final url = Uri.parse(
        'http://ec2-18-208-225-72.compute-1.amazonaws.com:8500/posts?orgId=1&page=0&size=20');
    const username = 'user';
    const password = 'password';
    final credentials = base64Encode(utf8.encode('$username:$password'));

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Basic $credentials',
        'accept': '*/*',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['content'];

      setState(() {
        posts = jsonData.map((data) => Posts.fromJson(data)).toList();
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load posts');
    }
  }

  void fetchFavorites() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserPreview(
              imageUrl:
                  'https://franchisematch.com/wp-content/uploads/2015/02/john-doe.jpg',
              name: 'John Doe',
            ),
            const SizedBox(height: 6),
            _buildComponentSelector(),
            const SizedBox(height: 6),
            isLoading
                ? Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: PageView(
                      physics: const CustomPageViewScrollPhysics(),
                      controller: _pageController,
                      children: [
                        _buildPostsComponent(),
                        _buildFavoritesComponent(),
                        const EventsPage(),
                        const Text('Groups'),
                        const Text('Images'),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildComponentSelector() {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            MiniButton(
              iconpath: 'assets/icons/events.svg',
              selected: _currentPage == 0,
              text: 'Posts',
              onClick: () {
                _pageController.jumpToPage(0);
              },
            ),
            MiniButton(
              iconpath: 'assets/icons/pin.svg',
              selected: _currentPage == 1,
              text: 'Favorites',
              onClick: () {
                _pageController.jumpToPage(1);
                fetchFavorites(); // Ensure state is refreshed when switching to favorites
              },
            ),
            MiniButton(
              iconpath: 'assets/icons/events.svg',
              selected: _currentPage == 2,
              text: 'Events',
              onClick: () {
                _pageController.jumpToPage(2);
              },
            ),
            MiniButton(
              iconpath: 'assets/icons/grp.svg',
              selected: _currentPage == 3,
              text: 'Groups',
              onClick: () {
                _pageController.jumpToPage(3);
              },
            ),
            MiniButton(
              iconpath: 'assets/icons/home.svg',
              selected: _currentPage == 4,
              text: 'Images',
              onClick: () {
                _pageController.jumpToPage(4);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoritesComponent() {
    return ValueListenableBuilder(
      valueListenable: favoritesBox.listenable(),
      builder: (context, Box<FavPostData> box, _) {
        if (box.isEmpty) {
          return const Center(
            child: Text('No favorites available.'),
          );
        }
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            final favPost = box.getAt(index);
            if (favPost == null) {
              return const SizedBox(); // Placeholder for empty data
            }
            return PostComponent(
              id: favPost.id,
              images: favPost.images,
              text: favPost.text,
              fileUrl: favPost.fileUrl,
              title: favPost.title,
              personImageUrl: favPost.personImageUrl,
              personName: favPost.personName,
              time: favPost.time,
              groupName: favPost.groupName,
              groupAuthorName: favPost.groupAuthorName,
              likes: favPost.likes,
              type: favPost.type,
            );
          },
        );
      },
    );
  }

  Widget _buildPostsComponent() {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final data = posts[index];
        return PostComponent(
          images: data.contentUrls,
          id: data.id,
          title: data.title,
          text: data.content,
          fileUrl: data.contentUrls![0],
          personImageUrl:
              "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-55958-614810.jpg&fm=jpg",
          personName: "Diego",
          time: DateTime.parse(data.createdAt!),
          type: data.type,
          groupName: null,
          groupAuthorName: null,
          likes: 1,
        );
      },
    );
  }
}
