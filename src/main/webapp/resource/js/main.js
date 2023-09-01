function deleteBViet(path) {
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

function enableEditMode(id) {
    editingId = id;
    refreshUI();
}

function cancelEditing() {
    editingId = null;
    refreshUI();
}
function refreshUI() {
    // Cập nhật giao diện dựa trên biến editingId
    var comments = document.getElementsByClassName("comtent"); // Lấy tất cả các bình luận
    for (var i = 0; i < comments.length; i++) {
        var comment = comments[i];
        var editButton = comment.querySelector(".edit-button");
        var deleteButton = comment.querySelector(".delete-button");

        var commentId = comment.getAttribute("data-comment-id");
        // Nếu bình luận đang trong chế độ chỉnh sửa
        if (editingId === commentId) {
            editButton.style.display = "none"; // Ẩn nút "Chỉnh sửa"
        } else {
            editButton.style.display = "block"; // Hiển thị nút "Chỉnh sửa"
        }
    }
}

