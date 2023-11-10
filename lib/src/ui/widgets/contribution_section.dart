import 'package:flutter/material.dart';
import 'package:dsfcrowdfunding/src/controllers/contribution_form_controller.dart';
import 'package:dsfcrowdfunding/src/theme/input_theme.dart';
import 'package:dsfcrowdfunding/src/theme/shared_widgets/custom_buttons.dart';
import 'package:dsfcrowdfunding/src/ui/payment_credit_card.dart';
import 'package:dsfcrowdfunding/src/ui/payment_pix_qr_code.dart';
import 'package:provider/provider.dart';

class ContributeSection extends StatelessWidget {
  const ContributeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff1E1D1D),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Contribuir',
              style: TextStyle(
                fontFamily: 'Archivo',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Selector<ContributionFormController, String>(
            builder: (context, selectedPrice, child) {
              return Row(
                children: [
                  PriceChip(
                      text: 'R\$ 5', isSelected: selectedPrice == 'R\$ 5'),
                  const SizedBox(width: 8),
                  PriceChip(
                      text: 'R\$ 10', isSelected: selectedPrice == 'R\$ 10'),
                  const SizedBox(width: 8),
                  PriceChip(
                      text: 'R\$ 20', isSelected: selectedPrice == 'R\$ 20'),
                ],
              );
            },
            selector: (context, controller) {
              return controller.selectedContribution ?? '-';
            },
          ),
          const SizedBox(height: 12),
          Selector<ContributionFormController, String>(
            builder: (context, selectedPrice, child) {
              return Row(
                children: [
                  PriceChip(
                      text: 'R\$ 50', isSelected: selectedPrice == 'R\$ 50'),
                  const SizedBox(width: 8),
                  PriceChip(
                    text: 'R\$ 100',
                    isSelected: selectedPrice == 'R\$ 100',
                  ),
                  const SizedBox(width: 8),
                  PriceChip(
                    text: 'R\$ 200',
                    isSelected: selectedPrice == 'R\$ 200',
                  ),
                ],
              );
            },
            selector: (context, controller) {
              return controller.selectedContribution ?? '-';
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: inputDecoration.copyWith(
              labelText: 'SEU NOME COMPLETO',
              hintText: 'Digite seu nome',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: inputDecoration.copyWith(
              labelText: 'SEU E-MAIL',
              hintText: 'Digite seu email',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: inputDecoration.copyWith(
              labelText: 'DEIXE UM RECADO PARA O ATLETA',
              hintText: 'Digite um recado',
            ),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            title: 'CONTRIBUIR COM PIX',
            minimumSize: const Size(double.infinity, 48),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const PaymentPixQrCode();
              }));
            },
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            title: 'CONTRIBUIR COM CARTÃO',
            minimumSize: const Size(double.infinity, 48),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const PaymentCreditCard();
              }));
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class PriceChip extends StatelessWidget {
  const PriceChip({
    super.key,
    required this.text,
    required this.isSelected,
  });
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          final controller = context.read<ContributionFormController>();
          controller.selectedContribution = text;
        },
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: isSelected
                ? null
                : Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
            color: isSelected ? const Color(0xffFF4A01) : null,
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Archivo',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
