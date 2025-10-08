import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class ControleALuno {
    
    Aluno aluno = new Aluno();
    
    Connection conexao;
    PreparedStatement sql;
    Statement executar;
    ResultSet lista;
    public void Conectar(){
      try{
       String usuario="root";
       String senha="";
       String servidor = "localhost:3306";
       String banco="bdnotasaluno";
       String driver = "com.mysql.cj.jdbc.Driver";
       Class.forName(driver);
       String url = "jdbc:mysql://" + servidor + "/" + banco+"?useTimezone=true&serverTimezone=UTC"; // a JDBC url
       conexao = DriverManager.getConnection(url,usuario,senha);
       executar= conexao.createStatement();
      }
      catch (ClassNotFoundException e){
          System.out.println("Driver não encontrado");   
      }
      catch (Exception e){
          System.out.println("Erro ao conectar Banco");
      }
    
}
    public void Cadastrar(int rgm,String nm,double n1,double n2){
        aluno.setRgm(rgm);
        aluno.setNome(nm);
        aluno.setNota1(n1);
        aluno.setNota2(n2);
      try{
        sql=conexao.prepareStatement("Insert into alunos (rgm,nome,nota1,nota2) values (?,?,?,?)");
        sql.setInt(1, aluno.getRgm());
        sql.setString(2, aluno.getNome());
        sql.setDouble(3, aluno.getNota1());
        sql.setDouble(4, aluno.getNota2());
        int retorno=sql.executeUpdate();
        if (retorno>0){
            JOptionPane.showMessageDialog(null," Dados Cadastrados com sucesso !!!");
        }
        else{
            JOptionPane.showMessageDialog(null," Registro não cadastrado !!!");
        }
      }
      catch (Exception e){
          System.out.println("Problemas no bd !!!");
      }
    }
    public void Listar(){
        try{
            sql = conexao.prepareStatement("select * from alunos");
            lista = sql.executeQuery();
            while(lista.next()){
                System.out.println("Rgm: "+lista.getString("rgm"));
                System.out.println("Nome: "+lista.getString("nome"));
                System.out.println("Nota 1: "+lista.getString("nota1"));
                System.out.println("Nota 2: "+lista.getString("nota2"));
                System.out.println("");
            }
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null," Problemas no bd !!!");
        }
    }
    
    public String Consultar(int rgm){
        String dados="";
        try{
            sql=conexao.prepareStatement("select * from alunos where rgm ="+rgm);
            lista=sql.executeQuery();
            if (lista.next()){
                dados=lista.getString("rgm")+";"+lista.getString("nome")+
                        ";"+lista.getString("nota1")+";"+lista.getString("nota2");
            }
            else{
                JOptionPane.showMessageDialog(null," Registro não encontrado !!");
            }
            
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null," Problemas no bd !!!"); 
        }
        return dados;
    } 
        public double CalcularMedia(double n1, double n2){
         double media = (n1+n2)/2;
         return media;           
         }
        
        public void Excluir(int rgm){
            try{
                sql = conexao.prepareStatement("delete from alunos where rgm ="+rgm);
                int verifica = sql.executeUpdate();
                if(verifica == 1){
                    JOptionPane.showMessageDialog(null, "registo excuído com sucesso !!!");
                }
                else{
                 JOptionPane.showMessageDialog(null, "registo não encontrado !!!");  
                }
            }
            catch(Exception e){
              JOptionPane.showMessageDialog(null," Problemas no bd !!!");
            }
        }
    }


