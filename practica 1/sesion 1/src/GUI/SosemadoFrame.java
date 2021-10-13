/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GUI;
import Modelo.Cliente;
import Modelo.Tecnico;
import Modelo.TecnicoPujador;
import Modelo.Trabajo;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;
import java.awt.LayoutManager;
import java.util.ArrayList;
import java.util.Observable;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JTextArea;
import javax.swing.JTextField;


import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.xy.XYDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;

/**
 *
 * @author Ahmed El Moukhtari
 */
public class SosemadoFrame extends SosemadoObservador implements Runnable {
    
    private Boolean euroAPeseta = false;

    /**
     * Creates new form SosemadoFrame
     */
    public SosemadoFrame() {
        initComponents();
        System.out.print("Añadido observer");
        trabajo.addObserver(this);
        System.out.println("Nº de observers : " + trabajo.countObservers() );
        jChartPanel.setLayout(new java.awt.BorderLayout());
        jChartPanel.add(new ChartPanel(createChart()),BorderLayout.CENTER);
        jChartPanel.validate();
        
        // Inicializar panel sobre el que se alojaré nuestro compuesto
        jCompositePanel.setLayout(new java.awt.BorderLayout());
        jCompositePanel.add(componente);
        
        // Añddir elemento a nuestro objeto compuesto
        componente.addElement(new JLabel("Divisas"));

        // Añadir componente a objeto compuesto
        componente.addComponent(new CompositeJPanel());
        componente.getHijos().get(0).setSize(220, 220);
        componente.getHijos().get(0).setBackground(Color.red);
        
        componente.getHijos().get(0).addElement(new JButton("Convertir"));
        componente.getHijos().get(0).getElementos().get(0).setSize(100, 30);
        componente.getHijos().get(0).getElementos().get(0).setLocation(60, 180);
        componente.getHijos().get(0).getElementos().get(0).setVisible(false);
        ((JButton)componente.getHijos().get(0).getElementos().get(0)).addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                convertirActionPerformed(evt);
            }
        });
        
        
//        ((JButton)componente.getHijos().get(0).getElementos().get(0)).setHorizontalAlignment(javax.swing.JButton.CENTER);
//        componente.getHijos().get(0).getElementos().get(0).;
        
        
         // Añadir un campo de texto
        componente.getHijos().get(0).addElement(new JTextField(5));
        componente.getHijos().get(0).getElementos().get(1).setLocation(60,40);
        componente.getHijos().get(0).getElementos().get(1).setSize(100,40);
        componente.getHijos().get(0).getElementos().get(1).setBackground(Color.GREEN);
        componente.getHijos().get(0).getElementos().get(1).setVisible(true);
        
        
        componente.getHijos().get(0).addElement(new JTextField(5));
        componente.getHijos().get(0).getElementos().get(2).setLocation(60, 120);
        componente.getHijos().get(0).getElementos().get(2).setSize(100,40);
        componente.getHijos().get(0).getElementos().get(2).setBackground(Color.ORANGE);
        componente.getHijos().get(0).getElementos().get(2).setVisible(true);
        
        
        // Añadir elemento label y modificarlo, no se quiere modificar
        componente.getHijos().get(0).addElement(new JLabel("En Euros"));
        componente.getHijos().get(0).getElementos().get(3).setForeground(Color.white);
        componente.getHijos().get(0).getElementos().get(3).setLocation(80,20);
        componente.getHijos().get(0).getElementos().get(3).setSize(100, 20);
        
        // Añadir elemento label 
        componente.getHijos().get(0).addElement(new JLabel("En pesetas"));
        componente.getHijos().get(0).getElementos().get(4).setForeground(Color.white);
        ((JLabel)componente.getHijos().get(0).getElementos().get(4)).setHorizontalAlignment(javax.swing.JLabel.CENTER);
