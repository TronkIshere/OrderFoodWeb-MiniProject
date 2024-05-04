//popup food detail
function foodInformationPopup(id, tenMon, mieuTa, giaTien, diaChi, hinhAnh) {
    var modalId = "#show-food-detail-" + id;
    var modal = document.querySelector(modalId);
    var modalOverlay = document.querySelector(".modal_overlay");

    document.querySelector('.food-pic').setAttribute('src', hinhAnh);
    document.querySelector('.food-price').innerHTML = '<span>Giá tiền: </span>' + giaTien + 'đ';
    document.querySelector('.food-description').innerHTML = '<span>Mô tả: </span>' + mieuTa;
    document.querySelector('.food-id').setAttribute('value', id);

    modalOverlay.classList.add("active");
}

function submitFormForCart() {
    var foodAmount = document.getElementById('food-amount').innerText;
    document.getElementById('food-amount-input-cart').value = foodAmount;
    document.getElementById('addCartServlet').submit();
}

function submitFormForBill() {
    var foodAmount = document.getElementById('food-amount').innerText;
    document.getElementById('food-amount-input-bill').value = foodAmount;
    document.getElementById('addBillAction').value = 1;
    document.getElementById('addBillServlet').submit();
}

// document.querySelector("#show-food-detail").addEventListener("click",function (){
//     document.querySelector(".modal_overlay").classList.add("active")
// });

document.querySelector(".foodDetail-close-icon").addEventListener("click",function (){
    document.querySelector(".modal_overlay").classList.remove("active")
});

//Food amount
let decreaseBtn = document.getElementById('decrease-btn');
let increaseBtn = document.getElementById('increase-btn');
let foodAmountInput = document.getElementById('food-amount');

let a = 1;

decreaseBtn.addEventListener('click', () => {
    if (a > 1) {
        a--;
        foodAmountInput.innerHTML = a;
        console.log("ok") ;
    }
});

increaseBtn.addEventListener('click', () => {
    a++;
    foodAmountInput.innerHTML = a;
    console.log("ok") ;
});