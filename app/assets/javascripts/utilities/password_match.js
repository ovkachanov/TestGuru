document.addEventListener('turbolinks:load', function() {
  var password_сonfirm_field = document.querySelector('.password-confirmation-field')

  if (password_сonfirm_field) { password_сonfirm_field.addEventListener('input', matchPassword) }
})

function matchPassword() {
  var password = document.getElementById('user_password').value
  var password_confirmation = document.getElementById('user_password_confirmation').value

  if (password == password_confirmation) {
    this.querySelector('.success').classList.remove('hide')
    this.querySelector('.alert').classList.add('hide')
  } else if (password != password_confirmation) {
    this.querySelector('.success').classList.add('hide')
    this.querySelector('.alert').classList.remove('hide')
  } else {
    this.querySelector('.success').classList.add('hide')
    this.querySelector('.alert').classList.add('hide')
  }
}