//        componente.getHijos().get(0).getElementos().get(4).setLocation(80,120);
//        componente.getHijos().get(0).getElementos().get(4).setSize(100, 20);
        
        ((JTextField)componente.getHijos().get(0).getElementos().get(1)).setText("");
        ((JTextField)componente.getHijos().get(0).getElementos().get(2)).setText("");
        
        
        ((JTextField)componente.getHijos().get(0).getElementos().get(1)).setEditable(false);
        ((JTextField)componente.getHijos().get(0).getElementos().get(2)).setEditable(false);
        
        jCompositePanel.validate();
    }
    
    

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        tenicoPanel = new javax.swing.JPanel();
        textOfertaCliente = new javax.swing.JTextField();
        actualizar = new javax.swing.JButton();
        clientePanel = new javax.swing.JPanel();
        textOfertaActual1 = new javax.swing.JTextField();
        pujadorPanel = new javax.swing.JPanel();
        buttonPujar = new javax.swing.JButton();
        textPuja = new javax.swing.JTextField();
        textOfertaTecnico = new javax.swing.JTextField();
        jTextField1 = new javax.swing.JTextField();
        jChartPanel = new javax.swing.JPanel();
        jCompositePanel = new javax.swing.JPanel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        tenicoPanel.setBackground(new java.awt.Color(255, 0, 0));

        textOfertaCliente.setEditable(false);
        textOfertaCliente.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        textOfertaCliente.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        textOfertaCliente.setText("oferta actual");
        textOfertaCliente.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                textOfertaClienteActionPerformed(evt);
            }
        });

        actualizar.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        actualizar.setText("ACTUALIZAR");
        actualizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                actualizarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout tenicoPanelLayout = new javax.swing.GroupLayout(tenicoPanel);
        tenicoPanel.setLayout(tenicoPanelLayout);
        tenicoPanelLayout.setHorizontalGroup(
            tenicoPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(textOfertaCliente)
            .addComponent(actualizar, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 160, Short.MAX_VALUE)
        );
        tenicoPanelLayout.setVerticalGroup(
            tenicoPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(tenicoPanelLayout.createSequentialGroup()
                .addGap(16, 16, 16)
                .addComponent(textOfertaCliente, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 31, Short.MAX_VALUE)
                .addComponent(actualizar, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        getContentPane().add(tenicoPanel, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 11, 160, 120));

        clientePanel.setBackground(new java.awt.Color(0, 255, 0));
        clientePanel.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        textOfertaActual1.setEditable(false);
        textOfertaActual1.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        textOfertaActual1.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        textOfertaActual1.setText(Float.toString(trabajo.getOferta())
        );
        textOfertaActual1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                textOfertaActual1ActionPerformed(evt);
            }
        });
        clientePanel.add(textOfertaActual1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 30, 180, 60));

        getContentPane().add(clientePanel, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 10, 180, 120));

        pujadorPanel.setBackground(new java.awt.Color(0, 0, 255));
        pujadorPanel.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        buttonPujar.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        buttonPujar.setText("PUJAR");
        buttonPujar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                buttonPujarActionPerformed(evt);
            }
        });
        pujadorPanel.add(buttonPujar, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 80, 170, 40));

        textPuja.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        textPuja.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                textPujaActionPerformed(evt);
            }
        });
        pujadorPanel.add(textPuja, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 50, 90, 30));

        textOfertaTecnico.setEditable(false);
        textOfertaTecnico.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        textOfertaTecnico.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        textOfertaTecnico.setText(Float.toString(trabajo.getOferta())
        );
        textOfertaTecnico.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                textOfertaTecnicoActionPerformed(evt);
            }
        });
        pujadorPanel.add(textOfertaTecnico, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 10, 130, 30));

        getContentPane().add(pujadorPanel, new org.netbeans.lib.awtextra.AbsoluteConstraints(370, 10, 170, 120));

        jTextField1.setEditable(false);
        jTextField1.setFont(new java.awt.Font("Tahoma", 0, 20)); // NOI18N
        jTextField1.setText("SOSEMADO PANEL DE CONTROL");
        jTextField1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField1ActionPerformed(evt);
            }
        });
        getContentPane().add(jTextField1, new org.netbeans.lib.awtextra.AbsoluteConstraints(120, 470, -1, -1));

        jChartPanel.setBackground(new java.awt.Color(204, 204, 255));

        javax.swing.GroupLayout jChartPanelLayout = new javax.swing.GroupLayout(jChartPanel);
        jChartPanel.setLayout(jChartPanelLayout);
        jChartPanelLayout.setHorizontalGroup(
            jChartPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 530, Short.MAX_VALUE)
        );
        jChartPanelLayout.setVerticalGroup(
            jChartPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 310, Short.MAX_VALUE)
        );

        getContentPane().add(jChartPanel, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 150, 530, 310));

        jCompositePanel.setBackground(new java.awt.Color(255, 153, 101));

        javax.swing.GroupLayout jCompositePanelLayout = new javax.swing.GroupLayout(jCompositePanel);
        jCompositePanel.setLayout(jCompositePanelLayout);
        jCompositePanelLayout.setHorizontalGroup(
            jCompositePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 220, Short.MAX_VALUE)
        );
        jCompositePanelLayout.setVerticalGroup(
            jCompositePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 460, Short.MAX_VALUE)
        );

        getContentPane().add(jCompositePanel, new org.netbeans.lib.awtextra.AbsoluteConstraints(560, 20, 220, 460));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void buttonPujarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_buttonPujarActionPerformed
        // TODO add your handling code here:
        System.out.println("Pujamos la siguiente cantidad: " + textPuja.getText());
        tecnicoPujador.pujar(Float.parseFloat(textPuja.getText().toString()));
        textPuja.setText("");
    }//GEN-LAST:event_buttonPujarActionPerformed

    private void textPujaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_textPujaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_textPujaActionPerformed

    private void textOfertaTecnicoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_textOfertaTecnicoActionPerformed
        // TODO add your handling code here:
        // Este campo tiene que ser no editable
    }//GEN-LAST:event_textOfertaTecnicoActionPerformed

    private void textOfertaActual1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_textOfertaActual1ActionPerformed
        // TODO add your handling code here:
        
    }//GEN-LAST:event_textOfertaActual1ActionPerformed

    private void textOfertaClienteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_textOfertaClienteActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_textOfertaClienteActionPerformed

    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField1ActionPerformed

    private void actualizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_actualizarActionPerformed
        // TODO add your handling code here:
         textOfertaCliente.setText("" + cliente.pull());
    }//GEN-LAST:event_actualizarActionPerformed

    private void convertirActionPerformed(java.awt.event.ActionEvent evt) {                                           
        // TODO add your handling code here:
        System.out.println("Haciendo conversión");
        final float factorConversionEurosPeseta = 166.386f;
        
//        ((JTextField)componente.getHijos().get(0).getElementos().get(1)).setText("");

        JTextField euros = (JTextField)componente.getHijos().get(0).getElementos().get(1);
        JTextField pesetas = (JTextField)componente.getHijos().get(0).getElementos().get(2);
        
//        if (euroAPeseta || !euros.getText().equals("")){
//            float eurosFloat = Float.parseFloat(euros.getText());
//            pesetas.setText("" + eurosFloat*factorConversionEurosPeseta);
//        } else if (!euroAPeseta){
//            
//        }

        if (!euros.getText().equals("")){
            float eurosFloat = Float.parseFloat(euros.getText());
            pesetas.setText("" + eurosFloat*factorConversionEurosPeseta);
            euros.setText("");
            
        } else if (!pesetas.getText().equals("")){
            float pesetasFloat = Float.parseFloat(pesetas.getText());
            euros.setText("" + pesetasFloat/factorConversionEurosPeseta);
            pesetas.setText("");
        }
    }   
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(SosemadoFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(SosemadoFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(SosemadoFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(SosemadoFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new SosemadoFrame().setVisible(true);
                System.out.println("Corriendo");
            }
            
        });
       
        
        
//        
//                /* Create and display the form */
//        java.awt.EventQueue.invokeLater(new Runnable() {
//            public void run() {
//                new SosemadoFrame().setVisible(true);
//                System.out.println("Corriendo");
//                
//            }
//        });
    }

