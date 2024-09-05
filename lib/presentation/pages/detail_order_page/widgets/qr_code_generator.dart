import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tedikap_user_bloc/common/theme.dart';
import 'package:share_plus/share_plus.dart';

class QRCodeGeneratorPage extends StatefulWidget {

  final String? qrData;

  const QRCodeGeneratorPage({super.key, required this.qrData});
  @override
  _QRCodeGeneratorPageState createState() => _QRCodeGeneratorPageState();
}

class _QRCodeGeneratorPageState extends State<QRCodeGeneratorPage> {
  GlobalKey globalKey = GlobalKey();
  // Data QR Anda
  Color baseColor = Colors.white;
  Color blackColor = Colors.black;
  TextStyle txtPrimaryTitle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

  Future<void> _captureAndSaveQRCode() async {
    try {
      RenderRepaintBoundary boundary =
      globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;

      final directory = (await getApplicationDocumentsDirectory()).path;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      File imgFile = File("$directory/qrCode.png");
      await imgFile.writeAsBytes(pngBytes);

      // Save to Gallery (Optional)
      var status = await Permission.storage.request();
      if (status.isGranted) {
        final result = await ImageGallerySaver.saveImage(pngBytes);
        if (result != null && result["isSuccess"]) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("QR Code successfully saved to gallery!")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Storage permission not granted")),
        );
      }


    } catch (e) {
      print(e.toString());
    }
  }


  Future<void> _shareQRCode() async {
    try {
      RenderRepaintBoundary boundary =
      globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();


      // Share the QR Code
      final shareResult = await Share.shareXFiles(
        [
          XFile.fromData(
            pngBytes,
            mimeType: 'image/png',
            name: 'qrCode.png',
          ),
        ],
        sharePositionOrigin: Offset.zero & Size.zero,
      );

    } catch (e) {
      print(e.toString());
    }
  }

  void _onAlertQrCode(BuildContext context, {String? orderId, Color? bgcolor}) {
    Alert(
      context: context,
      padding: const EdgeInsets.all(20),
      style: AlertStyle(
        animationType: AnimationType.shrink,
        isCloseButton: false,
        backgroundColor: bgcolor,
        overlayColor: Colors.black38,
        titleStyle: txtPrimaryTitle.copyWith(
          fontWeight: FontWeight.w600,
          color: blackColor,
        ),
      ),
      title: 'Show the QR Code to the cashier',
      image: RepaintBoundary(
        key: globalKey,
        child: SizedBox(
          width: 200,
          height: 200,
          child: QrImageView(
            data: orderId!,
            size: 200,
            version: QrVersions.auto,
            backgroundColor: Colors.white,
            gapless: true,
          ),
        ),
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            _captureAndSaveQRCode(); // Panggil fungsi untuk menyimpan QR
          },
          color: navyColor,
          child: Text(
            "Save",
            style: txtPrimaryTitle.copyWith(
                fontWeight: FontWeight.w600, color: baseColor),
          ),
        ),

        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            _shareQRCode(); // Panggil fungsi untuk menyimpan QR
          },
          color: navyColor,
          child: Text(
            "Share",
            style: txtPrimaryTitle.copyWith(
                fontWeight: FontWeight.w600, color: baseColor),
          ),
        ),
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _onAlertQrCode(context, orderId: widget.qrData, bgcolor: Colors.white);
      },
      child: Text('Show QR Code Alert', style: txtSecondarySubTitle.copyWith(
    fontWeight: FontWeight.w600,
    color: Colors.lightBlue,)),
    );
  }
}
