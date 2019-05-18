/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validatePassword(){
var pass = document.getElementById('cadastroSenha').value;
var confirm_pass = document.getElementById('confirmaSenha').value;
      
if( pass != confirm_pass ){ 
   
document.getElementById('msgRegister').innerHTML = "Senhas diferentes, Confirme a senha!";
document.getElementById('confirmaSenha').value = "";
}
}


