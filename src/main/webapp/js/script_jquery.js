/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

  $( document ).ready(function() {
   
  $('.date').mask('99/99/9999 00:00:00');
  $('.campoCep').mask('99999-999');
  $('.campoTelefone').mask('(99)99999-9999');
  $('.campoSenha').mask('xxxxxxxxxxxxxxxxxxxxx' , {translation: {'x': {pattern: /[a-zA-Z0-9\@\#\-\_\*\s]/}}}); 
  $('.campoNome').mask('xxxxxxxxxxxxxxxxxxxxxx' , {translation: {'x': {pattern: /[a-zA-Zà-úÀ-Ú\s]/}}});
  $('.campoComentarios').mask('xxxxxxxxxxxxxxxxxxxxxx' , {translation: {'x': {pattern: /[a-zA-Z0-9à-úÀ-Ú\s]/}}});
  $('.campoIdade').mask('99');
  ('.campoNomeEmail').mask('xxxxxxxxxxxxxxxxxxxxxxxx' , {translation: {'x': {pattern: /[a-zA-Z0-9\@\-\_\s]/}}}); 
  
  
});

