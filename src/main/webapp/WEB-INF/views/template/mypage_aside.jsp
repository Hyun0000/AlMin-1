<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 공통 마이페이지 사이드바입니다. CSS 작성금지 -->
<aside>
<div class="col-lg-4 sidebar mt-5 mt-lg-0">
		<div class="single-widget category-widget">
			<h4 class="title">마이페이지</h4>
			<ul>
				<li><a href="#"
					class="justify-content-between align-items-center d-flex"><h6>회원정보</h6></a></li>
				<li><a href="#"
					class="justify-content-between align-items-center d-flex "><h6 class="active">관심공고</h6></a></li>
				<li><a href="${pageContext.request.contextPath}/resumes/selectAllResume"
					class="justify-content-between align-items-center d-flex"><h6>이력서 관리</h6></a></li>
			</ul>
		</div>
	</div>
</aside>
