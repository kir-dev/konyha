const burger = document.querySelector('#burger')
const menu = document.querySelector('#menu')
const closeNotice = document.querySelector('#close-notice')
const notice = document.querySelector('#notice')

burger.addEventListener('click', (e) => {
  if (menu.classList.contains('hidden')) {
    menu.classList.remove('hidden')
  } else {
    menu.classList.add('hidden')
  }
})

if (notice) {
  closeNotice.addEventListener('click', (e) => {
    notice.classList.add('hidden')
  })
}
