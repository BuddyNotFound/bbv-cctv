let Table = []
let Opened = false
// UI BUILD BY NEENGAME
function TriggerClasses(Cams) {
    for (var i=0; i < Cams.length; i++) {
        let elementId = Cams[i].name
        const maxLength = 20;
        const Label = Cams[i].name.length > maxLength ? Cams[i].name.substring(0, maxLength) + '': Cams[i].name;
        let string = `
        <div id="${elementId}" class="neen-boxes selectDisable">
        <img src="${Cams[i].url}" data-toggle="modal" data-target="#imageModal" data-imgurl="${Cams[i].url}">
            <div class="button-container">
                <button class="neen-button green" onclick="PreviewData('${i}')">View Camera</button>
            </div>
            <div class="neen-rent-name selectEnable">${Label}</div>
        </div>
        `;
        Table.push(string)
    }
    $(".neen-boxes-flex").html(Table.join(""));  
}

function PreviewData(Prev, Price) {
    CloseUi()
    $.post(`https://${GetParentResourceName()}/PreviewInformation`, JSON.stringify(
        {
            id: Prev,
        }
    ));
}

function GoInside(Go) {
    CloseUi()
    $.post(`https://${GetParentResourceName()}/InsideInformation`, JSON.stringify({Rentid:Go}));
}

function CloseUi() {
    $(".neen-main-container").fadeOut(500)
    $.post(`https://${GetParentResourceName()}/CloseCamUI`, JSON.stringify({}));
}

function PreviewImagesshits(bool) {
    if (bool) {
        $(".neen-closebutton").fadeOut(250)
        $(".neen-credits").fadeOut(250)
        $(".neen-boxes-flex").fadeOut(250)
    } else {
        $(".neen-closebutton").fadeIn(250)
        $(".neen-credits").fadeIn(250)
        $(".neen-boxes-flex").fadeIn(250)
    }
}

$('.neen-image-previewer .modal-body img').on('click', function () {
    $('.neen-image-previewer').fadeOut(250);
    PreviewImagesshits(false)
});

$('.neen-image-previewer').on('click', function () {
    $(this).fadeOut(500);
});

$('.neen-image-previewer .modal-body').on('click', function (event) {
    event.stopPropagation();
});

window.addEventListener('message', function(event) {
    let data = event.data
	switch (event.data.action) {
		case 'LoadCams':
            TriggerClasses(data.Cams)
        break
        case 'OpenCamUI':
            $(".neen-main-container").fadeIn(500)
        break
        case 'CloseCamUI':
            $(".neen-main-container").fadeOut(500)
        break
    }
});

$(document).on("keydown", function (event) {
    if (event.key === "Escape" || event.keyCode === 27) {
        CloseUi()
    }
});

$(document).on('click', 'img[data-toggle="modal"]', function () {
    let imageUrl = $(this).data('imgurl');
    PreviewImagesshits(true)
    $('.neen-image-previewer').find('.modal-body img').attr('src', imageUrl);
    $('.neen-image-previewer').fadeIn(500);
});