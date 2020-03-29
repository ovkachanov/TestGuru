document.addEventListener('turbolinks:load', function () {
    var control = document.querySelector('.next')
    if (control) { control.addEventListener('click', progressOutput()) }
})

function progressOutput() {
    var progress = document.querySelector('.success').dataset.progress
    
    document.querySelector('.success').style.width = progress + '%'
}
