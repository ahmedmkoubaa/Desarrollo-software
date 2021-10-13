import 'package:test/test.dart';
import 'package:ds_practica2/ModeloSOSEMADO/Cliente.dart';
import 'package:ds_practica2/ModeloSOSEMADO/Tecnico.dart';
import 'package:ds_practica2/ModeloSOSEMADO/Trabajo.dart';

void main() {
  group('Cliente', () {
    test(
        'Comprobar que si el cliente define un trabajo, el atributo Cliente.trabajo no esté nulo.',
        () {
      Cliente cliente = new Cliente('Prueba 1');
      cliente.defineTrabajo('Trabajo de prueba');
      expect(cliente.trabajo, isNot(null));
    });
  });

  group('Técnico', () {
    test(
        'Comprobar que si al trabajo se le asigne un técnico, el campo Trabajo.tecnicoAsignado no sea nulo, ni el atributo Tecnico.trabajoAsignado tampoco lo sea.',
        () {
      Tecnico tecnico = new Tecnico('Test');
      Cliente cliente = new Cliente('Prueba 2');
      cliente.defineTrabajo('Trabajo de prueba');
      Trabajo trabajo = cliente.getTrabajo();
      trabajo.asignarTecnico(tecnico);

      expect(tecnico.trabajo, isNot(null));
      expect(trabajo.tecnico, isNot(null));
    });
  });

  group('Trabajo', () {
    test(
        'Comprobar que al dar un parte de técnico, al acceder a Trabajo.parteTecnico, este no sea nulo y al obtener sus atributos, estas contengan los valores que hayamos definido previamente.',
        () {
      Cliente cliente = new Cliente('Prueba 3');
      cliente.defineTrabajo('Trabajo de prueba');
      Trabajo trabajo = cliente.getTrabajo();

      trabajo.darParteTecnico(8, 10, 6);

      expect(trabajo.parteTecnico, isNot(null));
      expect(trabajo.parteTecnico.amabilidad, 8);
      expect(trabajo.parteTecnico.profesionalidad, 10);
      expect(trabajo.parteTecnico.eficacia, 6);
    });

    test(
        'Comprobar que al dar un parte de trabajo, al acceder a Trabajo.parteTrabajo, este no sea nulo y al obtener sus atributos, estas contengan los valores que hayamos definido previamente.',
        () {
      Cliente cliente = new Cliente('Prueba 4');
      cliente.defineTrabajo('Trabajo de prueba');
      Trabajo trabajo = cliente.getTrabajo();

      trabajo.darParteTrabajo(8, 10, 6);

      expect(trabajo.parteTrabajo, isNot(null));
      expect(trabajo.parteTrabajo.horasExtra, 8);
      expect(trabajo.parteTrabajo.costoMaterialesExtra, 10);
      expect(trabajo.parteTrabajo.costeDesplazamiento, 6);
    });

    test(
        'Comprobar que al efectuar el pago, los filtros modifiquen la cantidad a pagar correctamente.',
        () {
      Cliente cliente = new Cliente('Prueba 5');
      Tecnico tecnico = new Tecnico('Test');
      cliente.defineTrabajo('Trabajo de prueba');
      Trabajo trabajo = cliente.getTrabajo();
      trabajo.asignarTecnico(tecnico);
      int precio = 6000;

      trabajo.darParteTecnico(10, 8, 9);
      trabajo.darParteTrabajo(9, 4, 5);

      tecnico.darPresupuesto(precio * 1.0);

      cliente.pagar();
      tecnico.cobrar(trabajo);

      expect(trabajo.presupuesto, isNot(equals(precio * 1.0)));
    });

    test(
        'Comprobar si al dar un presupuesto un técnico a un trabajo, el campo Trabajo.presupuesto fuera actualizado.',
        () {
      Cliente cliente = new Cliente('Prueba 5');
      Tecnico tecnico = new Tecnico('Test');
      cliente.defineTrabajo('Trabajo de prueba');
      Trabajo trabajo = cliente.getTrabajo();
      trabajo.asignarTecnico(tecnico);
      int precio = 6000;

      tecnico.darPresupuesto(precio * 1.0);
      expect(trabajo.getPresupuesto(), isNot(null));
    });
  });
}
