const burger = document.querySelector('#burger')
const menu = document.querySelector('#menu')
const closeNotice = document.querySelector('#close-notice')
const closeErrors = document.querySelector('#close-errors')
const notice = document.querySelector('#notice')
const errors = document.querySelector('#errors')

burger.addEventListener('click', (e) => {
  if (menu.classList.contains('hidden')) {
    menu.classList.remove('hidden')
  } else {
    menu.classList.add('hidden')
  }
})

if (closeNotice) {
  closeNotice.addEventListener('click', (e) => {
    notice.classList.add('hidden')
  })
}

if (closeErrors) {
  closeErrors.addEventListener('click', (e) => {
    errors.classList.add('hidden')
  })
}
