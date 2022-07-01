<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<div id="instructions">
  Method 1:<br /> 1. Copy image data into clipboard, or press Print Screen <br /> 2. Press Ctrl+V (page/iframe must be focused): <br /><br /> Method 2:<br /> 1. Drag and drop an image onto the textarea
</div>
<br /><br />
<textarea id="my_textarea" style="width:300px;height:300px;"></textarea>
<script type="text/javascript">
var CLIPBOARD = new CLIPBOARD_CLASS("my_textarea", true);

/**
 * image pasting into textarea
 * 
 * @param {string} textarea_id - textarea id
 * @param {boolean} autoresize - if textarea will be resized
 */
function CLIPBOARD_CLASS(textarea_id, autoresize) {
  var _self = this;
  var textarea = document.getElementById(textarea_id);
  var ctx = document.getElementById(textarea_id).getContext("2d");

  //handlers
  document.addEventListener('paste', function(e) {
    _self.paste_auto(e);
  }, false);

  /* events fired on the drop targets */
  document.addEventListener("dragover", function(e) {
    // prevent default to allow drop
    e.preventDefault();
  }, false);
  document.addEventListener('drop', function(e) {
    // prevent default action (open as link for some elements)
    //debugger;
    e.preventDefault();
    var items = e.dataTransfer.items;
    for (var i = 0; i < items.length; i++) {
      if (items[i].type.indexOf("image") !== -1) {
        document.getElementById("instructions").style.visibility = "hidden";
        //image
        var blob = items[i].getAsFile();
        var URLObj = window.URL || window.webkitURL;
        var source = URLObj.createObjectURL(blob);
        _self.paste_createImage(source);
      }
    }
  });

  //on paste
  this.paste_auto = function(e) {
    if (e.clipboardData) {
      var items = e.clipboardData.items;
      if (!items) return;

      //access data directly
      for (var i = 0; i < items.length; i++) {
        if (items[i].type.indexOf("image") !== -1) {
          //image
          var blob = items[i].getAsFile();
          var URLObj = window.URL || window.webkitURL;
          var source = URLObj.createObjectURL(blob);
          this.paste_createImage(source);
        }
      }
      e.preventDefault();
    }
  };
  //draw pasted image to textarea
  this.paste_createImage = function(source) {
    //debugger;
    var pastedImage = new Image();
    pastedImage.onload = function() {
      if (autoresize == true) {
        //resize
        textarea.width = pastedImage.width;
        textarea.height = pastedImage.height;
      } else {
        //clear textarea
        ctx.clearRect(0, 0, textarea.width, textarea.height);
      }
      ctx.drawImage(pastedImage, 0, 0);
    };
    pastedImage.src = source;
  };
}

// detect blank textarea: https://stackoverflow.com/a/17386803/177416
function istextareaBlank(textarea) {
  var blank = document.createElement('textarea');
  blank.width = textarea.width;
  blank.height = textarea.height;

  return textarea.toDataURL() === blank.toDataURL();

}

document.getElementById("saveButton").addEventListener("click", function() {
  debugger;
  var form = document.getElementById("myForm");
  //if (form.valid()) {
    var image = document.getElementById("my_textarea");
    if (!istextareaBlank(image)) {
      var imageData = image.toDataURL("image/png");
      imageData = imageData.replace('data:image/png;base64,', '');
      document.getElementById("imageData").value = imageData;
      console.log('image/png');
    } else {
      // Pass null, otherwise the POST will submit { id = "imageData" } for this field.
      document.getElementById("imageData").value = null;
    }
    //form.submit();
  //}
});
</script>
</body>
</html>