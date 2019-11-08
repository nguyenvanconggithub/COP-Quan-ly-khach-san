function setPreloadIMG(input, img) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            console.log(e.target.result);

            $(img).attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}
function addMoreImage(elem) {
    var moreInputElement =
        '<span class="bg-dark d-flex align-items-center justify-content-center opacity-50-100 position-relative square-150x150 m-2"' +
        'id="image-element-add">' +
        '<img src="images/add_button.PNG" class="square-150x150 position-absolute" id="preload-img-add">' +
        '<input type="file" name="imageList" class="square-150x150 position-absolute opacity-0" id=""' +
        'onchange="addMoreImage(this)">' +
        '<span class="position-absolute text-danger invisible cursor-pointer font-weight-bold" style="top:0;right:5%" onclick="deleteImage(this)">X</span>' +
        '</span>';
    var spanElement;
    if (elem != undefined) {
        spanElement = $(elem).parent();
        if ($(spanElement).hasClass("previewer")) {
            //get ID Image And remove from database
            setPreloadIMG(elem, $(spanElement).children("img"));
            if (!$('#listRemoveImage').val().includes($(elem).attr("id"))) {
                if ($('#listRemoveImage').val() == "") {
                    $('#listRemoveImage').val($('#listRemoveImage').val() + $(elem).attr("id"));
                } else {
                    $('#listRemoveImage').val($('#listRemoveImage').val() + "-" + $(elem).attr("id"));
                }

            }
        }
        else {
            setPreloadIMG(elem, $(spanElement).children("img"));
            $('#image-element-add').after(moreInputElement);
            $(spanElement).attr("id", "image-element-loaded")
            $(spanElement).removeClass("opacity-50-100");
            $(spanElement).addClass("previewer");
            $(spanElement).children("span").removeClass("invisible");
        }
    }
}
function deleteImage(elem) {
    if (elem != undefined) {
      	if($('#listRemoveImage').val() != undefined){
            if (!$('#listRemoveImage').val().includes($(elem).prev().attr("id"))) {
            	if ($('#listRemoveImage').val() == "") {
                	$('#listRemoveImage').val($('#listRemoveImage').val() + $(elem).prev().attr("id"));
            	} else {
                	$('#listRemoveImage').val($('#listRemoveImage').val() + "-" + $(elem).prev().attr("id"));
            	}

        	}
        }

        $(elem).parent().remove();
    }
}