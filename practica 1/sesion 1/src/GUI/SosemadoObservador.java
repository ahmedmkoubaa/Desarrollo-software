/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GUI;

import java.util.Observable;
import java.util.Observer;
import javax.swing.JFrame;

/**
 *
 * @author Ahmed El Moukhtari
 */
public class SosemadoObservador extends JFrame implements Observer{
    @Override
    public void update(Observable o, Object o1) {
        System.out.println("Soy el método update implementado en SosemadoObservador");
    }
}   