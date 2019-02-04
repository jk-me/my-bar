$(function(){
  console.log('bar.js loaded')
  fullReview()
})

function fullReview(){
  $('.full-rev').on('click', function(e){
    e.preventDefault()
    // if (e.preventDefault) {console.log('prevented')}

    let id = $(this).data('id')
    // debugger
    $.get('/reviews/'+ id , function(data){
      $(`#review-cell-`+ id).text(data.content)
      $(`#review-cell-`+ id).append(
      `<a class="short-rev" data-id=${id} href="#">See Less</a>`)
      miniReview()
    })
  })
}

function miniReview(){
  // debugger
  $('.short-rev').on('click', function(e){
    e.preventDefault()
    // if (e.preventDefault) {console.log('prevented')}
    let id = $(this).data('id')
    $.get('/reviews/'+ id , function(data){
      $(`#review-cell-`+ id).text(data.content.substring(0,31))
      $(`#review-cell-`+ id).append(
      `<a class="full-rev" data-id=${id} href="#">See More</a>`)
      fullReview()

    })
  })
}
