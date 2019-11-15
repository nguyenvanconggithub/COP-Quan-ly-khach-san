function addMoreInput(btnAdd){
    var content =   '<div class="row form-group">' + 
                        '<label for="service" class="col-sm-12 col-md-2"></label>' +
                        '<input type="text" name="services" class="form-control col-sm-12 col-md-4" required>' +
                        '<button type="button" onclick="addMoreInput(this)" class="btn btn-primary col-sm-12 col-md-1">Thêm</button>'+
                    '</div>';
    $('#service').append(content);
    $(btnAdd).parent().append('<button type="button" onclick="deleteInput(this)" class="btn btn-danger col-sm-12 col-md-1">Xóa</button>')
    $(btnAdd).remove();
}
function deleteInput(btnDelete){
    $(btnDelete).parent().remove();
    $('#service').children(':first').children(':first').html('Dịch vụ')
}