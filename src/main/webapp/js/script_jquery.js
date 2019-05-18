/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
  $('.date').mask('11/11/1111');
  $('.time').mask('00:00:00');
  $('telefone').mask('99/99/9999 00:00:00');
  $('.cep').mask('99999-999');
  $('.phone').mask('9999-9999');
  $('#telefone').mask('(99)99999-9999');
  $('.phone_us').mask('(999) 999-9999');
  $('.mixed').mask('AAA 000-S0S');
  $('#name').mask('xxxxxxxxxxxxxxxxxxxxxx' , {translation: {'x': {pattern: /[a-zA-Z0-9à-úÀ-Ú\s]/}}});
  $('#cadastroSenha').mask('xxxxxxxxxxxxxxxxxxxxxx' , {translation: {'x': {pattern: /[a-zA-Z0-9\@\#\-\_\*\s]/}}});
  $('#confirmaSenha').mask('xxxxxxxxxxxxxxxxxxxxxx' , {translation: {'x': {pattern: /[a-zA-Z0-9\@\#\-\_\*\s]/}}});
  $('#senha').mask('xxxxxxxxxxxxxxxxxxxxxx' , {translation: {'x': {pattern: /[a-zA-Z0-9\@\#\-\_\*\s]/}}});});

