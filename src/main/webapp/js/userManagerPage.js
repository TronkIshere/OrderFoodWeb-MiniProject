//popup add user
document.querySelector("#addUser").addEventListener("click",function (){
    document.querySelector(".addUser_modal_overlay").classList.add("active")
});
document.querySelector(".addUser-close-icon").addEventListener("click",function (){
    document.querySelector(".addUser_modal_overlay").classList.remove("active")
});
document.querySelector("#addUser-close-button").addEventListener("click",function (){
    document.querySelector(".addUser_modal_overlay").classList.remove("active")
});

//popup change user
// Biến trạng thái cho biết liệu modal có nên hiển thị hay không
var isChangeUserModalVisible = false;
var changeUserButton = document.getElementById("changeUser");
var userWrappers = document.querySelectorAll(".wrapper");

// Gắn sự kiện click cho nút chỉnh sửa người dùng
changeUserButton.addEventListener("click", function () {
    // Nếu modal đang hiển thị, tắt chức năng chỉnh sửa người dùng
    if (isChangeUserModalVisible) {
        isChangeUserModalVisible = false;
        console.log("Đã tắt chức năng chỉnh sửa người dùng");
    } else {
        // Nếu modal chưa hiển thị, mở modal và kích hoạt chức năng chỉnh sửa người dùng
        isChangeUserModalVisible = true;
        console.log("Đã mở chức năng chỉnh sửa người dùng");
    }
});

// Gắn sự kiện click cho các phần tử <a class="wrapper">
for (var i = 0; i < userWrappers.length; i++) {
    userWrappers[i].addEventListener("click", function () {
        console.log("Đang kiểm tra");
        // Kiểm tra biến trạng thái, nếu là true thì hiển thị modal
        if (isChangeUserModalVisible) {
            // Hiển thị modal body
            var changeUserModalOverlay = document.querySelector(".changeUser_modal_overlay");
            changeUserModalOverlay.classList.add("active");

            // Lấy các thông tin từ phần tử wrapper được click và cập nhật vào modal
            var userIdForChange = this.getAttribute("data-user-id");

            console.log(userIdForChange)

            var userEmail = document.getElementById("Email-Change-" + userIdForChange).value;
            var userPassword = document.getElementById("MatKhau-Change-" + userIdForChange).value;
            var userAddress = document.getElementById("DiaChi-Change-" + userIdForChange).value;
            var userTel = document.getElementById("SoDienThoai-Change-" + userIdForChange).value;
            var userName = document.getElementById("HoVaTen-Change-" + userIdForChange).value;
            var userGender = document.getElementById("GioiTinh-Change-" + userIdForChange).value;
            var userPicSrc = document.getElementById("AvtKhachHang-Change-" + userIdForChange).value;
            var userAth = document.getElementById("PhanQuyen-Change-" + userIdForChange).value;

            console.log("Email: ", userEmail);
            console.log("Password: ", userPassword);
            console.log("Address: ", userAddress);
            console.log("Tel: ", userTel);
            console.log("Name: ", userName);
            console.log("Gender: ", userGender);
            console.log("Pic Src: ", userPicSrc);
            console.log("Auth: ", userAth);

            var modalUserEmail = document.querySelector("#email-input");
            var modalUserPassword = document.querySelector("#password-input");
            var modalUserAddress = document.querySelector("#address_input");
            var modalUserTel = document.querySelector("#tel_input");
            var modalUserName = document.querySelector("#name_input");
            var modalUserGender = document.querySelector("#GenderSelect");
            var modalUserPic = document.querySelector(".food-pic");
            var modalUserAuth = document.querySelector("#PhanQuyen");

            modalUserEmail.innerText = userEmail;
            modalUserPassword.innerText = userPassword;
            modalUserAddress.innerText = userAddress;
            modalUserTel.innerText = userTel;
            modalUserName.innerText = userName;
            modalUserGender.innerText = userGender;
            modalUserPic.src = userPicSrc;
            modalUserAuth.innerText = userAth;

            console.log("Đây là userAth:" + modalUserAuth)

            // Đặt các giá trị vào các thẻ HTML tương ứng
            document.getElementById("user-id").value = userIdForChange;
            document.getElementById("PhanQuyen").value = ""; // Thêm phần cập nhật quyền của người dùng nếu cần
            document.querySelector(".food-pic").src = userPicSrc;
        }
    });
}

