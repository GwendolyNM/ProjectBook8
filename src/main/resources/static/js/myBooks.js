$(document).ready(function() {
    $('.deleteButton').click(function(event) { // 클래스 선택자 .deleteButton 사용

        if (confirm('정말로 삭제하시겠습니까?')) {
            $('#deleteForm').submit(); // 확인을 클릭한 경우 폼을 서브밋
        } else {
        	event.preventDefault(); // 기본 동작을 막음
            // 취소를 클릭한 경우 아무런 동작을 하지 않음
        }
    });
});
