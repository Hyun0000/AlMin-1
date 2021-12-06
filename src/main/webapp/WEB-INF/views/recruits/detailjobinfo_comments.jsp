<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="comments_insert_modal_back">
	<div id="comments_insert_box">
		<div class="comments_insert_top">
			<fieldset>
				<legend style="color: white;" id="comments_insert_legend">한줄 후기</legend>
				<div id="contract_box">
					<input name="ccContent" id="commentsLine"
						placeholder="100자 이내로 작성해주세요(공백포함)">
					<div id="radio_box">
						<h3>근로계약서 작성 여부</h3>
						<label for="contract_y">작성</label>
						<input type="radio" value="Y" name="ccContract" id="contract_y">
						<label for="contract_n">미작성</label>
						<input type="radio" value="N" name="ccContract" id="contract_n">
					</div>
				</div>
			</fieldset>
		</div>
		<!-- 후기 키워드 -->
		<div class="comments_insert_btm">
			<c:forEach var="map" items="${commentsMap}">
				<c:set var="dropNum" value="${dropNum + 1}" />
				<c:set var="dragNum" value="${dragNum + 1}" />

				<c:choose>
					<c:when test="${map.key == 1}"><div class="keyName">장점</div></c:when>
					<c:when test="${map.key == 2}"><div class="keyName">단점</div></c:when>
					<c:when test="${map.key == 3}"><div class="keyName">조건</div></c:when>
					<c:when test="${map.key == 4}"><div class="keyName">분위기</div></c:when>
					<c:when test="${map.key == 5}"><div class="keyName">급여</div></c:when>
				</c:choose>
				
				<div id="dropzone_${dropNum}" class="dropzoneClass" ondrop="drop(event)" ondragover="allowDrop(event)">
				</div>

				<div id="dragzone_${dragNum}" class="dragzoneClass">
					<c:forEach var="condition" items="${map.value}">
						<c:set var="idNum" value="${idNum + 1}" />
						<div id="drag_${idNum}" class="dragEle" draggable="true" ondragstart="drag(event);"><span class="keyword">${condition}</span><span class="xMark" onClick="deleteX()">&times;</span></div>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
		<div id="btnBox">
			<button type="button" id="submitBtn">등록</button>
		</div>
	</div>
</div>