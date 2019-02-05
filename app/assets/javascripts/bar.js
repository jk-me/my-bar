$(function(){
  console.log('bar.js loaded')
  fullReview()
  displayDrink()
  nextDrink()
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

function displayDrink(){
  $('.d-disp').on('click', function(e){
    e.preventDefault()
    let id = $(this).data('id')
    $.get('/drinks/'+ id +'.json' , function(data){
      // debugger
      let html = `
        <h5>${data.name}</h5>
        <p>Description: ${data.description}</p>
      `
      for (let i=0 ; i<data.ingredients.length ; i++ ){
        html += `<p>${data.drinks_ingredients[i].parts} parts ${data.ingredients[i].name}</p>`
      }
      html += `<a href='/drinks/${data.id}'>See More Info </a>`
      $('#drink-display').html(html)
    })
  })
}

function nextDrink(){
  $('.js-next').on('click', function(e){
    e.preventDefault()
    let ingId = $(this).data('id')
    let nest = $(this).data('nest')
    // debugger
    let nextIndex = parseInt($(this).attr("data-index")) + 1
    $.get("/"+ nest +"/"+ ingId + ".json", function(ingred) {
      $.get('/'+ nest +'/' + ingId + '/drinks/' + ingred.drinks[nextIndex].id + '.json', function(drink){
        if (ingred.drinks[nextIndex + 1])
          {$('.js-next').attr("data-index", nextIndex)}
        else {$('.js-next').remove()}
        $('#d-name').text(drink.name)
        $('#d-desc').text(drink.desc)
        $('#edit-d').attr("href", '/drinks/'+ drink.id +'/edit' )
        $('#del-d').attr("href",'/drinks/' + drink.id )
        $('#add-rev').attr("href",'/drinks/'+ drink.id + '/reviews/new' )
        let html = ''
        for (let i=0 ; i<drink.ingredients.length ; i++ ){
          html += `<p>${drink.drinks_ingredients[i].parts} parts <a href="/ingredients/${drink.ingredients[i].id}"> ${drink.ingredients[i].name}</a></p>`
        }
        $('#d-ings').html(html)
        let revHTML = ''
        for (const rev of drink.reviews){

        }
        $('#review-tr').html()
      })
    })
  })
}

class Review {
  constructor(obj){
    this.rating = obj.rating
    this.content = obj.content
    this.user_name = obj.user_name
    this.id = obj.id
    this.user_id = obj.user_id
  }
}
