import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dsfcrowdfunding/src/controllers/contribution_form_controller.dart';
import 'package:dsfcrowdfunding/src/theme/shared_widgets/custom_buttons.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentPixQrCode extends StatelessWidget {
  const PaymentPixQrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QR Code Pix',
          style: TextStyle(
            fontFamily: 'MangoGrotesque',
            fontWeight: FontWeight.w600,
            fontSize: 34,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 36),
              const Text(
                'Escaneie o QR Code abaixo\npara realizar o pagamento',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Archivo',
                  color: Color(0xffFF4A01),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Center(
                child: QrImageView(
                  data: '1234567890',
                  eyeStyle: QrEyeStyle(
                    eyeShape: QrEyeShape.square,
                    color: Colors.grey[300],
                  ),
                  dataModuleStyle: QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.square,
                    color: Colors.grey[300],
                  ),
                  size: 300,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Tempo para transação:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'MangoGrotesque',
                      fontWeight: FontWeight.w600,
                      fontSize: 34,
                      color: Colors.grey[300],
                    ),
                  ),
                  const Spacer(),
                  const TimerContdown(
                    textStyle: TextStyle(
                      fontFamily: 'MangoGrotesque',
                      fontWeight: FontWeight.w600,
                      fontSize: 34,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Valor:',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Selector<ContributionFormController, String>(
                    builder: (context, value, child) {
                      return Text(
                        value,
                        style: const TextStyle(
                          fontSize: 22,
                          fontFamily: 'Archivo',
                        ),
                        textAlign: TextAlign.center,
                      );
                    },
                    selector: (context, controller) {
                      return controller.selectedContribution ?? '-';
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {},
                  child: ColoredBox(
                    color: Colors.grey.withAlpha(60),
                    child: const Padding(
                      padding: EdgeInsetsDirectional.all(16),
                      child: Row(
                        children: [
                          Text(
                            'Copiar link pagamento',
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Spacer(),
                          Icon(Icons.copy),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SecondaryButton(
                title: 'Voltar',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerContdown extends StatefulWidget {
  const TimerContdown({super.key, this.textStyle});
  final TextStyle? textStyle;

  @override
  State<TimerContdown> createState() => _TimerContdownState();
}

class _TimerContdownState extends State<TimerContdown> {
  int _minutes = 5;
  int _seconds = 0;

  late Timer _timer;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_seconds == 0) {
          final didEndMinutes = _minutes == 0;
          if (didEndMinutes) {
            setState(() {
              timer.cancel();
            });
          } else {
            setState(() {
              _seconds = 59;
              _minutes--;
            });
          }
        } else {
          setState(() {
            _seconds--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${'$_minutes'.padLeft(2, '0')}:${'$_seconds'.padLeft(2, '0')}',
      style: widget.textStyle,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
