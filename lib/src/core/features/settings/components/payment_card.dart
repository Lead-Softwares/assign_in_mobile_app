import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:assign_in/src/core/features/settings/model/payment_model.dart';
import 'package:flutter/material.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({super.key, required this.paymentModel});
  final PaymentModel paymentModel;

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  late bool _isSwitched;

  @override
  void initState() {
    super.initState();
    _isSwitched = widget.paymentModel.isConnected;
  }

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      color: widget.paymentModel.bgColor.withValues(alpha: 0.05),
      padding: const EdgeInsets.all(myPadding / 2),
      border: Border.all(color: Colors.grey.shade200),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 70,
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.symmetric(vertical: myPadding / 2),
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    //  color: if(),
                    color: widget.paymentModel.imagebgColor ?? Colors.black,
                    borderRadius: BorderRadius.circular(myPadding / 2),
                  ),
                  child: widget.paymentModel.image != null
                      ? Image.asset(
                          widget.paymentModel.image ?? '',
                          fit: BoxFit.cover,
                        )
                      : Container(
                          clipBehavior: Clip.hardEdge,
                          margin: const EdgeInsets.all(myPadding / 1.2),
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: const Color(0xFFd5bce4),
                            borderRadius: BorderRadius.circular(myPadding / 2),
                          ),
                        ),
                ),
              ),
              const SizedBox(width: myPadding / 2),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.paymentModel.title,
                          style: context.textTheme.bodyMedium,
                        ),
                        const SizedBox(width: myPadding / 3),
                        if (_isSwitched)
                          Icon(
                            size: 18,
                            Icons.check_circle_outline_sharp,
                            color: Colors.green.shade600,
                          ),
                        const Expanded(child: SizedBox()),
                        SwitchWidget(
                          value: _isSwitched,
                          onChanged: (value) {
                            setState(() {
                              _isSwitched = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Text(
                      widget.paymentModel.description,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                        color: MyColors.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: myPadding / 2),
          _isConnected(),
        ],
      ),
    );
  }

  Widget _isConnected() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.circle,
              size: 16,
              color: _isSwitched ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: myPadding / 2),
            Text(
              _isSwitched ? 'Connected' : 'Not Connected',
              style: TextStyle(
                fontSize: 10,
                color: _isSwitched ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
        if (!_isSwitched)
          SizedBox(
            height: 30,
            width: 120,
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  _isSwitched = true;
                });
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.black87,
                alignment: Alignment.center,
              ),
              child: const Row(
                children: [
                  Icon(Icons.add, color: Colors.white, size: 16),
                  SizedBox(width: myPadding / 4),
                  Text(
                    'Connect',
                    style: TextStyle(fontSize: 11, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
