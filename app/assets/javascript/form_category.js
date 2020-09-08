function appendOption(category) {
  let html = 
    `<option value="${category.id}" data-category="${category.id}">${category.text}</option>`;
  return html;
}

function appendChildrenBox(insertHTML) {
  let childSelectHtml = '';
  childSelectHtml = 
    `<select class="category_form form" id="children-form">
       <option value="" data-category="" >選択してください</option>
       ${insertHTML}
      </select>`;
  $('#children-category').append(childSelectHtml);
}

$(document).on("change","#parent-category", function() {
  let parentCategory =  $("#parent-form").val();
  if (parentCategory != "") {
    $.ajax( {
      type: 'GET',
      url: 'get_category_children',
      data: {
        parent_text: parentCategory 
        },
      dataType: 'json'
    })
    .done(function(children) {
      $("#children-category").empty();
      let insertHTML = '';
      children.forEach(function(child) {
        insertHTML += appendOption(child);
      });
      appendChildrenBox(insertHTML);
    })
    .fail(function() {
      alert('error：子カテゴリーの取得に失敗');
    })
  }else{
    $("#children-category").empty();
  }
});