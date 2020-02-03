/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.udb.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sv.edu.udb.www.model.EditorialesModel;
import sv.edu.udb.www.entities.Editoriales;

/**
 *
 * @author Daniel Molina
 */
@Controller
@RequestMapping("editoriales")
public class EditorialesController {
    
    EditorialesModel editorialesModel = new EditorialesModel();
    
    @RequestMapping("list")
    public String listarEditoriales(Model model){
    model.addAttribute("listaEditoriales", editorialesModel.listarEditoriales());
    return "editoriales/listar";
    
    }
    
    
    // para ver el formulario para registrar nuevo
    @RequestMapping(value = "create", method = RequestMethod.GET)
   public String nuevoEditorial(Model model){
   model.addAttribute("editorial", new Editoriales());
   return "editoriales/nuevo";
   }
   
   //este metodo se ejecuta al enviar el formulario desde la vista
   @RequestMapping(value = "create", method = RequestMethod.POST)
   public String insertarEditorial(@ModelAttribute("editorial") Editoriales editorial, Model model,RedirectAttributes atributos){
       if (editorialesModel.insertarEditorial(editorial)>0) {
           atributos.addFlashAttribute("exito", "Editorial registrado con exito");
           return "redirect:/editorial/list";
           
       }
       else{
       model.addAttribute("editorial", editorial);
       return "editoriales/nuevo";
       
       
       }
   
   
   
   } 
    
    
    
}
