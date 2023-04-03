///* 
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/gulpfile.js to edit this template
// */
//
var script = document.createElement('script');
script.src = 'https://code.jquery.com/jquery-3.6.3.min.js'; // Check https://jquery.com/ for the current version
document.getElementsByTagName('head')[0].appendChild(script);

function addCartAllJs(path, product, quantity) {
    console.log(`${path}/cart/add?pid=${product}&quan=${quantity}`);
    $.ajax({
        url: `${path}/cart/add`,
        method: 'GET',
        data: {
            product_id: product,
            quantity: quantity
        },
        success: function (data, textStatus, jqXHR) {
            getCartAllJs(path);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("get cart status: " + JSON.stringify(textStatus) + "\n" + JSON.stringify(jqXHR) + "\n\n" + JSON.stringify(errorThrown));
        },
        complete: function (jqXHR, textStatus) {
//                    alert(JSON.stringify (jqXHR) + "\n\n" + JSON.stringify(textStatus));
        }
    })

    function getCartAllJs(path) {
        $.ajax({
            url: `${path}/cart`,
            method: 'GET',
            success: function (data, textStatus, jqXHR) {
                location.reload();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("get cart status: " + JSON.stringify(textStatus) + "\n" + jqXHR.toString() + "\n\n" + errorThrown.toString());
            },
            complete: function (jqXHR, textStatus) {
//                    alert(JSON.stringify (jqXHR) + "\n\n" + JSON.stringify(textStatus));
            }
        })

    }

 function clearCartAllJs(path, product) {
        $.ajax({
            url: `${path}/cart/clear`,
            method: 'GET',
            success: function (data, textStatus, jqXHR) {
                location.reload();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("get cart status: " + JSON.stringify(textStatus) + "\n" + jqXHR.toString() + "\n\n" + errorThrown.toString());
            },
            complete: function (jqXHR, textStatus) {
//                    alert(JSON.stringify (jqXHR) + "\n\n" + JSON.stringify(textStatus));
            }
        })

    }

}
