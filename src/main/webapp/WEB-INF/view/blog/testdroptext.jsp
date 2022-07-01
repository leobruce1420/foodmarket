<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>圖片測試</title>
<style>
  *{
  padding:0;
  margin:0;
  }

  div.pullinup{
  background-color:gray;
    border: 10px border lightgray;
    width: 80%;
    height: 40%;
    position: fixed;
  top: 10%;
  left: 10%;
display:none;
 
	
  }
  div.pullindown{
  background-color:red;
    border: 10px border lightgray;
    width: 80%;
    height: 40%;
    position: fixed;
 top: 50%;
  left: 10%;
  display:none;
  }

</style>



</head>
<body>
<textarea class="showdataarea" ></textarea>
<div class="show"></div>

	<div class="pullinup"><h1>於此處放開，上傳圖片</h1></div>
	


<script>
  const dropzone = document.querySelector('.pullinup');
  const dropzoneListener = document.querySelector('body');
  const textareashow = document.querySelector('.showdataarea');
  const showdiv = document.querySelector('.show');
  dropzoneListener.addEventListener('dragenter', event => {
	    event.preventDefault();
	    dropzone.removeAttribute("display")
	    dropzone.style.display='block';
	  });

  dropzoneListener.addEventListener('dragleave', event => {
	    event.preventDefault();
	    
	  });
  dropzoneListener.addEventListener('dragover', event => {
	    event.preventDefault();
	  });
  dropzoneListener.addEventListener('drop', event => {
	    event.preventDefault();
	    
	    dropzone.removeAttribute("display")
	    dropzone.style.display='none';

	    const file = event.dataTransfer.files[0];
	    const reader = new FileReader();
	    reader.readAsDataURL(file);

	    reader.addEventListener('loadend', () => {
	      const img = document.createElement('img');
	      img.style.width='300px';
	      img.src = reader.result;
	      textareashow.append(reader.result);
	      showdiv.append(img);
	      console.log(img)
	    });
	  });
</script>
</body>
</html>