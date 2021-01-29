import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class SelectImages extends StatefulWidget {
  final Function(List<Asset> images) cbImages;
  final Function(Asset image) cbImage;

  const SelectImages({
    Key key,
    this.cbImages,
    this.cbImage,
  }) : super(key: key);

  @override
  _SelectImagesState createState() => _SelectImagesState();
}

class _SelectImagesState extends State<SelectImages> {
  List<Asset> images = List<Asset>();
  Asset image;

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      children: List.generate(
        images.length,
        (index) {
          Asset asset = images[index];
          return Stack(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    image = asset;
                    widget.cbImage(image);
                  });
                },
                child: AssetThumb(
                  asset: asset,
                  width: 300,
                  height: 300,
                ),
              ),
              image == asset
                  ? Positioned(
                      left: 8.0,
                      top: 8.0,
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                    )
                  : Container()
            ],
          );
        },
      ),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 12,
        enableCamera: false,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#00000",
          actionBarTitle: "Виберіть фотографії",
          allViewTitle: "Всі фото",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      widget.cbImages(images);
      image = null;
      widget.cbImage(null);
    });
  }

  Widget buildUploadImages() {
    return Container(
        height: 50,
        child: RaisedButton.icon(
          color: Colors.black,
          icon: Icon(Icons.cloud_upload, color: Colors.white),
          label: Text(
            "Вибрати фото для профілю",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          onPressed: loadAssets,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 350, child: Expanded(child: buildGridView())),
        SizedBox(height: 24),
        buildUploadImages()
      ],
    );
  }
}
