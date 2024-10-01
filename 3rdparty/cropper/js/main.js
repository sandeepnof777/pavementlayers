window.onload = function () {
  'use strict';

  var Cropper = window.Cropper;
  var URL = window.URL || window.webkitURL;
  var container = document.querySelector('.img-container');
  var image = container.getElementsByTagName('img').item(0);

  var options = {
    aspectRatio: 16 / 6,
    preview: '.img-preview',
    ready: function (e) {
      console.log(e.type);
    },
    cropstart: function (e) {
      console.log(e.type, e.detail.action);
    },
    cropmove: function (e) {
      console.log(e.type, e.detail.action);
    },
    cropend: function (e) {
      console.log(e.type, e.detail.action);
    },
    crop: function (e) {
      
    },
    zoom: function (e) {
      console.log(e.type, e.detail.ratio);
    }
  };
  var cropper = new Cropper(image, options);
  var originalImageURL = image.src;
  var uploadedImageType = 'image/jpeg';
  var uploadedImageName = 'cropped.jpg';
  var uploadedImageURL;

  // Tooltip
  $('[data-toggle="tooltip"]').tooltip();

  // Buttons
  if (!document.createElement('canvas').getContext) {
    $('button[data-method="getCroppedCanvas"]').prop('disabled', true);
  }

  if (typeof document.createElement('cropper').style.transition === 'undefined') {
    $('button[data-method="rotate"]').prop('disabled', true);
    $('button[data-method="scale"]').prop('disabled', true);
  }

  

  document.body.onkeydown = function (event) {
    var e = event || window.event;

    if (e.target !== this || !cropper || this.scrollTop > 300) {
      return;
    }

    switch (e.keyCode) {
      case 37:
        e.preventDefault();
        cropper.move(-1, 0);
        break;

      case 38:
        e.preventDefault();
        cropper.move(0, -1);
        break;

      case 39:
        e.preventDefault();
        cropper.move(1, 0);
        break;

      case 40:
        e.preventDefault();
        cropper.move(0, 1);
        break;
    }
  };

  // Import image
  var inputImage = document.getElementById('inputImage');

  if (URL) {
    inputImage.onchange = function () {

      $('.progress-bar').css({width: 0 * 100 + '%'});
      $('.progress-bar').html('0%');
      
      $("#LogoUploadEditor").dialog('open');
      var files = this.files;
      var file;

      if (files && files.length) {
        file = files[0];

        if (/^image\/\w+/.test(file.type)) {
          uploadedImageType = file.type;
          uploadedImageName = file.name;

          if (uploadedImageURL) {
            URL.revokeObjectURL(uploadedImageURL);
          }

          image.src = uploadedImageURL = URL.createObjectURL(file);

          if (cropper) {
            cropper.destroy();
          }

          cropper = new Cropper(image, options);
          inputImage.value = null;
        } else {
          window.alert('Please choose an image file.');
        }
      }
    };
  } else {
    inputImage.disabled = true;
    inputImage.parentNode.className += ' disabled';
  }

  function base64ToBlob(base64, mime) 
{
    mime = mime || '';
    var sliceSize = 1024;
    var byteChars = window.atob(base64);
    var byteArrays = [];

    for (var offset = 0, len = byteChars.length; offset < len; offset += sliceSize) {
        var slice = byteChars.slice(offset, offset + sliceSize);

        var byteNumbers = new Array(slice.length);
        for (var i = 0; i < slice.length; i++) {
            byteNumbers[i] = slice.charCodeAt(i);
        }

        var byteArray = new Uint8Array(byteNumbers);

        byteArrays.push(byteArray);
    }

    return new Blob(byteArrays, {type: mime});
}

document.getElementById('rotateLeft').addEventListener('click', function () {
  cropper.rotate('45');

});

document.getElementById('rotateRight').addEventListener('click', function () {
  cropper.rotate('-45');
});

document.getElementById('zoom_in').addEventListener('click', function () {
  cropper.zoom('0.1');

});

document.getElementById('zoom_out').addEventListener('click', function () {
  cropper.zoom('-0.1');
});

document.getElementById('image_reset').addEventListener('click', function () {
  
    cropper.destroy();
  
  cropper = new Cropper(image, options);
});

  document.getElementById('imageCrop').addEventListener('click', function () {
    $('.progress').removeClass('hidden');
    var canvas;
    if (cropper) {

      canvas = cropper.getCroppedCanvas({
        imageSmoothingEnabled: true,
        imageSmoothingQuality: 'high',
    });

canvas.toBlob(function (blob) {



var url = "company_logo_upload";               
             
var formData = new FormData();
formData.append('clientLogo', blob);
formData.append('changeLogo', 1);
$.ajax({
  
    url: url, 
    type: "POST", 
    cache: false,
    contentType: false,
    processData: false,
    data: formData,

    xhr: function () {
      var xhr = new window.XMLHttpRequest();
      xhr.upload.addEventListener("progress", function (evt) {
          if (evt.lengthComputable) {
              var percentComplete = evt.loaded / evt.total;
              console.log(percentComplete);
              $('.progress-bar').css({
                  width: percentComplete * 100 + '%'
              });
              $('.progress-bar').html(Math.round(percentComplete * 100) + '%');
              if (percentComplete === 1) {
                  $('.progress').addClass('hidden');
              }
          }
      }, false);
      xhr.addEventListener("progress", function (evt) {
          if (evt.lengthComputable) {
              var percentComplete = evt.loaded / evt.total;
              console.log(percentComplete);
              $('.progress-bar').css({
                  width: percentComplete * 100 + '%'
              });
              $('.progress-bar').html(Math.round(percentComplete * 100) + '%');
          }
      }, false);
      return xhr;
  },
  
  })
        .done(function(e){
          $("#LogoUploadEditor").dialog('close');
          swal('','Uploaded');
          setTimeout(function () {
              location.reload();
          }, 200);
        });


      });
    }
  });




};
