package modelo;
public class Funcionario extends Pessoa{
    private int id_funcionario;
    private String endereco;
    private String login;
    private String senha;
    private int id_perfil;
    private Perfil Perfil;

    public int getId_funcionario() {
        return id_funcionario;
    }

    public void setId_funcionario(int id_funcionario) {
        this.id_funcionario = id_funcionario;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getId_perfil() {
        return id_perfil;
    }

    public void setId_perfil(int id_perfil) {
        this.id_perfil = id_perfil;
    }

    public Perfil getPerfil() {
        return Perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.Perfil = perfil;
    }
}