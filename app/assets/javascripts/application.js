//= require rails-ujs

document.body.addEventListener("click", (e) => {
  let el = e.target
  if (el.classList.contains("add_fields")) {
    e.preventDefault()
    let receiptFields = document.getElementById("receipt-items")
    time = new Date().getTime()
    regexp = new RegExp(el.dataset.id, 'g')
    receiptFields.insertAdjacentHTML("beforeend", el.dataset.fields.replace(regexp, time))
  }
}, false)

document.body.addEventListener("click", (e) => {
  let el = e.target
  if (el.classList.contains("remove_fields")) {
    e.preventDefault()
    el.previousElementSibling.value = 1
    el.closest("fieldset").style.display = "none"
  }
}, false)
