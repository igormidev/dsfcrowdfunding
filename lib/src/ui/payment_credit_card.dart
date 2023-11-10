import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:dsfcrowdfunding/src/helpers/debouncer.dart';
import 'package:dsfcrowdfunding/src/theme/input_theme.dart';
import 'package:dsfcrowdfunding/src/theme/shared_widgets/custom_buttons.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentCreditCard extends StatefulWidget {
  const PaymentCreditCard({super.key});

  @override
  State<PaymentCreditCard> createState() => _PaymentCreditCardState();
}

class _PaymentCreditCardState extends State<PaymentCreditCard> {
  final Debouncer inputDebouncer = Debouncer(
    timerDuration: const Duration(
      milliseconds: 1400,
    ),
  );

  final TextEditingController cardNumber = TextEditingController(text: '');
  final TextEditingController expiryDate = TextEditingController(text: '');
  final TextEditingController cardHolderName = TextEditingController(text: '');
  final TextEditingController cvvCode = TextEditingController(text: '');
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contribuição por cartão'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 36),
              IgnorePointer(
                child: SizedBox(
                  height: 280,
                  child: _CreditCardItem(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    isCvvFocused: isCvvFocused,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: cardNumber,
                onTap: () => _setCVVFocus(false),
                decoration: inputDecoration.copyWith(
                  labelText: 'Número do cartão',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  MaskTextInputFormatter(
                    mask: '#### #### #### ####',
                    filter: {'#': RegExp(r'[0-9]')},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: cardHolderName,
                onTap: () => _setCVVFocus(false),
                decoration: inputDecoration.copyWith(
                  labelText: 'Nome completo',
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: expiryDate,
                      onTap: () => _setCVVFocus(false),
                      decoration: inputDecoration.copyWith(
                        labelText: 'Data expiração',
                        hintText: 'MM/AA',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        MaskTextInputFormatter(
                          mask: '##/##',
                          filter: {'#': RegExp(r'[0-9]')},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: cvvCode,
                      onTap: () => _setCVVFocus(true),
                      onTapOutside: (_) => _setCVVFocus(false),
                      decoration: inputDecoration.copyWith(
                        labelText: 'CVV',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        MaskTextInputFormatter(
                          mask: '####',
                          filter: {'#': RegExp(r'[0-9]')},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                title: 'EFETUAR PAGAMENTO',
                onPressed: () {},
              ),
              SecondaryButton(
                title: 'Voltar',
                onPressed: () {},
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  void _setCVVFocus(bool value) {
    if (isCvvFocused == value) return;
    if (context.mounted) {
      setState(() => isCvvFocused = value);
    }
  }
}

class _CreditCardItem extends StatefulWidget {
  // ignore: lines_longer_than_80_chars
  const _CreditCardItem({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.isCvvFocused,
  });
  final TextEditingController cardNumber;
  final TextEditingController expiryDate;
  final TextEditingController cardHolderName;
  final TextEditingController cvvCode;
  final bool isCvvFocused;

  @override
  State<_CreditCardItem> createState() => _CreditCardItemState();
}

class _CreditCardItemState extends State<_CreditCardItem> {
  @override
  void initState() {
    super.initState();
    widget.cardNumber.addListener(updateUi);
    widget.expiryDate.addListener(updateUi);
    widget.cardHolderName.addListener(updateUi);
    widget.cvvCode.addListener(updateUi);
  }

  @override
  void dispose() {
    widget.cardNumber.removeListener(updateUi);
    widget.expiryDate.removeListener(updateUi);
    widget.cardHolderName.removeListener(updateUi);
    widget.cvvCode.removeListener(updateUi);
    super.dispose();
  }

  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: widget.cardNumber.text,
      expiryDate: widget.expiryDate.text,
      cardHolderName: widget.cardHolderName.text,
      cvvCode: widget.cvvCode.text,
      showBackView: widget.isCvvFocused,
      onCreditCardWidgetChange: (
        CreditCardBrand brand,
      ) {}, // Callback for anytime credit card brand is changed
    );
  }
}
