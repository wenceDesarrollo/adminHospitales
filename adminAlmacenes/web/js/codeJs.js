// JavaScript Document
// Function for check empty fields in the form for the Comments
function verificaCom(obj) 
{
//alert("huge");
 missinginfo = "";
    if (obj.txtf_nom.value=="")
    {
		missinginfo += "\n El campo NOMBRE no debe de estar VAC"+'\u00cd'+"O";
    }
	
	if (obj.txtf_cor.value=="")
    {
		missinginfo += "\n El campo CORREO ELECTR"+'\u00d3'+"NICO no debe de estar VAC"+'\u00cd'+"O";
    }
	if (obj.txta_com.value=="")
    {
		missinginfo += "\n El campo COMENTARIOS no debe de estar VAC"+'\u00cd'+"O";
    }

	if (missinginfo != "")
	{
	missinginfo = "\n TE HA FALTADO INTRODUCIR LOS SIGUIENTES DATOS PARA GUARDAR TUS DATOS:\n" + missinginfo + "\n\n INGRESA LOS DATOS FALTANTES Y TRATA OTRA VEZ\n";
		alert(missinginfo);
		return false;
	}else{
		//var reg1=myFunction_pac(obj);
	     return true;
	     }
	
	
}
// end of function
// -------------------------------------------------------------------------------------------------------------
// Function for check the Email
function validarEmail(valor)
 {
	//alert("huges"+valor);
	if (/^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/.test(valor)){ 
			return (true);
 		}
 	else{
 		alert("DIRECCION DE CORREO INVALIDA, FAVOR DE INTRODUCIR UN CORREO VALIDO");
 		document.forms.form_com.txtf_cor.focus();
  	}
 }
// end of function