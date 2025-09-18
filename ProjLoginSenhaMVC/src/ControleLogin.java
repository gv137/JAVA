
import javax.swing.JOptionPane;


public class ControleLogin {
    Usuario usuario = new Usuario();
    
    public void Logar(String log, int senha){
       usuario.login=log;
       usuario.senha=senha;
       boolean status=usuario.Validar();
       if (status==true){
           new FormSistema().setVisible(true);
           
       }
       else{
           JOptionPane.showMessageDialog(null,"Usuário/Senha Incorretos !!!");
           new FormLogin().setVisible(true);
           
       }
}
    
}
