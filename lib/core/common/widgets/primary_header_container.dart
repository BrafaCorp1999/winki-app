import 'package:flutter/material.dart';
import 'package:wink/core/common/view_models/circular_container_view_model.dart';
import 'package:wink/core/common/widgets/circular_container.dart';
import 'package:wink/core/common/widgets/curved_widget.dart';
import 'package:wink/core/utils/constants/colors.dart';

const Color winkPink = Color(0xFFF5DDD8); // fondo general
const Color winkGold = Color(0xFFD4B170); // botones o detalles
const Color winkBlack = Color(0xFF1E1E1E); // texto, íconos

final Color lightFrenchBeige = const Color(0xFFD0A583); // Fondo principal
final Color bittersweetShimmer = const Color(0xFFBA4353); // Encabezados y elementos destacados
final Color oliveDrabCamouflage = const Color(0xFF54E34); // Botones principales (marrón)
final Color citron = const Color(0xFFAD9F22); // Color secundario/acentos

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CurvedWidget(
      child: Container(
        color: bittersweetShimmer,
        padding: EdgeInsets.zero,
        child: SizedBox(
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(
                  circularContainerModel: CircularContainerModel(
                    height: 400,
                    width: 400,
                    borderRadius: 400,
                    color: TColors.textWhite.withValues(alpha: 0.1),
                  ),
                ),
              ),
              Positioned(
                  right: -300,
                  top: 100,
                  child: CircularContainer(
                      circularContainerModel: CircularContainerModel(
                    height: 400,
                    width: 400,
                    borderRadius: 400,
                    color: TColors.textWhite.withValues(alpha: 0.1),
                  ))),
              child
            ],
          ),
        ),
      ),
    );
  }
}
