<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)
.ready(function(){
	loadInfo()
	loadData()
	viewType()
})
.on('click','#btnmain',function(){
	document.location="/"
})
.on('click','#btnbook',function(){
	document.location="/book"
})
.on('click','#btnShow',function(){
	showType()
})
.on('click','#rNSel option:selected',function(){
	$('#infoSeq').val($(this).val())
	$.ajax({
		url:'/viewInfo',
		data:{i_num:$(this).val()},
		type:'post',
		dataType:'json',
		success:function(data){
		    $('#rNum').val(data[0])
		    $('#rName').val(data[1])
		    $('#rTSel option').each(function(){
		        if($(this).text()==data[2]){
		            $(this).prop('selected',true)
		            return false
		        }
		    })
		    $('#rToNum').val(data[3])
		    $('#rPrice').val(data[4])
		}
	})
})
.on('click','#tSelect',function(){
    str=$('#tSelect option:selected').text()
    ar=str.split(', ')
    $('#rT').val(ar[1])
    $('#rTN').val(ar[2])
    $('#s_num').val(ar[0])
})
.on('click','#btnadd',function(){
	if($('#s_num').val()==''){	
	$.ajax({
		url:'/insertData',
		data:{num:$('#rT').val(),name:$('#rTN').val()},
		dataType:'text',
		type:'post',
		success:function(data){
			if(data=='ok'){
				loadData();
				$('#btnempty').trigger('click')
			}else{
				alert('insert오류')
			}
		}})
	}else{
		$.ajax({
			url:'/updateType',
			data:{t_num:$('#rT').val(),t_name:$('#rTN').val(),t_seq:$('#s_num').val()},
			type:'post',
			dataType:'text',
			success:function(data){
				if(data=='ok'){
					loadData();
					$('#btnempty').trigger('click')
				}else{
					alert('update오류')
				}
			}})	
		}		
})
.on('click','#btndel',function(){
	$.ajax({
		url:'/deleteType',
		data:{t_seq:$('#s_num').val()},
		type:'post',
		dataType:'text',
		success:function(data){
			if(data=='ok'){
				loadData();
				$('#btnempty').trigger('click')
			}else{
				alert('delete오류')
			}
		}})
})
.on('click','#btnempty',function(){
	$('#rT').val('1')
    $('#rTN').val('')
})
.on('click','#add',function(){
	if($('#infoSeq').val()==''){
	$.ajax({
		url:'/insertInfo',
		data:{i_num:$('#rNum').val(),i_name:$('#rName').val(),t_num:$('#rTSel option:selected').val(),
			  i_per:$('#rToNum').val(),i_pri:$('#rPrice').val()},
		type:'post',
		dataType:'text',
		success:function(data){
			if(data=="ok"){
				loadInfo();
				$('#emp').trigger('click')
			}else{
				alert('insert오류')
			}
		}})
	}else{
		$.ajax({
			url:'/updateInfo',
			data:{i_num:$('#rNum').val(),i_name:$('#rName').val(),t_num:$('#rTSel option:selected').val(),
				  i_per:$('#rToNum').val(),i_pri:$('#rPrice').val(),i_seq:$('#infoSeq').val()},
			type:'post',
			dataType:'text',
			success:function(data){
				if(data=="ok"){
					loadInfo();
					$('#emp').trigger('click')
				}else{
					alert('update오류')
				}
			}})
	}
})
.on('click','#del',function(){
	$.ajax({
		url:'/deleteInfo',
		data:{i_seq:$('#rNSel option:selected').val()},
		type:'post',
		dataType:'text',
		success:function(data){
			if(data=='ok'){
				loadData();
				$('#btnempty').trigger('click')
			}else{
				alert('delete오류')
			}
		}})
})
.on('click','#emp',function(){
	$('#rNum').val('1')
	$('#rName').val('')
	$('#rToNum').val('1')
	$('#rPrice').val('')
})
function loadInfo(){
	$.ajax({
		url:'/loadInfo',
		data:{},
		type:'post',
		dataType:'json',
		success:function(data){
			$('#rNSel').empty()
			for(let i=0; i<data.length; i++){
				let str=""
				str+='<option value='+data[i]['seq']+'>'+data[i]['i_num']+', '+data[i]['i_name']+', '+data[i]['t_name']+', '
							  +data[i]['person']+'명, '+data[i]['price']+'원'+'</option>'
				$('#rNSel').append(str)
				console.log($('#rNSel option').val())
			}
		}})
}
function loadData(){
	$.ajax({
		url:'/loadData',
		data:{},
		type:'post',
		dataType:'json',
		success:function(data){
			$('#tSelect').empty()
			for(let i=0; i<data.length; i++){
				let str=""
				str+='<option>'+data[i]['seq']+', '+data[i]['num']+', '+data[i]['name']+'</option>'
				$('#tSelect').append(str)
			}
		}})
}
function showType(){
    $('#typeDig').dialog({
        title:'객실타입관리',
        modal:true,
        width:680,
        beforeClose:function(){
          viewType()
        }
    })
}
function viewType(){
	$.ajax({
		url:'/viewType',
		data:{},
		type:'post',
		dataType:'json',
		success:function(data){
			$('#rTSel').empty()
			for(let i=0; i<data.length; i++){
				$('#rTSel').append('<option value='+data[i]['num']+'>'+data[i]['name']+'</option>')
			}
		}})
}
</script>
</html>