function changeContent(labelId, button) {
    var label = document.getElementById(labelId);
    var confirmButton = document.getElementById(labelId + '-confirm-button');

    var input = document.createElement('input');
    input.setAttribute('type', 'text');
    input.setAttribute('value', label.textContent);
    input.setAttribute('id', labelId);
    input.setAttribute('name', labelId);

    label.parentNode.replaceChild(input, label);
    confirmButton.style.display = 'block';

    // Tắt nút "Thay đổi" sau khi đã thay đổi nội dung
    button.disabled = true;
    button.style.display = 'none';
}

// Gắn sự kiện click cho nút hủy trong modal
document.querySelector(".changeUser-close-icon").addEventListener("click", function () {
    document.querySelector(".changeUser_modal_overlay").classList.remove("active");
});

// Gắn sự kiện click cho nút "hủy" trong modal
document.querySelector("#changeUser-close-button").addEventListener("click",function (){
    document.querySelector(".changeUser_modal_overlay").classList.remove("active")
});

function replaceWithSelect(labelId) {
    var label = document.getElementById(labelId);
    var currentValue = label.textContent.trim();

    var select = document.createElement('select');
    select.setAttribute('id', labelId);
    select.setAttribute('onchange', 'updateLabel(this)');

    var option1 = document.createElement('option');
    option1.text = 'Nam';
    option1.value = 'Nam';
    var option2 = document.createElement('option');
    option2.text = 'Nữ';
    option2.value = 'Nữ';

    select.appendChild(option1);
    select.appendChild(option2);

    label.parentNode.replaceChild(select, label);

    // Chọn giá trị hiện tại
    select.value = currentValue;
}

function updateLabel(select) {
    var labelId = select.id;
    var label = document.getElementById(labelId);
    label.textContent = select.value;
}


//popup delete user

// Biến trạng thái cho biết liệu modal có nên hiển thị hay không
var isDeleteUserModalVisible = false;
var deleteUserButton = document.getElementById("deleteUser");
var userWrappers = document.querySelectorAll(".wrapper");

// Gắn sự kiện click cho nút xóa
deleteUserButton.addEventListener("click", function () {
    isDeleteUserModalVisible = true;
    console.log("Chạy được");
});

// Gắn sự kiện click cho các phần tử <a class="wrapper">
for (var i = 0; i < userWrappers.length; i++) {
    userWrappers[i].addEventListener("click", function () {
        console.log("Đang kiểm tra");
        // Kiểm tra biến trạng thái, nếu là true thì hiển thị modal
        if (isDeleteUserModalVisible) {
            // Hiển thị modal body
            var deleteUserModalOverlay = document.querySelector(".deleteUser_modal_overlay");
            deleteUserModalOverlay.classList.add("active");

            // Lấy các thông tin từ phần tử wrapper được click và cập nhật vào modal
            var userName = this.querySelector(".wrapper-info-name").innerText;
            var userDescription = this.querySelector(".wrapper-info-price:nth-child(2)").innerText;
            var userPicSrc = this.querySelector(".wrapper-pic-item").src;

            var modalUserName = document.querySelector(".userName span");
            var modalUserDescription = document.querySelector(".userDescription span");
            var modalUserPic = document.querySelector(".userPic-item");

            modalUserName.innerText = userName;
            modalUserDescription.innerText = userDescription;
            modalUserPic.src = userPicSrc;

            // Lấy giá trị từ data attribute của phần tử wrapper
            var userId = this.getAttribute("data-user-id");

            // Gán giá trị đã lấy được vào hidden input có id là "userId"
            var userIdInput = document.getElementById("userId");
            userIdInput.value = userId;

            console.log(userIdInput);
            console.log("Chạy được");
        }
    });
}

// Gắn sự kiện click cho nút hủy trong modal
document.querySelector(".deleteUser-close-icon").addEventListener("click", function () {
    document.querySelector(".deleteUser_modal_overlay").classList.remove("active");
});
document.querySelector("#deleteUser-close-button").addEventListener("click", function () {
    document.querySelector(".deleteUser_modal_overlay").classList.remove("active");
});
