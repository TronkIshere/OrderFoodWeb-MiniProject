//popup add food
document.querySelector("#addFood").addEventListener("click",function (){
    document.querySelector(".addFood_modal_overlay").classList.add("active")
});
document.querySelector(".addFood-close-icon").addEventListener("click",function (){
    document.querySelector(".addFood_modal_overlay").classList.remove("active")
});
document.querySelector("#addFood-close-button").addEventListener("click",function (){
    document.querySelector(".addFood_modal_overlay").classList.remove("active")
});

//popup change food
// Biến trạng thái cho biết liệu modal có nên hiển thị hay không
var isChangeFoodModalVisible = false;
var changeFoodButton = document.getElementById("changeFood");
var foodWrappers = document.querySelectorAll(".wrapper");

// Gắn sự kiện click cho nút chỉnh sửa món ăn
changeFoodButton.addEventListener("click", function() {
    // Nếu modal đang hiển thị, tắt chức năng chỉnh sửa món ăn
    if (isChangeFoodModalVisible) {
        isChangeFoodModalVisible = false;
        console.log("Đã tắt chức năng chỉnh sửa món ăn");
    } else {
        // Nếu modal chưa hiển thị, mở modal và kích hoạt chức năng chỉnh sửa món ăn
        isChangeFoodModalVisible = true;
        isDeleteFoodModalVisible = false;
        console.log("Đã mở chức năng chỉnh sửa món ăn");
    }
});

// Gắn sự kiện click cho các phần tử <a class="wrapper">
for (var i = 0; i < foodWrappers.length; i++) {
    foodWrappers[i].addEventListener("click", function() {
        console.log("Đang kiểm tra");
        // Kiểm tra biến trạng thái, nếu là true thì hiển thị modal
        if (isChangeFoodModalVisible) {
            // Hiển thị modal body
            var changeFoodModalOverlay = document.querySelector(".changeFood_modal_overlay");
            changeFoodModalOverlay.classList.add("active");

            var foodIdForChange = this.getAttribute("data-food-id");

            // Lấy ra các giá trị từ các input hidden
            var foodId = document.getElementById("idMonAn-Change-"+foodIdForChange).value;
            var foodName = document.getElementById("TenMon-Change-"+foodIdForChange).value;
            var foodDescription = document.getElementById("MieuTa-Change-"+foodIdForChange).value;
            var foodPrice = document.getElementById("GiaTien-Change-"+foodIdForChange).value;
            var foodAddress = document.getElementById("DiaChi-Change-"+foodIdForChange).value;
            var foodImage = document.getElementById("HinhAnh-Change-"+foodIdForChange).value;

            console.log("Food ID:", foodId);
            console.log("Food Name:", foodName);
            console.log("Food Description:", foodDescription);
            console.log("Food Price:", foodPrice);
            console.log("Food Address:", foodAddress);
            console.log("Food Image:", foodImage);


            // Đặt các giá trị vào các thẻ HTML tương ứng
            document.getElementById("food-id").value = foodId;
            document.getElementById("address-text-foodname").innerText = foodName;
            document.getElementById("address-text-fooddesc").innerText = foodDescription;
            document.getElementById("address-text-price").innerText = foodPrice;
            document.getElementById("address-text").innerText = foodAddress;
            document.querySelector(".food-pic").src = foodImage;
        }
    });
}

// Gắn sự kiện click cho nút hủy trong modal
document.querySelector(".changeFood-close-icon").addEventListener("click", function() {
    document.querySelector(".changeFood_modal_overlay").classList.remove("active");
});

document.querySelector("#changeFood-close-button").addEventListener("click", function() {
    document.querySelector(".changeFood_modal_overlay").classList.remove("active");
});


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

//popup detele food
// Biến trạng thái cho biết liệu modal có nên hiển thị hay không
var isDeleteFoodModalVisible = false;
var deleteFoodButton = document.getElementById("deleteFood");
var foodWrappers = document.querySelectorAll(".wrapper");

// Gắn sự kiện click cho nút xóa món ăn
deleteFoodButton.addEventListener("click", function() {
    // Nếu modal đang hiển thị, tắt chức năng xóa món ăn
    if (isDeleteFoodModalVisible) {
        isDeleteFoodModalVisible = false;
        console.log("Đã tắt chức năng xóa món ăn");
    } else {
        // Nếu modal chưa hiển thị, mở modal và kích hoạt chức năng xóa món ăn
        isDeleteFoodModalVisible = true;
        isChangeFoodModalVisible = false;
        console.log("Đã mở chức năng xóa món ăn");
    }
});

// Gắn sự kiện click cho các phần tử <a class="wrapper">
for (var i = 0; i < foodWrappers.length; i++) {
    foodWrappers[i].addEventListener("click", function() {
        console.log("Đang kiểm tra");
        // Kiểm tra biến trạng thái, nếu là true thì hiển thị modal
        if (isDeleteFoodModalVisible) {
            // Hiển thị modal body
            var deleteFoodModalOverlay = document.querySelector(".deleteFood_modal_overlay");
            deleteFoodModalOverlay.classList.add("active");

            // Lấy các thông tin từ phần tử wrapper được click và cập nhật vào modal
            var foodName = this.querySelector(".wrapper-info-name span").innerText;
            var foodDescription = this.querySelector(".wrapper-info-description").innerText;
            var foodPrice = this.querySelector(".wrapper-info-price").innerText;
            var foodPicSrc = this.querySelector(".wrapper-pic-item").src;

            var modalFoodName = document.querySelector(".foodName span");
            var modalFoodDescription = document.querySelector(".foodDescription span");
            var modalFoodPrice = document.querySelector(".foodPrice span");
            var modalFoodPic = document.querySelector(".foodPic-item");

            modalFoodName.innerText = foodName;
            modalFoodDescription.innerText = foodDescription;
            modalFoodPrice.innerText = foodPrice;
            modalFoodPic.src = foodPicSrc;

            // Lấy giá trị từ data attribute của phần tử wrapper
            var foodId = this.getAttribute("data-food-id");

            // Gán giá trị đã lấy được vào hidden input có id là "foodId"
            var foodIdInput = document.getElementById("foodId");
            foodIdInput.value = foodId;

            console.log(foodIdInput)
            console.log("Chạy được");
        }
    });
}

// Gắn sự kiện click cho nút hủy trong modal
document.querySelector(".deleteFood-close-icon").addEventListener("click", function() {
    document.querySelector(".deleteFood_modal_overlay").classList.remove("active");
});

document.querySelector("#deleteFood-close-button").addEventListener("click", function() {
    document.querySelector(".deleteFood_modal_overlay").classList.remove("active");
});


