import 'package:flutter/material.dart';
import 'package:my_puzzle/generated/l10n.dart';
import 'package:my_puzzle/src/ui/global/widgets/up_to_down.dart';
import 'package:my_puzzle/src/ui/utils/colors.dart';

Future<bool> showConfirmDialog(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) {
      final texts = S.current;
      return Center(
        child: UpToDown(
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: darkColor,
            child: SizedBox(
              width: 320,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Transform.scale(
                      scale: 1.5,
                      child: Image.asset(
                        'assets/images/relax-dash.png',
                        width: 200,
                      ),
                    ),
                  ),
                  Text(
                    texts.are_you_sure,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      texts.dou_you_really,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(
                            context,
                            true,
                          ),
                          child: Text(
                            texts.yes,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            texts.no,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
  return result ?? false;
}
