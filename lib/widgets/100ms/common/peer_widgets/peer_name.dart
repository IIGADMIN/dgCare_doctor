//Package imports
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcaredoctor2050/widgets/100ms/common/util/app_color.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import '../../model/peer_track_node.dart';

class PeerName extends StatefulWidget {
  final String userName;
  final String userRole;
  PeerName({required this.userName, required this.userRole});

  @override
  State<PeerName> createState() => _PeerNameState();
}

class _PeerNameState extends State<PeerName> {
  @override
  Widget build(BuildContext context) {
    return Selector<PeerTrackNode, Tuple2<String, bool>>(
        selector: (_, peerTrackNode) =>
            Tuple2(peerTrackNode.peer.name, peerTrackNode.peer.isLocal),
        builder: (_, data, __) {
          var fullName = widget.userName.split(" ");
          //var name = fullName[0];
          String name = "";
          if(fullName.length >= 2){
            name = "${fullName[0]} ${fullName[1]}";
          }else{
            name = fullName[0];
          }
          
          return Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width/2),
            child: Text(
              "$name (${widget.userRole})",
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  color: themeDefaultColor,
                  fontSize: 14,
                  letterSpacing: 0.25,
                  height: 20 / 14),
            ),
          );
        });
  }

}
