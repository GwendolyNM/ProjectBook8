	function loadFile(input) {
		let file = input.files[0]; // 선택파일 가져오기

		let newImage = document.createElement("img"); //새 이미지 태그 생성

		//이미지 source 가져오기
		newImage.src = URL.createObjectURL(file);
		newImage.style.width = "100%"; //div에 꽉차게 넣기
		newImage.style.height = "100%";
		newImage.style.objectFit = "cover"; // div에 넘치지 않게 설정

		//이미지를 image-show div 출력
		let container = document.getElementById('image-show');
		container.appendChild(newImage);
	}
	/*기본 업로드 버튼은 숨기고 커스텀 버튼 활용하는 코드*/
	function loadFile(event) {
	var reader = new FileReader();
	reader.onload = function() {
		var output = document.getElementById('image-show');
		output.style.backgroundImage = 'url(' + reader.result + ')';
	};
	reader.readAsDataURL(event.files[0]);
}