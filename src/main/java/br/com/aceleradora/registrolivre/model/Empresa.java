package br.com.aceleradora.registrolivre.model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;

import br.com.aceleradora.registrolivre.dao.Entidade;

@Entity
@SequenceGenerator(initialValue = 1, allocationSize = 1, name = "geradorId", sequenceName = "empresa_sequence")
public class Empresa extends Entidade {
	@Column(nullable = false)
	private String cnpj;
	private String razaoSocial;
	@Column(nullable = false)
	private String nomeFantasia;
	private Calendar dataCriacao;
	private Calendar dataEmissaoDocumento;
	private Calendar dataRegistro;
	private String url;
	@Embedded
	private Endereco endereco;
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "empresa_socios", joinColumns = { @JoinColumn(name = "empresa_id") }, inverseJoinColumns = { @JoinColumn(name = "socio_id") })
	private List<Socio> socios;

	public Empresa() {
		socios = new ArrayList<Socio>();
		setDataRegistro(Calendar.getInstance());
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

	public String getNomeFantasia() {
		return nomeFantasia;
	}

	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}

	public Calendar getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Calendar dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public Calendar getDataEmissaoDocumento() {
		return dataEmissaoDocumento;
	}

	public void setDataEmissaoDocumento(Calendar dataEmissaoDocumento) {
		this.dataEmissaoDocumento = dataEmissaoDocumento;
	}

	public Calendar getDataRegistro() {
		return dataRegistro;
	}

	public void setDataRegistro(Calendar dataRegistro) {
		this.dataRegistro = dataRegistro;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public List<Socio> getSocios() {
		return socios;
	}

	public void setSocios(List<Socio> socios) {
		this.socios = socios;
	}

	public void retiraPontosTracosBarrasCnpjECpf() {
		String cnpjSemPontoTraco = retiraPontosTracos(this.cnpj);
		this.cnpj = cnpjSemPontoTraco;
		String cpfSemPontoTraco = "";

		if (socios != null) {
			for (Socio socio : socios) {
				cpfSemPontoTraco = retiraPontosTracos(socio.getCpf());
				socio.setCpf(cpfSemPontoTraco);
			}
		}
	}

	public String retiraPontosTracos(String stringComPontoTraco) {
		String stringSemPontoTraco = stringComPontoTraco
				.replaceAll("[/.-]", "");

		return stringSemPontoTraco;
	}
}
