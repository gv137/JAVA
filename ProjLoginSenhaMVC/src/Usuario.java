
public class Usuario {
    
    public String login;
    public int senha;
    
    public boolean Validar(){
        if ((this.login.equals("Edu")) && (this.senha==1234)){
            return true;
        }
        else{
            return false;
        }
    }
    
}
