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

function validateForm() {
    var confirmButton = document.getElementById('confirm-button');
    if (confirmButton.style.display === 'block') {
        return true;
    }
    else {
        return false;
    }
}

document.getElementById('img-file').addEventListener('change', function() {
    document.getElementById('img-file-confirm-button').style.display = 'block';
});