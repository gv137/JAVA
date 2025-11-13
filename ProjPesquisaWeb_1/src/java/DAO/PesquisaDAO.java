
package DAO;
import model.PesquisaBean;
import util.ConectaBD;
import java.sql.*;

public class PesquisaDAO {
    
    Statement executar;
    PreparedStatement sql;
    Connection conexao;
    ResultSet lista;
    
    public boolean InserirDAO(PesquisaBean p) throws ClassNotFoundException, SQLException{
      try{  
        conexao=ConectaBD.conectar();
        sql=conexao.prepareStatement("Insert into pesquisa (nome,email,p1,p2,p3,p4) values (?,?,?,?,?,?)");
        sql.setString(1, p.getNome());
        sql.setString(2, p.getEmail());
        sql.setInt(3,p.getR1());
        sql.setInt(4,p.getR2());
        sql.setInt(5, p.getR3());
        sql.setInt(6,p.getR4());
        sql.executeUpdate();
        return true;
      }
      catch (SQLException e){
          System.out.println("Erro: "+e);
          return false;
      }
    }
    
   
    
}
