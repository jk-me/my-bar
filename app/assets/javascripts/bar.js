$(function(){
  console.log('bar.js loaded')
  listener()
})

function listener(){
  $('.full-rev').on('click', function(e){
    e.preventDefault()
    alert(`id is ${$(this).data('id')}`)
  })
}
