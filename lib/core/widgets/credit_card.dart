import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moyasar/moyasar.dart';
import 'package:moyasar/src/utils/card_utils.dart';
import 'package:moyasar/src/utils/input_formatters.dart';
import 'package:moyasar/src/widgets/network_icons.dart';
import 'package:moyasar/src/widgets/three_d_s_webview.dart';
import 'package:test/core/utils/app_colors.dart';

/// The widget that shows the Credit Card form and manages the 3DS step.
class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({
    super.key,
    required this.config,
    required this.onPaymentResult,
    this.locale = const Localization.en(),
  });

  final Function onPaymentResult;
  final PaymentConfig config;
  final Localization locale;

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _cardData = CardFormModel();

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  bool _isSubmitting = false;

  bool _tokenizeCard = false;

  bool _manualPayment = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _tokenizeCard = widget.config.creditCard?.saveCard ?? false;
      _manualPayment = widget.config.creditCard?.manual ?? false;
    });
  }

  void _saveForm() async {
    closeKeyboard();

    bool isValidForm =
        _formKey.currentState != null && _formKey.currentState!.validate();

    if (!isValidForm) {
      setState(() => _autoValidateMode = AutovalidateMode.onUserInteraction);
      return;
    }

    _formKey.currentState?.save();

    final source = CardPaymentRequestSource(
        creditCardData: _cardData,
        tokenizeCard: _tokenizeCard,
        manualPayment: _manualPayment);
    final paymentRequest = PaymentRequest(widget.config, source);

    setState(() => _isSubmitting = true);

    final result = await Moyasar.pay(
        apiKey: widget.config.publishableApiKey,
        paymentRequest: paymentRequest);

    setState(() => _isSubmitting = false);

    if (result is! PaymentResponse ||
        result.status != PaymentStatus.initiated) {
      widget.onPaymentResult(result);
      return;
    }

    final String transactionUrl =
        (result.source as CardPaymentResponseSource).transactionUrl;

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          maintainState: false,
          builder: (context) => ThreeDSWebView(
            transactionUrl: transactionUrl,
            on3dsDone: (String status, String message) async {
              if (status == PaymentStatus.paid.name) {
                result.status = PaymentStatus.paid;
              } else if (status == PaymentStatus.authorized.name) {
                result.status = PaymentStatus.authorized;
              } else {
                result.status = PaymentStatus.failed;
                (result.source as CardPaymentResponseSource).message = message;
              }
              Navigator.pop(context);
              widget.onPaymentResult(result);
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: _autoValidateMode,
      key: _formKey,
      child: Column(
        children: [
          CardFormField(
              inputDecoration: buildInputDecoration(
                hintText: widget.locale.nameOnCard,
              ),
              keyboardType: TextInputType.text,
              validator: (String? input) =>
                  CardUtils.validateName(input, widget.locale),
              onSaved: (value) => _cardData.name = value ?? '',
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z. ]')),
              ]),
          Directionality(
            textDirection: TextDirection.ltr,
            child: CardFormField(
              inputDecoration: buildInputDecoration(
                  hintText: widget.locale.cardNumber, addNetworkIcons: true),
              validator: (String? input) =>
                  CardUtils.validateCardNum(input, widget.locale),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                CardNumberInputFormatter(),
              ],
              onSaved: (value) =>
                  _cardData.number = CardUtils.getCleanedNumber(value!),
            ),
          ),
          CardFormField(
            inputDecoration: buildInputDecoration(
              hintText: '${widget.locale.expiry} (MM / YY)',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
              CardMonthInputFormatter(),
            ],
            validator: (String? input) =>
                CardUtils.validateDate(input, widget.locale),
            onSaved: (value) {
              List<String> expireDate = CardUtils.getExpiryDate(value!);
              _cardData.month = expireDate.first;
              _cardData.year = expireDate[1];
            },
          ),
          CardFormField(
            inputDecoration: buildInputDecoration(
              hintText: widget.locale.cvc,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
            ],
            validator: (String? input) =>
                CardUtils.validateCVC(input, widget.locale),
            onSaved: (value) => _cardData.cvc = value ?? '',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  backgroundColor: appColor,
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: _isSubmitting ? () {} : _saveForm,
                child: _isSubmitting
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      )
                    : Text(
                        showAmount(
                          widget.config.amount,
                          widget.locale,
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
              ),
            ),
          ),
          SaveCardNotice(tokenizeCard: _tokenizeCard, locale: widget.locale)
        ],
      ),
    );
  }
}

class SaveCardNotice extends StatelessWidget {
  const SaveCardNotice({
    super.key,
    required this.tokenizeCard,
    required this.locale,
  });

  final bool tokenizeCard;
  final Localization locale;

  @override
  Widget build(BuildContext context) {
    return tokenizeCard
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.info,
                  color: appColor,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
                Text(
                  locale.saveCardNotice,
                  style: TextStyle(color: appColor),
                ),
              ],
            ))
        : const SizedBox.shrink();
  }
}

class CardFormField extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? inputDecoration;

  const CardFormField({
    super.key,
    required this.onSaved,
    this.validator,
    this.inputDecoration,
    this.keyboardType = TextInputType.number,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: inputDecoration,
        validator: validator,
        onSaved: onSaved,
        inputFormatters: inputFormatters,
      ),
    );
  }
}

String showAmount(int amount, Localization locale) {
  final formattedAmount = (amount / 100).toStringAsFixed(2);

  if (locale.languageCode == 'en') {
    return '${locale.pay} SAR $formattedAmount';
  }

  return '${locale.pay} $formattedAmount ر.س';
}

InputDecoration buildInputDecoration(
    {required String hintText, bool addNetworkIcons = false}) {
  return InputDecoration(
      suffixIcon: addNetworkIcons ? const NetworkIcons() : null,
      hintText: hintText,
      focusedErrorBorder: defaultErrorBorder,
      enabledBorder: defaultEnabledBorder,
      focusedBorder: defaultFocusedBorder,
      errorBorder: defaultErrorBorder,
      contentPadding: const EdgeInsets.all(8.0));
}

void closeKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

BorderRadius defaultBorderRadius = const BorderRadius.all(Radius.circular(8));

OutlineInputBorder defaultEnabledBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey[400]!),
    borderRadius: defaultBorderRadius);

OutlineInputBorder defaultFocusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey[600]!),
    borderRadius: defaultBorderRadius);

OutlineInputBorder defaultErrorBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red),
    borderRadius: defaultBorderRadius);

Color appColor = const Color(0xFF145288);
