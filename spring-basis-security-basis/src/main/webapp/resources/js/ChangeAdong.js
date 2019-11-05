$(document).ready(function(){
	$("#input").change(function(){
		show_adong();
	});
});

function show_adong()
{
	var a = document.getElementById("input").value;
	if(a==="여자")
	{
		var arr=['210','220','230','240','250'];
		var cdArr=['210','220','230','240','250'];
	}
	else if(a==="남자")
	{
		var arr=["250", "260", "270", "280"];
		var cdArr=['250','260','270','280'];
	}
	else if(a==="아이")
	{ 
		var arr=['130','140','150','160','170','180','190','200','210'];
		var cdArr=['130','140','150','160','170','180','190','200','210'];
	} 
	else if(a==="사이즈 선택")
	{
		var arr=["-------------------------------"]; 
		var cdArr=["null"];
	}
	
	var string=""; 
	var str="";
	
	for(i=0;i<arr.length;i++)
	{
		if(i==0)
		{ 
			string=string+"<option value = '"+cdArr[i]+"'>"+arr[i]+"</option>";
			str=str+"<option value = '"+cdArr[i]+"'>"+arr[i]+"</option>";
		}
		else
		{
			string=string+"<option value= '"+cdArr[i]+"'>"+arr[i]+"</option>";
			str=str+"<option value = '"+cdArr[i]+"'>"+arr[i]+"</option>";
		}
	}
	string="<select id ='out' name='size' onchange = 'selected_adong()'  style='margin-left: 45px;margin-bottom: 20px; margin-right: 10px; padding: 2.4px;'>"+string+"</select>";
	document.getElementById("output").innerHTML=string;   
	 
	str="<select id ='end_out' name='end_size' onchange = 'selected_adong()' style='margin-left: 10px;padding: 2.4px;'>"+str+"</select>";
	document.getElementById("end_output").innerHTML=string;   
	  
} 