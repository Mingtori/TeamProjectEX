<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../page/mytop.jsp"%>
<head>
<script type="text/javascript">
      
   //체크박스전체
   function checkAll(){
      if(myform.allCheck.checked == true){
         myform.mycheck.checked = true;
         for(i=0; i < myform.mycheck.length; i++){
            myform.mycheck[i].checked = true;
         }
         var val = parseInt('${totalprice}');
         document.getElementById("selectprice").value = val.toLocaleString();
      } else if(myform.allCheck.checked == false){
         myform.mycheck.checked = false;
         for(i=0; i < myform.mycheck.length; i++){
            myform.mycheck[i].checked = false;
         }
         document.getElementById("selectprice").value = 0;
      } 
   }
   
   //체크박스개별
   function checkOne(){
      for(i=0; i < myform.mycheck.length; i++){
         if(myform.mycheck[i].checked == false){
            myform.allCheck.checked = false;
            break;
         }
      }
      
      var chk = myform.mycheck;
      var len = chk.length;
      var checkRow = '';
      var sum = 0;
      var cnt = 0;
      var checkCnt = 0;
   
      for(var i = 0; i < len; i++){
         if(chk[i].checked == true){
            checkCnt ++;
         }
      }
      
      if(len == undefined){
         if(myform.mycheck.checked == true){
            checkRow = document.getElementById("cartprice_"+1).value;
            val = parseInt(checkRow);
         } else if(myform.mycheck.checked == false){
            myform.allCheck.checked = false;
            checkRow = 0;
            val = parseInt(checkRow);
         }
         sum += val;
         checkRow = '';
      }else {
         for(var i = 0; i < len; i++){
            var val = 0;
            if(chk[i].checked == true){
               var j = i+1
               checkRow = document.getElementById("cartprice_"+j).value;
               val = parseInt(checkRow);
            } 
            sum += val;
            cnt++;
            checkRow = '';
         }
      }
      document.getElementById("selectprice").value = sum.toLocaleString();
   }
   
   function changeQty(_cartid){
      var cartqty = document.getElementById("cartqty"+_cartid).value;
      var cartid = document.getElementById("cartid"+_cartid).value;
      location.href = '${pageContext.request.contextPath}/update.ct?cartid='+cartid+'&cartqty='+cartqty;
   }
   
   function chxCart(str){
      var chk = myform.mycheck;
      var len = chk.length;
      var checkRow = '';
      var cnt = 0;
      var rowid = [];
      var checkCnt = 0;
   
      for(var i = 0; i < len; i++){
         if(chk[i].checked == true){
            checkCnt ++;
         }
      }
      
      if(len == undefined){
         if(myform.mycheck.checked == true){
            checkRow = chk.value;
         } 
         rowid.push(checkRow);
         checkRow = '';
      }else {
         for(var i = 0; i < len; i++){
            if(chk[i].checked == true){
               checkRow = chk[i].value;
            } 
            rowid.push(checkRow);
            cnt++;
            checkRow = '';
         }
      }
   
      location.href = '${pageContext.request.contextPath}/'+str+'?rowid='+rowid;  
   }
   
   function checkDate(str) {
      var _enddate = str
      var _todate = new Date();
      var _year = _todate.getFullYear();
      var _month = _todate.getMonth() + 1;
      var _day = _todate.getDate();
      
      if(_month < 10) {
         _month = '0' + _month
      }
      
      if(_day < 10) {
         _day = '0' + _day
      }
      
      _todate = _year + "-" + _month + "-" + _day;
      
      if(_enddate < _todate) {
         alert("예매불가능")
         return false;
      }
   }
      
</script>
</head>
<form name="myform">
	<h1>장바구니</h1>
	<div>
		<table class="table">
			<tr align="center">
				<th>번호</th>
				<th>이미지</th>
				<th>상품명</th>
				<th>사용가능기간</th>
				<th>수량</th>
				<th>가격</th>
				<th>선택<br> <input type="checkbox" name="allCheck" onchange="checkAll()"></th>
			</tr>
			<c:forEach items="${cart }" var="cart">
				<tr align="center">
					<td>${cart.rownum }</td>
					<td><a href="detail.prd?prodid=${cart.prodid }&pageNumber=1">
							<img
							src="${pageContext.request.contextPath }/resources/${cart.prodimage }"
							width="100" />
					</a></td>
					<td><a href="detail.prd?prodid=${cart.prodid }&pageNumber=1">${cart.prodname }</a></td>
					<td>${cart.proddate }</td>
					<td>
						<input type="number" name="cartqty" id="cartqty${cart.cartid }" min="1" max="${cart.prodstock }" value="${cart.cartqty }" size="1"/> 
					    <input type="hidden" name="cartid" id="cartid${cart.cartid }" value="${cart.cartid }" />
					    <input type="button" value = "변경" onclick="changeQty('${cart.cartid}')">
					</td>
					<td><input type = "hidden" name = "cartprice_${cart.rownum }" id = "cartprice_${cart.rownum }" value = "${cart.cartprice}">
					<fmt:formatNumber value="${cart.cartprice}" pattern="###,###" />원
					</td>
					<td>
						<input type="checkbox" name="mycheck" value="${cart.cartid }" onchange="checkOne()"> 
					</td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<label style="font-size: large;"> 총금액 </label>
			<label style="font-size: large;"><fmt:formatNumber value="${totalprice}" pattern="###,###" />원</label>
		</div>
		<hr>
		<div>
			<label style="font-size: large;"> 선택금액 </label>
			<label style="font-size: large;">
			<input type = "text" name = "selectprice" id = "selectprice" value="<fmt:formatNumber value='0' pattern='###,###' />"> 원</label>
		</div>	
		<div>
			<input type="button" value="삭제하기" onclick="chxCart('delete.ct')" />
			<input type="button" value="주문하기" onclick="chxCart('insert.ord')" />
		</div>
	</div>
</form>	
<%@ include file="../page/mybottom.jsp"%>