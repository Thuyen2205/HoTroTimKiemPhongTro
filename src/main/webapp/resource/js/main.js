
function deleteFollowpr(path) {

    if (confirm("Bạn chắc chắn xóa không?") === true) {
        fetch(path, {
            method: "delete"

        }).then(res => {
            if (res.status === 204)
                location.reload();
            else
                alert("Something wrong!!!");
        });
    }
}
function deleteBinhLuanwpr(path) {

    if (confirm("Bạn chắc chắn xóa không?") === true) {
        fetch(path, {
            method: "delete"

        }).then(res => {
            if (res.status === 204)
                location.reload();
            else
                alert("Something wrong!!!");
        });
    }
}

function deleteTaiKhoanpr(path) {

    if (confirm("Bạn chắc chắn xóa không?") === true) {
        fetch(path, {
            method: "delete"

        }).then(res => {
            if (res.status === 204)
                location.reload();
            else
                alert("Something wrong!!!");
        });
    }
}
let editingId = null;

window.onscroll = function () {
    scrollFunction();
};


function scrollFunction() {
    var goToTopBtn = document.getElementById("goToTopBtn");
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        goToTopBtn.style.display = "block";
    } else {
        goToTopBtn.style.display = "none";
    }
}


function scrollToTop() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}
function layViTri() {
    if ("geolocation" in navigator) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var kinhDo = position.coords.longitude;
            var viDo = position.coords.latitude;
            // Gửi thông tin vị trí lên server thông qua Ajax
            $.ajax({
                type: "POST",
                url: "/", // Đường dẫn đến endpoint trên server để lưu vị trí
                data: {
                    kinhDo: kinhDo,
                    viDo: viDo
                },
                success: function (response) {
                    // Xử lý phản hồi từ server nếu cần
                }
            });
        });
    }
}
