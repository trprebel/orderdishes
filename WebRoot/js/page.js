function goPage(pageNum) {
          
              var f=   document.forms[0];
              document.getElementById("paginator.currentPage").value=pageNum;
              var regex = /^[0-9]{1,}$/;
				if (!regex.test(pageNum)) {
					alert("璺宠浆椤靛彧鑳界敱鏁板瓧缁勬垚锛侊紒");
					document.getElementById("intputCurrentPage").value='1';
					return false;
				}
			   f.submit();
	}
	
	
	function ajaxSbmitTarget(newAction){
		 var options = {
		        target:    "#listpage",
		        data:       "", 
			    type:       'post',
			    success: successMethod
			     };
			 var formId =document.forms[0].id;
			 document.forms[0].action=newAction;
			 var submitObj ='#'+formId;
			  $(submitObj).ajaxSubmit(options);
	 }		
		function ajaxGoPage(currNum){
		 var options = {
		        target:    "#listpage",
		        data:       "", 
			    type:       'post',
			    success: successMethod
			     };
			    document.getElementById("paginator.currentPage").value=currNum;
			 var formId =document.forms[0].id;
			 var submitObj ='#'+formId;
			  $(submitObj).ajaxSubmit(options);
	 }		   
			   
	function successMethod(msg){
			 document.getElementById("showpage").innerHTML=document.getElementById("jscode").value;
     }     			   
	//楠岃瘉checkBox鏄惁阃夋嫨
   function checkBoxIsChecked(checkName){
    var c=  document.getElementsByName(checkName);
    var k=0;
    for(var i=0;i<c.length;i++){
      if(c[i].checked){
        k++;
         break;
         }
    }
    if(k>0){
      return true;
      }
      else{
        alert("镊冲皯阃夋嫨涓€涓啀杩涜鎻愪氦!");
        return false;
      }
   }			   