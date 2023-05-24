<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<Style>
    option{
        font-size: 20px;
    }
    button{
        border-radius: 5px; padding: 5px; background-color:rgb(255,192,144);
    }
</Style>
<body>
 <table style="border: 1px solid black; background-color: rgb(255, 251, 172);">
            <tr>
                <td colspan='2' style="vertical-align: top;text-align: left;">
                   	<button id=btnmain>객실타입관리</button> &nbsp;
                	<button id=btnbook>예약관리</button>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;"><h1>객실관리</h1></td>            
            </tr>
            <tr>
                <td>
                    <select id="rNSel" size="15" style="width:300px; height:325px; background-color: rgb(255, 212, 149);">
                    </select>
                </td>
                <td>
                    <table style="width: 330px;"cellpadding="9">
                        <tr>
                            <td>
                            	객실번호</td><td><input type="number" id="rNum" name="rNum" value="1">
                            	<input type=hidden id=infoSeq>
                            </td>
                        </tr>
                        <tr>
                            <td>객실명</td><td><input type="text" id="rName" name="rName"></td>
                        </tr>
                        <tr>
                            <td>객실타입</td>
                            <td><select id="rTSel" size="1">
                            </select></td>
                        </tr>
                        <tr>
                            <td>숙박가능인원</td><td><input type="number" id="rToNum" name="rToNum" value="1"></td>
                        </tr>
                        <tr>
                            <td>숙박요금</td><td><input type="text" id="rPrice" name="rPrice"></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:center;">
                                <button id="add">추가</button> &nbsp; 
                                <button id="del">삭제</button> &nbsp; 
                                <button id="emp">비우기</button> <br><br>
                                <button id="btnShow">객실 타입 관리</button>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    <div id="alertDig" style="display: none; font-size: 20px">
        <label id="lblMessage" style="color:brown;"></label><br>
    </div>
<%@ include file='roomType.jsp' %>
<%@ include file='main_footer.jsp'%>