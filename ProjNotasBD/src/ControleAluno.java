import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class ControleAluno {
    
    Aluno aluno = new Aluno();
    
    Connection conexao;
    PreparedStatement sql;
    Statement executar;
    ResultSet lista;
    
    public void Conectar (){
    
    try{    
    String usuario = "root";
    String senha = "";
    String servidor = "localhost:3306";
    String banco = "bdnotasaluno";
    String driver = "com.mysql.cj.jdbc.Driver";
    Class.forName(driver);
    String url = "jdbc:mysql://" + servidor + "/" + banco+"?useTimezone=true&serverTimeZone=UTC";
    conexao = DriverManager.getConnection(url, usuario, senha);
    executar = conexao.createStatement();
    }
    catch(ClassNotFoundException e){
        JOptionPane.showMessageDialog(null, "Driver não encontrado!!!");
    }
    catch(Exception e){
        JOptionPane.showMessageDialog(null, "Problemas no banco de dados!!!");
    }
    
    }
    
}
