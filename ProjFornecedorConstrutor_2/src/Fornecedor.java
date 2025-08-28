        
import javax.swing.JOptionPane;

public class Fornecedor {
    public String cnpj;
    public String nome;
    public String cidade;
    public String estado;
    
    public Fornecedor(String cnpj,String nm, String cid, String est){
      this.cnpj = cnpj;
      this.nome = nm;
      this.cidade = cid;
      this.estado = est;
     }
            
        public void Exibir(){
        JOptionPane.showMessageDialog(null,
                "CNPJ do fornecedor: "+this.cnpj+
                "\nNome do fornecedor: "+this.nome+
                "\nCidade do fornecedor: "+this.cidade +
                "\nEstado do fornecedor: "+this.estado);
        
    }
    
}
