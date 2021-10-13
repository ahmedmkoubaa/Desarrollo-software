/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GUI;

import java.awt.Component;
import java.util.ArrayList;

/**
 *
 * @author Ivan
 */
public class CompositeJPanel extends javax.swing.JPanel {
    ArrayList<CompositeJPanel> hijos = new ArrayList<>();
    ArrayList<Component> elementos = new ArrayList<>();
    /**
     * Creates new form CompositeJPanel
     */
    
    public CompositeJPanel() {
        initComponents();
        this.setLayout(new java.awt.BorderLayout());
    }
    
   /* public CompositeJPanel(CompositeJPanel padre) {
        initComponents();
        parent = padre ;
    }*/
    
    public void render(){
        System.out.println("Renderizando...");
        
        for (CompositeJPanel h : hijos){
            this.add(h);
            h.render();
           
        }
        for (Component e : elementos){
            this.add(e);
//            e.setVisible(true);
        }
        
        this.repaint();
        this.revalidate();
        this.setVisible(true);
    }
    
    public void addElement(Component comp){
        elementos.add(comp);
        System.out.println("Añadido elemento " + comp.toString());
        render();
    }
    
    public void addComponent(CompositeJPanel comp){
        hijos.add(comp);
        System.out.println("Añadido panel " + comp.toString());
        render();
    }

    public ArrayList<CompositeJPanel> getHijos() {
        return hijos;
    }

    public ArrayList<Component> getElementos() {
        return elementos;
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        setBackground(new java.awt.Color(255, 204, 204));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 216, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );
    }// </editor-fold>//GEN-END:initComponents

    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables

}
