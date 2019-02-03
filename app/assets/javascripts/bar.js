$(function(){
  console.log('bar.js loaded')
  listener()
})

function listener(){
  $('.full-rev').on('click', function(e){
    e.preventDefault()
    let id = $(this).data('id')
    $.get('/reviews/'+ id +'.json', function(data){
      $(`#review-cell-`+ id).text(data.content)
    })
  })
}
