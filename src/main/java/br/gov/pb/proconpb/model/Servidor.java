package br.gov.pb.proconpb.model;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Servidor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * Dados do Orgão
     */
    @NotEmpty
    private String orgao;
    @NotEmpty
    private String esfera;
    @NotEmpty
    private String municipio;
    @NotEmpty
    private String uf;

    /**
     * Dados do Servidor
     */
    @NotEmpty
    private String nome;

    private String cpf;
    @NotEmpty
    private String matricula;

    /**
     * Dados do Cargo
     */
    @NotEmpty
    private String regime;
    @NotEmpty
    private String cargo;
    @NotEmpty
    private String naturezaCargo;
    @NotNull
    @Temporal(TemporalType.DATE)
    private Calendar dataExercicio;
    @Temporal(TemporalType.DATE)
    private Calendar dataAposentadoria;
    @Temporal(TemporalType.DATE)
    private Calendar dataExclusao;

    private String jornada;
    @NotEmpty
    private String categoriaSituacao;
    private String nomePensionista;
    private String cpfPensionista;

    /**
     * Dados da Remuneração
     */
    @NotNull
    private String mesAnoFolha;
    @NotNull
    private BigDecimal valorBruto;
    @NotNull
    private BigDecimal valorTeto;
    private BigDecimal valorAbateTeto;

    public Integer getId() {
	return id;
    }

    public void setId(Integer id) {
	this.id = id;
    }

    public String getOrgao() {
	return orgao;
    }

    public void setOrgao(String orgao) {
	this.orgao = orgao;
    }

    public String getEsfera() {
	return esfera;
    }

    public void setEsfera(String esfera) {
	this.esfera = esfera;
    }

    public String getMunicipio() {
	return municipio;
    }

    public void setMunicipio(String municipio) {
	this.municipio = municipio;
    }

    public String getUf() {
	return uf;
    }

    public void setUf(String uf) {
	this.uf = uf;
    }

    public String getNome() {
	return nome;
    }

    public void setNome(String nome) {
	this.nome = nome;
    }

    public String getCpf() {
	return cpf;
    }

    public void setCpf(String cpf) {
	this.cpf = cpf;
    }

    public String getMatricula() {
	return matricula;
    }

    public void setMatricula(String matricula) {
	this.matricula = matricula;
    }

    public String getRegime() {
	return regime;
    }

    public void setRegime(String regime) {
	this.regime = regime;
    }

    public String getCargo() {
	return cargo;
    }

    public void setCargo(String cargo) {
	this.cargo = cargo;
    }

    public String getNaturezaCargo() {
	return naturezaCargo;
    }

    public void setNaturezaCargo(String naturezaCargo) {
	this.naturezaCargo = naturezaCargo;
    }

    public Calendar getDataExercicio() {
	return dataExercicio;
    }

    public void setDataExercicio(Calendar dataExercicio) {
	this.dataExercicio = dataExercicio;
    }

    public Calendar getDataAposentadoria() {
	return dataAposentadoria;
    }

    public void setDataAposentadoria(Calendar dataAposentadoria) {
	this.dataAposentadoria = dataAposentadoria;
    }

    public Calendar getDataExclusao() {
	return dataExclusao;
    }

    public void setDataExclusao(Calendar dataExclusao) {
	this.dataExclusao = dataExclusao;
    }

    public String getJornada() {
	return jornada;
    }

    public void setJornada(String jornada) {
	this.jornada = jornada;
    }

    public String getCategoriaSituacao() {
	return categoriaSituacao;
    }

    public void setCategoriaSituacao(String categoriaSituacao) {
	this.categoriaSituacao = categoriaSituacao;
    }

    public String getNomePensionista() {
	return nomePensionista;
    }

    public void setNomePensionista(String nomePensionista) {
	this.nomePensionista = nomePensionista;
    }

    public String getCpfPensionista() {
	return cpfPensionista;
    }

    public void setCpfPensionista(String cpfPensionista) {
	this.cpfPensionista = cpfPensionista;
    }

    public String getMesAnoFolha() {
	return mesAnoFolha;
    }

    public void setMesAnoFolha(String mesAnoFolha) {
	this.mesAnoFolha = mesAnoFolha;
    }

    public BigDecimal getValorBruto() {
	return valorBruto;
    }

    public void setValorBruto(BigDecimal valorBruto) {
	this.valorBruto = valorBruto;
    }

    public BigDecimal getValorTeto() {
	return valorTeto;
    }

    public void setValorTeto(BigDecimal valorTeto) {
	this.valorTeto = valorTeto;
    }

    public BigDecimal getValorAbateTeto() {
	return valorAbateTeto;
    }

    public void setValorAbateTeto(BigDecimal valorAbateTeto) {
	this.valorAbateTeto = valorAbateTeto;
    }

    public String getDataExercicioFormatada() {
    SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
	return formato.format(getDataExercicio());
    }
}
