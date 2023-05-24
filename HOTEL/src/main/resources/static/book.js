let Dateprice = 0
let people = 0
$(document)
.ready(function(){
	let currentDate = new Date()
	$('#chIn').prop('min', currentDate.toISOString().slice(0,10));
	$('#chOut').prop('min', currentDate.toISOString().slice(0,10));
	loadData()
	loadbook()
})
.on('click','#btnmain',function(){
	document.location="/"
})
.on('click','#btnbook',function(){
	document.location="/book"
})
.on('change','#chIn',function(){
	var checkin = new Date($(this).val())
	var currentDateTime = new Date($(this).val())
	var checkout = new Date($('#chOut').val())
	currentDateTime.setDate(currentDateTime.getDate()+1)
	var outputFormat = currentDateTime.toISOString()
	$('#chOut').prop('min',outputFormat.slice(0,10))
	if (checkin >= checkout){
		$('#chOut').val('')
	}
	$('#checkin').val($(this).val())
})
.on('change','#chOut',function(){
	var checkin=new Date($(this).val())
	var currentDateTime = new Date($(this).val())
	currentDateTime.setDate(currentDateTime.getDate()-1)
	var outputFormat = currentDateTime.toISOString();
	var checkout = new Date($(this).val())
	$('#chIn').prop('max',outputFormat.slice(0,10))
	if(checkin >= checkout){
		$('#time').val('')
	}
	$('#checkout').val($(this).val())
	let Date1 = new Date($('#chIn').val())
	let Date2 = new Date($(this).val())
	let difftime = Math.abs(Date2-Date1)
	Dateprice = Math.ceil(difftime/(1000*60*60*24))
	console.log(Dateprice)
})
.on('click','#infosel option:selected',function(){
	console.log($(this).val())
	let str=$(this).text()
	console.log(str)
	ar=str.split(', ')
	people = ar[3].replace('명','')
	$('#r_num').val(ar[0])
	$('#r_name').val(ar[1])
	let price = ar[4].replace('원','')
	let t_price = price*Dateprice	
	$('#price').val(t_price)
	$('#hidden').val($(this).val())
})
.on('change','#stay',function(){
	console.log(people)
	$('#stay').prop('max',people)
	$('#stay').prop('min',0)
})
.on('click','#btnadd',function(){
	let checkin=$('#checkin').val().replaceAll('-','/')
	let checkout=$('#checkout').val().replaceAll('-','/')
	if($('#hidden2').val()==''){
	$.ajax({
		url:'/bookInsert',
		data:{chin:checkin,chout:checkout,r_num:$('#hidden').val(),stay:$('#stay').val(),
				guest:$('#g_name').val(), mobi:$('#g_mobile').val(),t_fee:$('#price').val()},
		type:'post',
		dataType:'text',
		success:function(data){
			if(data=='ok'){
				loadbook()
				$('#btnempty').trigger('click')
			}else{
				alert('insert오류')
			}
		}})
	}else{
	$.ajax({
		url:'/bookUpdate',
		data:{chin:checkin,chout:checkout,r_num:$('#hidden').val(),stay:$('#stay').val(),
				guest:$('#g_name').val(), mobi:$('#g_mobile').val(),t_fee:$('#price').val(),
				seq:$('#hidden2').val()},
		type:'post',
		dataType:'text',
		success:function(data){
			if(data=='ok'){
				loadbook()
				$('#btnempty').trigger('click')
			}else{
				alert('update오류')
			}
		}})
	}
})
.on('click','#btnempty',function(){
	$('#checkin').val('')
	$('#checkout').val('')
	$('#r_num').val('')
	$('#hidden').val('')
	$('#hidden2').val('')
	$('#r_name').val('')
	$('#stay').val('1')
	$('#g_name').val('')
	$('#g_mobile').val('')
	$('#price').val('0')
})
.on('click','#btndelete',function(){
	$.ajax({
		url:'/bookDelete',
		data:{seq:$('#hidden2').val()},
		type:'post',
		dataType:'text',
		success:function(data){
			if(data=="ok"){
				loadbook()
				$('#btnempty').trigger('click')
			}else{
				alert('delete오류')
			}
		}
	})
})
.on('click','#booksel option:selected',function(){
	console.log($(this).val())
	let ar=$(this).val().split('/')
	let ar2=$(this).text().split(', ')
	$('#checkin').val(ar2[0])
	$('#checkout').val(ar2[1])
	$('#r_num').val(ar[1])
	$('#hidden2').val(ar[0])
	$('#r_name').val(ar2[6])
	$('#stay').val(ar2[4])
	$('#g_name').val(ar2[2])
	$('#g_mobile').val(ar2[3])
	$('#price').val(ar2[5])
})
function loadbook(){
	$.ajax({
		url:'/bookList',
		data:{},
		type:'post',
		dataType:'json',
		success:function(data){
			$('#booksel').empty()
			for(let i=0; i<data.length; i++){
				let str=""
				str+='<option value='+data[i]['seq']+'/'+data[i]['i_num']+'>'+data[i]['in']+', '+data[i]['out']+', '+data[i]['booker']+', '+data[i]['mobi']+
						', '+data[i]['people']+', '+data[i]['fee']+', '+data[i]['i_name']+', '+data[i]['t_name']+'</option>'
				$('#booksel').append(str)
				
			}
		}
	})
}
function loadData(){
	$.ajax({
		url:'/forBook',
		data:{},
		type:'post',
		dataType:'json',
		success:function(data){
			$('#infosel').empty()
			$('#typesel').empty()
			for(let i=0; i<data.length; i++){
				let I_str=""
				let T_str=""
				let R_hidden=data[i]['seq']
				I_str+='<option value='+data[i]['seq']+'>'+data[i]['i_num']+', '+data[i]['i_name']+', '+data[i]['t_name']+', '
							  +data[i]['person']+'명, '+data[i]['price']+'원'+'</option>'
				T_str+='<option value='+data[i]['seq']+'>'+data[i]['t_name']+'</option>'
				$('#hidden').val(R_hidden)
				$('#typesel').append(T_str)
				$('#infosel').append(I_str)
			}
		}})
}