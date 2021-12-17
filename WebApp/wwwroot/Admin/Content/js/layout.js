$(document).on('click', '.btn-menu-fixed' , function(){
    $(this).addClass('active'); 
    $('.menu').addClass('show');  
});  
$(document).on('click', '.btn-menu-fixed.active' , function(){
    $(this).removeClass('active');
    $('.menu').removeClass('show');
}); 
$(window).scroll(function () { 
    let header = $('header').height();
    if( $(window).scrollTop() > 20 ){
        $('header').addClass('fixed');        
    }else{
        $('header').removeClass('fixed');  
    }
});