import 'dart:html' as html;

import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';

import '../../shared/routes/route_paths.dart';

@Component(
  selector: 'bem-vindo-page',
  templateUrl: 'bem_vindo_page.html',
  styleUrls: ['bem_vindo_page.css'],
  directives: [coreDirectives],
  exports: [PortalRoutePaths],
)
class BemVindoPageComponent implements AfterViewInit {
  final Router _router;

  @ViewChild('bgVideo')
  html.Element? bgVideoRef;

  BemVindoPageComponent(this._router);

  @override
  void ngAfterViewInit() {
    _tryAutoplay();
  }

  void goToLogin() {
    _router.navigate(PortalRoutePaths.login.toUrl());
  }

  html.VideoElement? get _bgVideo {
    final el = bgVideoRef;
    if (el is html.VideoElement) return el;
    return null;
  }

  Future<void> _tryAutoplay() async {
    final video = _bgVideo;
    if (video == null) return;

    video.muted = true;
    video.setAttribute('muted', '');
    video.setAttribute('playsinline', '');
    video.setAttribute('webkit-playsinline', '');
    video.autoplay = true;
    video.loop = true;

    try {
      await video.play();
    } catch (_) {
      // The poster image remains visible if the browser refuses autoplay.
    }
  }
}
