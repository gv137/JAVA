
import javax.swing.JOptionPane;

public class ContaCorrente {
  
    public String nome;
    private int numconta;
    private String banco;
    private int agencia;
    private double saldo;
    
    public void Depositar(double valor){
        this.saldo=this.saldo+valor;
        JOptionPane.showMessageDialog(null, "Deposito realizado com sucesso!");
    }
    
    public void Sacar(double valor) {
        if (valor <= saldo) {
        this.saldo=this.saldo-valor;
         JOptionPane.showMessageDialog(null, "Saque realizado com sucesso!");
    } else {
            JOptionPane.showMessageDialog(null, "Saldo insuficiente!");
        }
    }
    
    public double ConsultaSaldo(){
        return this.saldo;
    }
    //ENCAPSULANDO numcon
    public int getNumconta(){
        return this.numconta;
    }
    
    public void setNumconta(int num){
        this.numconta=num;
    }
    //ENCAPSULANDO banco
    public String getBanco(){
        return this.banco;
    }
    
    public void setBanco(String nome){
        this.banco=nome;
    }
    //ENCAPSULANDO agencia
    public int getAgencia(){
        return this.agencia;
    }
    
    public void setAgencia(int numAgencia){
        this.agencia=numAgencia;
    }
    
    
}
