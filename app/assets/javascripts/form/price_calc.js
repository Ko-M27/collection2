$(document).on('turbolinks:load', ()=>{
  $(function(){
    $('.price_form').on('input', function(){ 
      var data = $('.price_form').val();
      var profit = Math.round(data * 0.9) 
      var fee = (data - profit) 
      $('.right_bar').html(fee) 
      $('.right_bar').prepend('¥') 
      $('.right_bar_2').html(profit)
      $('.right_bar_2').prepend('¥')
      $('#price').val(profit) 
      if(profit == '') { 
      $('.right_bar_2').html('');
      $('.right_bar').html('');
      }
    })
  });
});