
//const isemail = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
const isemail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

$(".banner-regular").slick({
    dots: true,
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    speed: 300
});
wow = new WOW({
    animateClass: 'animated',
    offset: 100,
    callback: function (box) {
        console.log("WOW: animating <" + box.tagName.toLowerCase() + ">")
    }
});
wow.init();
// document.getElementById('moar').onclick = function () {
//     var section = document.createElement('section');
//     section.className = 'section--purple wow fadeInDown';
//     this.parentNode.insertBefore(section, this);
// };

$(window).scroll(function () {
    $("#menu").addClass("menu-fixed");
    if (window.scrollY == 0) {
        $("#menu").removeClass("menu-fixed");
    }
    if (window.scrollY < 200) {
    }
});
$(document).ready(function () {
    
    if($(".c-layout-go2top").length > 0){
		$(window).scroll(function () {
			var e = $(window).scrollTop();
			if (e > 300) {
				$(".c-layout-go2top").show()
			} else {
				$(".c-layout-go2top").hide()
			}
		});
		$(".c-layout-go2top").click(function () {
			$('body,html').animate({
				scrollTop: 0
			})
		})
	}		
    $('#notificationModalLabel').modal('show');
    //$('#buyNow').modal('show');

    $("#modal-authen").click(function () {
        if(!$('#agree-add-friend').prop( "checked" )){
            $('#modal-authen-false').modal('show');
        }
        else{
            if(!$("#name-account").val()){
                $('#modal-authen-name').modal('show');
            }
            else{
                $('#modal-authen-true').modal('show');
            }
        }
    })
});

function objectifyForm(formArray) {
    //serialize data function
    var returnArray = {};
    for (var i = 0; i < formArray.length; i++) {
        returnArray[formArray[i]['name']] = formArray[i]['value'];
    }
    return returnArray;
}

var submitData = {
    Search: "",
    PageSize: 20,
    PageNumber: 1,
}
function LoadMasterData() {
    $.ajax({
        url: '/MasterData/MasterDataView',
        type: 'post',
        dataType: 'html',
        data: {
            baseParam: submitData
        },
        beforeSend: function () {
        },
        success: function (res) {
            //console.log(res);
            let data = JSON.parse(res).results.map(x => x);
            //console.log(data);
            //let items = [];
            //items.push(`<option value="">-- Chọn đúng mệnh giá, sai mất thẻ --</option>`);
            $.each(data, function (key, val) {
                if (val.id == 1) {
                    $("#MessageFacebook").html(val.value)
                }
                if (val.id == 3) {
                    $(".nPhoneNumber").text(val.value)
                    //console.log(val.value)
                    //$("#nPhoneNumber").text("testing");
                }
                if (val.id == 4) {
                    $(".nLogo").attr("src", val.value);
                }
                if (val.id == 5) {
                    $('body').css('background-image', 'url(' + val.value + ')');
                }
            });
        },
        error: function (error) {
            console.log(error);
        },
    })
};
LoadMasterData();



  //  window.fbAsyncInit = function() {
  //      FB.init({
  //          appId: '533718837738128',
  //          cookie: true,
  //          xfbml: true,
  //          version: 'v11.0'
  //      });

  //  FB.AppEvents.logPageView();

  //};

  //(function(d, s, id){
  //   var js, fjs = d.getElementsByTagName(s)[0];
  //   if (d.getElementById(id)) {return;}
  //   js = d.createElement(s); js.id = id;
  //   js.src = "https://connect.facebook.net/en_US/sdk.js";
  //   fjs.parentNode.insertBefore(js, fjs);
  // }(document, 'script', 'facebook-jssdk'));
