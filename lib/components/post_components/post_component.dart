import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:mera_pariwar/components/post_components/gallery.dart';
import 'package:mera_pariwar/components/post_components/like_share_pin.dart';
import 'package:mera_pariwar/hive/fav.dart';
import 'package:mera_pariwar/themes/themes.dart';
import 'package:multi_image_layout/multi_image_layout.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostComponent extends StatefulWidget {
  final List<String>? images;
  final String? text;
  final String? fileUrl;
  final String? title;
  final String? personImageUrl;
  final String? personName;
  final DateTime? time;
  final String? groupName;
  final String? groupAuthorName;
  final int? likes;
  final String? type;
  final int? id;

  const PostComponent({
    super.key,
    this.images,
    this.id,
    this.title,
    this.text,
    this.fileUrl,
    this.personImageUrl,
    this.personName,
    this.time,
    this.groupName,
    this.groupAuthorName,
    this.type,
    this.likes,
  });

  @override
  _PostComponentState createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  late bool isFav;
  YoutubePlayerController? _youtubeController;

  @override
  void initState() {
    super.initState();
    isFav = Hive.box<FavPostData>('favorites').containsKey(widget.id);
  }

  void addToFav(int id, FavPostData posts) {
    Hive.box<FavPostData>('favorites').put(id, posts);
    setState(() {
      isFav = true;
    });
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesBox = Hive.box<FavPostData>('favorites');
    isFav = favoritesBox.containsKey(widget.id);

    return Container(
      margin: const EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: widget.personImageUrl != null
                          ? CachedNetworkImageProvider(widget.personImageUrl!)
                          : null,
                      radius: 30,
                    ),
                    if (widget.groupName != null)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: AppTheme.navColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/grp.svg',
                              color: Colors.white,
                              height: 15,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.personName ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    if (widget.groupName == null)
                      Text(
                        DateFormat('d MMM, h a').format(widget.time!),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      )
                    else
                      Text(
                        '${widget.groupAuthorName} on ${DateFormat('d MMM, h a').format(widget.time!)}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (widget.title != null && widget.title!.isNotEmpty)
              SizedBox(
                width: double.infinity,
                child: Text(
                  widget.title!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            if (widget.text != null && widget.text!.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 5),
                child: ReadMoreText(
                  widget.text!,
                  trimMode: TrimMode.Line,
                  trimLines: 3,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: 'Read less',
                  moreStyle: const TextStyle(
                    color: Color(0xFF5D80B6),
                    fontSize: 16,
                  ),
                  lessStyle: const TextStyle(
                    color: Color(0xFF5D80B6),
                    fontSize: 16,
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            if ((widget.type == "IMAGE" || widget.type == "TEXT") &&
                widget.images != null &&
                widget.images!.isNotEmpty)
              MultiImageViewerWrapper(
                images: widget.images!,
                height: 250,
                width: double.infinity,
              ),
            if (widget.type == "DOC" &&
                widget.fileUrl != null &&
                widget.fileUrl!.isNotEmpty)
              Container(
                padding: const EdgeInsets.fromLTRB(16, 25, 16, 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey[300]!,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/file.svg',
                        height: 30,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        widget.fileUrl!.split('/').last,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/download.svg',
                      width: 20,
                      color: const Color.fromARGB(255, 63, 164, 247),
                    ),
                  ],
                ),
              ),
            if (widget.type == "VIDEO_EMBED" &&
                widget.fileUrl != null &&
                widget.fileUrl!.isNotEmpty)
              VisibilityDetector(
                key: Key(widget.fileUrl!),
                onVisibilityChanged: (visibilityInfo) {
                  if (visibilityInfo.visibleFraction > 0.1 &&
                      _youtubeController == null) {
                    setState(() {
                      _youtubeController = YoutubePlayerController(
                        initialVideoId:
                            YoutubePlayer.convertUrlToId(widget.fileUrl!)!,
                        flags: const YoutubePlayerFlags(autoPlay: false),
                      );
                    });
                  }
                },
                child: _youtubeController != null
                    ? YoutubePlayer(
                        controller: _youtubeController!,
                        showVideoProgressIndicator: true,
                        progressColors: const ProgressBarColors(
                          playedColor: Colors.amber,
                          handleColor: Colors.amberAccent,
                        ),
                      )
                    : Container(
                        height: 200,
                        color: Colors.black,
                      ),
              ),
            const SizedBox(height: 10),
            Container(
              transform: Matrix4.translationValues(-12.0, 0.0, 0.0),
              child: LikeSharePinBar(
                liked: isFav,
                onLiked: () {
                  setState(() {
                    if (isFav) {
                      favoritesBox.delete(widget.id);
                      isFav = false;
                    } else {
                      addToFav(
                        widget.id!,
                        FavPostData(
                          images: widget.images,
                          text: widget.text,
                          fileUrl: widget.fileUrl,
                          title: widget.title,
                          personImageUrl: widget.personImageUrl,
                          personName: widget.personName,
                          time: widget.time,
                          groupName: widget.groupName,
                          groupAuthorName: widget.groupAuthorName,
                          likes: widget.likes,
                          type: widget.type,
                          id: widget.id,
                        ),
                      );
                      isFav = true;
                    }
                  });
                },
                onShared: () {
                  Share.share("${widget.title}\n${widget.text}");
                },
                onPinned: () {},
              ),
            ),
            const Divider(
              color: Color(0x14000000),
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
