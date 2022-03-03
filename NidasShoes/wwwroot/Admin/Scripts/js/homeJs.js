$('.Product-slick').slick({
    dots: false,
    infinite: true,
    speed: 300,
    slidesToShow: 4,
    slidesToScroll: 1,

    prevArrow:"<img class='a-left control-c prev slick-prev' src='/Content/images/images/trang-chu/backButton.png'>",
    nextArrow:"<img class='a-right control-c next slick-next' src='/Content/images/images/trang-chu/nextButton.png'>",
responsive: [{
            breakpoint: 1024,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 1,
                infinite: true

            }
        },
        {
            breakpoint: 600,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 1
            }
        },
        {
            breakpoint: 480,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }
        
    ]
});