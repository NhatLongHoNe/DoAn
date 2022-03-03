function displayMenuMobile(){
    $('.btn-menu-moblie').click(function () { 
       let status = $(this).attr('data-display');  
       if( status == 0 ){
            $('.menu').addClass('active');
            $(this).attr('data-display', 1); 
       }
    });
}
function eventHideMenuMobile(){
    $(document).mouseup(function(e) {
        let container = $(".menu nav");
        let status = $('.btn-menu-moblie').attr('data-display');  
        // if the target of the click isn't the container nor a descendant of the container
        if (!container.is(e.target) && container.has(e.target).length === 0 && status != 0 ) 
        {
            $('.menu').addClass('noactive'); 
            setTimeout(function(){
                $('.menu').removeClass('active');  
                $('.menu').removeClass('noactive');  
                $('.btn-menu-moblie').attr('data-display', 0);
            }, 300)
        }
    });
}
displayMenuMobile();  
eventHideMenuMobile();  
