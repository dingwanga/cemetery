 $('#tab_header').find('span').on('click', function(){ 

       $(this).addClass("selected").siblings().removeClass("selected"); 

       $('#tab_body').find('ul').eq($(this).index()).addClass("shown").siblings().removeClass("shown");
 });