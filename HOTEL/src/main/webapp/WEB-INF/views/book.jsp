<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    option{
        font-size: 12px;
    }
    button{
        border-radius: 5px; padding: 5px; background-color:rgb(255,192,144);
    }
    #booksel, #infosel{
    	width: 100%; height: 400px;
    }
</style>
<body>
    <table style="background-color: rgb(255, 251, 172); border:1px solid black; width:100%;" >
        <tr>
            <td style="width:33%; text-align:center;">
                <button id=btnmain>객실타입관리</button> &nbsp;
                <button id=btnbook>예약관리</button>
            </td>
            <td style="width:34%; text-align:center;"> <h1>예약관리</h1></td>
            <td style="width:33%">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>체크인</td><td><input type="date" id="chIn" name="chIn"></td>
                    </tr>
                    <tr>
                        <td>체크아웃</td><td><input type="date" name="chOut" id="chOut"></td>
                    </tr>
                    <tr>
                        <td>객실타입</td>
                        <td>
                            <select id="typesel" size="1">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><button>찾기</button></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <select id=infosel size="20" style="width: 300px; height: 350px;">
                                <option>예약가능한 객실목록</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </td>
                <td style="background-color:rgb(255, 212, 149)">
                    <table width=350px; cellpadding="13">
                        <tr>
                            <td>체크인</td><td><input type="text" id="checkin" readonly></td>
                        </tr>
                        <tr>
                            <td>체크아웃</td><td><input type="text" id="checkout" readonly></td>
                        </tr>
                        <tr>
                            <td>객실타입</td><td><input id="r_num" type="text" readonly>
                            	<input type="hidden" id="hidden">
                            	<input type="hidden" id="hidden2">
                            	</td>
                        </tr>
                        <tr>
                            <td>객실명</td><td><input id="r_name" type="text" readonly></td>
                        </tr>
                        <tr>
                            <td>숙박인원</td><td><input id="stay" type="number" style="width:170px">명</td>
                        </tr>
                        <tr>
                            <td>대표자명</td><td><input id="g_name" type="text"></td>
                        </tr>
                        <tr>
                            <td>연락처</td><td><input id="g_mobile" type="text"></td>
                        </tr>
                        <tr>
                            <td>총 숙박요금</td><td><input id="price" type="text" readonly>원</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:center;">
                            <button id="btnadd">추가</button> &nbsp; 
                            <button id="btndelete">삭제</button> &nbsp; 
                            <button id="btnempty">비우기</button></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table>
                        <select id=booksel size="20">
                            <option value='seq_book/객실번호'>예약완료된 객실목록</option>
                        </select>
                    </table>
                </td>
    </table>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="book.js"></script>
</html>