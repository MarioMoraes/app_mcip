import 'package:app_mcip/app/core/helpers/dates.dart';
import 'package:app_mcip/app/core/helpers/formatter.dart';
import 'package:app_mcip/app/core/ui/theme_extension.dart';
import 'package:app_mcip/app/core/widgets/custom_text_form_field.dart';
import 'package:app_mcip/app/models/materia_prima_model.dart';
import 'package:app_mcip/app/modules/materia-prima/detail/controller/materia_prima_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class MateriaPrimaDetailPage extends StatefulWidget {
  final MateriaPrimaDetailController materiaPrimaDetailController;
  final MateriaPrimaModel model;

  const MateriaPrimaDetailPage(
      {Key? key,
      required this.materiaPrimaDetailController,
      required this.model})
      : super(key: key);

  @override
  State<MateriaPrimaDetailPage> createState() => _MateriaPrimaDetailPageState();
}

class _MateriaPrimaDetailPageState extends State<MateriaPrimaDetailPage> {
  final _formKey = GlobalKey<FormState>();
  final _custoEC = TextEditingController();

  MoneyMaskedTextController controller = MoneyMaskedTextController();

  @override
  void dispose() {
    super.dispose();
    _custoEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Custo'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () =>
                _configurandoModalBottomSheet(context, widget.model),
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Id',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              widget.model.id,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: context.primaryColor),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Descrição',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              widget.model.materiaPrima,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: context.primaryColor),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Última Atualização',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              DatesHelper.formatDateTime(widget.model.dataUltimaAtualizacao),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: context.primaryColor),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Custo Unitário',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              Formatter.formatCurrency(
                  double.parse(widget.model.custoUnitario)),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 175, 34, 23)),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  void _configurandoModalBottomSheet(context, model) {
    controller = MoneyMaskedTextController(
      initialValue: double.parse(model.custoUnitario),
    );

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return SizedBox(
          child: Wrap(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 50,
                        child: CustomTextFormField(
                          hint: 'Custo Unitário',
                          controller: controller,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            final formValid =
                                _formKey.currentState?.validate() ?? false;
                            if (formValid) {
                              await widget.materiaPrimaDetailController
                                  .updatePrice(
                                widget.model.empresaId,
                                widget.model.id,
                                controller.text,
                              );

                              Modular.to.pop(bc);
                              showToast(
                                "Matéria Prima Atualizada!",
                                context: context,
                                backgroundColor: Colors.blue.shade900,
                                duration: const Duration(seconds: 4),
                                position: StyledToastPosition.bottom,
                              );

                              widget.model.custoUnitario =
                                  controller.text.replaceAll(',', '.');
                              setState(() {});
                            }
                          },
                          icon: const Icon(Icons.save),
                          label: const Text('Salvar'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