//    private JPanel tecnicoPanel;
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton actualizar;
    private javax.swing.JButton buttonPujar;
    private javax.swing.JPanel clientePanel;
    private javax.swing.JPanel jChartPanel;
    private javax.swing.JPanel jCompositePanel;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JPanel pujadorPanel;
    private javax.swing.JPanel tenicoPanel;
    private javax.swing.JTextField textOfertaActual1;
    private javax.swing.JTextField textOfertaCliente;
    private javax.swing.JTextField textOfertaTecnico;
    private javax.swing.JTextField textPuja;
    // End of variables declaration//GEN-END:variables
    
    private Trabajo trabajo = new Trabajo(1000);
    private Tecnico tecnico = new Tecnico();
    private TecnicoPujador tecnicoPujador = new TecnicoPujador(trabajo);
    private Cliente cliente = new Cliente(trabajo);  
    ArrayList<Float> evolucionOfertas = new ArrayList<Float>();
    CompositeJPanel componente = new CompositeJPanel();
    
    public float getOfertaActual(){
        return trabajo.getOferta();
    }
    
    public TecnicoPujador getTecnicoPujador() {
        return tecnicoPujador;
    }
    
    private XYDataset createDataset() {
      final XYSeries ofertas = new XYSeries( "Ofertas" );          
      for (int i = 0 ; i < evolucionOfertas.size() ; i++){
          ofertas.add(i, evolucionOfertas.get(i));
      }      
               
      
      final XYSeriesCollection dataset = new XYSeriesCollection( );          
      dataset.addSeries( ofertas );          
      return dataset;
   }

    
    private JFreeChart createChart() {
     JFreeChart xylineChart = ChartFactory.createXYLineChart(
         "Evolución del precio" ,
         "" ,
         "Precio" ,
         createDataset() ,
         PlotOrientation.VERTICAL ,
         true , true , false);
         
      return xylineChart;
   }

    @Override
    public void update(Observable o, Object o1) {
        float ofertaActual = ((Trabajo)o1).getOferta(); 
        evolucionOfertas.add(ofertaActual);
        jChartPanel.removeAll();
        jChartPanel.add(new ChartPanel(createChart()),BorderLayout.CENTER);
        textOfertaActual1.setText(Float.toString(ofertaActual));
        textOfertaTecnico.setText(Float.toString(ofertaActual));
        
        final float factorConversionEurosPeseta = 166.386f;
        JTextField euros = (JTextField)componente.getHijos().get(0).getElementos().get(1);
        JTextField pesetas = (JTextField)componente.getHijos().get(0).getElementos().get(2);
        
        pesetas.setText(""+ ofertaActual*factorConversionEurosPeseta);
        euros.setText("" + ofertaActual);       
        
        this.repaint();
        this.revalidate();
    }    

    @Override
    public void run() {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        System.out.println("Soy sosemado");
    }
}
