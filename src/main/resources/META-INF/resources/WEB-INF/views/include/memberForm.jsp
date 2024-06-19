<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
  <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
  <script>
  
  	  $(document).ready(function(){
  		  
  		  $("#member_id").on("keyup",function(){
  			 
  			  	$.ajax({
  			  	   url:'userid-check',
  			  	   method:'get',
  			  	   dataType:"text",
  			  	   data:{
  			  		   "member_id":$(this).val()
  			  	   },
  			  	   success:function(res, status ,xhr){
  			  		   $("#result").text(res);
  			  	   },
  			  	   error:function(){}
  			  	});
  			  
  		  });
  		  
  	  });//ready
  
  </script>
 
  <div class="TodoApp">
    <div class="container">
            <div class="Login">
            <h1>회원가입화면</h1>
            <div class="signUpForm">
              <form:form  method="post" modelAttribute="member" 
              action="signup">
                <div>
                    <label for="member_id">아이디</label>
                    <form:input type="text" path="member_id" />
                    <form:errors path="member_id" cssClass="text-warning"/>
                </div>
                <div>
                    <label for="member_pw">비밀번호</label>
                    <form:input type="passwd" path="member_pw" />
  					 <form:errors path="member_pw" cssClass="text-warning"/>
                </div>
                <div>
                    <label for="member_pw">비밀번호 확인</label>
                    <input type="password"  />
                </div>

                
                 <div>

                    <label for="member_name">이름</label>
                    <form:input type="text" path="member_name" />
                    <form:errors path="member_name" cssClass="text-warning"/>
                </div>

                   <div>
                    <label for="member_phone">전화번호</label>
                    <form:input type="text" path="member_phone" />
                    <form:errors path="member_phone" cssClass="text-warning"/>
         
                </div>


                    <label for="member_address">주소</label>
                    <form:input type="text" path="member_address" />
                    <form:errors path="member_address" cssClass="text-warning"/>
                </div>
                <div>
                    <button name="login" class="btn btn-success m-5" >signup</button>
                </div>
               </form:form> 
            </div>
        </div>
        </div>
    </div>
