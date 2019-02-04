$(function(){
  console.log('bar.js loaded')
  fullReview()
})

function fullReview(){
  $('.full-rev').on('click', function(e){
    e.preventDefault()
    let id = $(this).data('id')
    $.get('/reviews/'+ id , function(data){
      $(`#review-cell-`+ id).text(data.content)
      $(`#review-cell-`+ id).append(
      ` <a class="short-rev" data-id=${id} href="#">See Less</a>`)
      miniReview()
    })
  })
}

function miniReview(){
  $('.short-rev').on('click', function(e){
    e.preventDefault()
    let id = $(this).data('id')
    $.get('/reviews/'+ id , function(data){
      $(`#review-cell-`+ id).text(data.content.substring(0,27) + '...')
      $(`#review-cell-`+ id).append(
      ` <a class="full-rev" data-id=${id} href="#">See More</a>`)
      fullReview()
    })
  })
}
