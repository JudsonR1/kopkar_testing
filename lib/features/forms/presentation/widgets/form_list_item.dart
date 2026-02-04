import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class FormListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String type;
  final String url;

  const FormListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.url
  });

  Future<void> _openPdf(String url) async {
  final uri = Uri.parse(url);

  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not open $url';
  }
}

  Widget _iconForFile(String ext) {
    print("File extension is: $ext");
    switch (ext) {
      case 'pdf':
        // return SvgPicture.asset('assets/icons/selected_home.svg',width: 8);
        return Image.asset('assets/forms_page/pdf.png', width: 26,);
      default:
        return Icon(Icons.insert_drive_file, size: 20, color: Colors.red,);
    }
  }

  @override
  Widget build(BuildContext context) {
       return InkWell(
      onTap:  () =>_openPdf(url),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: _iconForFile(type),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
