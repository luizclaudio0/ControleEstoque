package br.com.ifpe.estoque.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ifpe.estoque.model.CategoriaProduto;
import br.com.ifpe.estoque.model.CategoriaProdutoDao;

@Controller
public class CategoriaProdutoController {

	@RequestMapping("/categoriaProduto/add")
	public String adicionarCategoriaProduto() {
		return "categoriaProduto/incluirCategoriaProduto";
	}

	@RequestMapping("/categoriaProduto/save")
	public String saveCategoria(CategoriaProduto categoriaProduto, Model model) {

		CategoriaProdutoDao dao = new CategoriaProdutoDao();
		dao.salvar(categoriaProduto);
		model.addAttribute("mensagem", "Categoria Produto Inclu�do com Sucesso");
		return "categoriaProduto/incluirCategoriaProdutoSucesso";
	}

	@RequestMapping("/categoriaProduto/list")
	public String listarCategoriaProduto(CategoriaProduto categoriaProduto,Model model) {
		CategoriaProdutoDao dao = new CategoriaProdutoDao();
		List<CategoriaProduto> listarCategoriaProduto = dao.listarCategoria(categoriaProduto);
		model.addAttribute("listaCategoriaProduto", listarCategoriaProduto);
		return "categoriaProduto/listarCategoriaProduto";

	}



	@RequestMapping("/categoriaProduto/edit")
	public String editCategoria(@RequestParam("id") Integer id, Model model) {
		CategoriaProdutoDao dao = new CategoriaProdutoDao();
		CategoriaProduto categoriaProduto = dao.buscarPorId(id);
		model.addAttribute("Categoriaproduto", categoriaProduto);
		return "produto/alterarProduto";
	}

	@RequestMapping("/categoriaProduto/update")
	public String updateCategoria(CategoriaProduto categoriaProduto, Model model) {
		CategoriaProdutoDao dao = new CategoriaProdutoDao();
		dao.alterarCategoria(categoriaProduto);
		model.addAttribute("mensagem", "Categoria Produto Alterado com Sucesso !");
		return "forward:list";
	}

}
