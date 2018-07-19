<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<div class="postcodify_popup_background" style="display: none;"></div>		
<div class="postcodify_popup_layer" data-version="3.4.1" style="display: none;">
	<div class="postcodify_controls">
		<div class="postcodify_search_controls postcode_search_controls">
			<div class="postcodify_placeholder">검색할 주소를 여기에 입력해 주세요</div>
			<label for="postcodify_15318048196484487" style="display: none;">검색 키워드</label>
			<input type="text" class="keyword" value="" id="postcodify_15318048196484487">
		</div>
		<div class="postcodify_curve_slice"></div>
		<div class="postcodify_button_area">
			<button type="button" class="search_button" id="postcodify_15318048196484487_button">검색</button>
			<button class="close_button">×</button>
		</div>
	</div>
	<div class="postcodify_displays" style="height: 567px;">
		<div class="postcodify_results postcodify_search_form postcode_search_form"></div>
		<div class="postcodify_help">
			<p>우편번호 검색 요령</p>
			<table>
				<tbody>
					<tr>
						<th>구분</th>
						<th>사용할 검색어</th>
						<th>검색 예</th>
					</tr>
					<tr>
						<td>도로명주소</td>
						<td>도로명 + 번호</td>
						<td>세종대로 110</td>
					</tr>
					<tr>
						<td>지번주소</td>
						<td>동·리 + 번지</td>
						<td>부산 연산동 1000</td>
					</tr>
					<tr class="postcodify_building_search">
						<td>건물명</td>
						<td>빌딩 또는 아파트단지명</td>
						<td>수곡동 주공3차</td>
					</tr>
					<tr>
						<td>사서함</td>
						<td>사서함명 + 번호</td>
						<td>광화문우체국사서함 123-4</td>
					</tr>
				</tbody>
			</table>
			<p>정확한 검색을 위한 팁</p>
			<ul>
				<li><span>시·군·구·읍·면 등은 쓰지 않아도 되지만,</span> <span>쓰실 경우 반드시 띄어쓰기를 해 주세요.</span></li>
				<li><span>도로명에 포함된 "××번길" 등 숫자도</span> <span>잊지 말고 써 주세요.</span></li>
				<li><span>건물명보다는 번호가 포함된 정확한 주소로</span> <span>검색하는 것이 빠르고 정확합니다.</span></li>
			</ul>
  		</div>
  </div>
  <div class="postcodify_logo">P O W E R E D &nbsp; B Y &nbsp; <a href="http://postcodify.poesis.kr/">P O S T C O D I F Y</a></div>
</div>