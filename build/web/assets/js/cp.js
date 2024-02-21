(function() {
    const ipnElement = document.querySelector('#ipnPassword');
    const btnElement = document.querySelector('#btnPassword');
  
    btnElement.addEventListener('click', function() {
      togglePasswordVisibility(ipnElement);
    });
  
    const ipnNewPassword = document.querySelector('#ipnNewPassword');
    const btnNewPassword = document.querySelector('#btnNewPassword');
  
    btnNewPassword.addEventListener('click', function() {
      togglePasswordVisibility(ipnNewPassword);
    });
  
    const ipnReNewPassword = document.querySelector('#ipnReNewPassword');
    const btnReNewPassword = document.querySelector('#btnReNewPassword');
  
    btnReNewPassword.addEventListener('click', function() {
      togglePasswordVisibility(ipnReNewPassword);
    });
  
    // Bắt sự kiện khi nhập liệu vào cả hai trường mật khẩu mới
    ipnNewPassword.addEventListener('input', validatePasswords);
    ipnReNewPassword.addEventListener('input', validatePasswords);
  
    // Hàm kiểm tra và hiển thị thông báo
    function validatePasswords() {
      const pass1 = ipnNewPassword.value;
      const pass2 = ipnReNewPassword.value;
      const matchingMessage = document.querySelector('#matchingMessage');
  
      if ((pass1 !== pass2 && pass1 !== '' && pass2 !== '') || (pass1 === '' && pass2 === '')) {
        matchingMessage.innerHTML = 'Passwords do not match!';
        matchingMessage.style.color = 'red';
      } else {
        matchingMessage.innerHTML = pass1 !== '' && pass2 !== '' ? 'Passwords match!' : '';
        matchingMessage.style.color = 'green';
      }
    }
  
    // Hàm mở/ẩn mật khẩu
    function togglePasswordVisibility(inputField) {
      const currentType = inputField.getAttribute('type');
      inputField.setAttribute('type', currentType === 'password' ? 'text' : 'password');
    }
  })();
  