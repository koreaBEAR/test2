<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="typeDig" style="display:none">
	<table style="border: 1px solid black;background-color:  rgb(255, 251, 172); width: 700px;" border="1">
		<tr>
		    <td colspan="2" style="text-align:center;"> <h1>객실타입관리</h1></td>            
		</tr>
		<tr>
		    <td>
			    <table style="text-align: center;">
					<select id="tSelect" size="15" style="width:300px; height:325px; background-color: rgb(255, 212, 149);">
				    </select>
			 	</table>
			</td>
		<td>
		<table style="width:350px;"cellpadding=9>
			<tr>
			    <td>객실타입번호</td><td><input type="number" id="rT" name="rT" value="1"></td>
			</tr>
			<tr>
			    <td>
			    	객실타입명</td><td><input type="text" id="rTN" name="rTN">
			    	<input type=hidden id=s_num>
			    </td>
			</tr>
				<tr>
					<td style="text-align:center;" colspan="2">
						<button id="btnadd">추가</button> &nbsp; 
						<button id="btndel">삭제</button> &nbsp; 
						<button id="btnempty">비우기</button>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</div>