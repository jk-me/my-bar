$(function(){
  console.log('bar.js loaded')
  fullReview()
  displayDrink()
  nextDrink()
  submitRev()
  revForm()
  alphabetize()
})

function alphabetize(){
  $('.alphabetize').on('click', function(e){
    $.get('/drinks.json', function(data){
      data.sort(function(a, b){
        var x = a.name.toLowerCase();
        var y = b.name.toLowerCase();
        if (x < y) {return -1;}
        if (x > y) {return 1;}
        return 0;
      });
      let drinkHtml =''
      for (const drink of data){
        drinkHtml += `<p> <a href="/drinks/${drink.id}">${drink.name}</a> - <a class="d-disp" data-id="${drink.id}" href="#">Quick View</a>
        </p>`
      }
      $('.drink_list').html(drinkHtml)
    })
  })
  displayDrink()
}

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
    // let id = this.dataset.id
    $.get('/drinks/'+ id, function(data){
      let html = `
        <h5>${data.name}</h5>
        <p>Description: ${data.description}</p>
      `
      for (let i=0 ; i<data.ingredients.length ; i++ ){
        html += `<p>${data.drinks_ingredients[i].parts} parts ${data.ingredients[i].name}</p>`
      }
      // html += `<a href='/drinks/${data.id}'>See More Info </a>`
      $('#drink-display').html(html)
    }, 'json')
  })
}

function nextDrink(){
  $('.js-next').on('click', function(e){
    e.preventDefault()
    let nest = $(this).data('nest')
    let route1
    let route2
    let nextIndex = parseInt($(this).attr("data-index")) + 1
    let nestId
    if ($(this).data('nest')){
      nestId = $(this).data('id')
      route1 = `/${nest}/${nestId}.json`
    }
    else{
      route1 = `/drinks.json`
      // route2 = `/drinks/${nextIndex}.json`
    }
    $.get(route1, function(nestData) {
      if (nest){
        route2 = `/${nest}/${nestId}/drinks/${nestData.drinks[nextIndex].id}.json`
      }
      else{ route2 = `/drinks/${nestData[nextIndex].id}.json` }
      // debugger
      $.get(route2, function(drink){
        if (nest){
          if (nestData.drinks[nextIndex + 1]){
            $('.js-next').attr("data-index", nextIndex)
          }
          else {$('.js-next').remove()}
        }
        else{
          if (nestData[nextIndex + 1]){
            $('.js-next').attr("data-index", nextIndex)
          }
          else {$('.js-next').remove()}
        }
        // debugger
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
          let n = new Review(rev)
          revHTML += n.trHTML()
        }
        $('tbody').html(revHTML)

        $.get('/current_id', function(result){
          for (const el of $('.td-user')){
            if (parseInt(el.dataset.id) === result.id){
              el.innerHTML += `<p><a href="/reviews/${el.dataset.rev}/edit">Edit</a>  | <a rel="nofollow" data-method="delete" href="/reviews/${el.dataset.rev}">Delete</a></p>`
            }
          }
        })

        fullReview()
      })
    })
  })
}

function revForm(){
  $('#add-rev').on('click', function(e){
    e.preventDefault()
    let drink_id = $(this).data('id')
    $.get('/current_id', function(result){
      let data = {user_id:result.id, drink_id: drink_id}
      let rev = new Review(data)
      let formHTML = rev.formHTML()
      $('.rev-form').html(formHTML)
      submitRev()
    })
  })
}

function submitRev(){
  $('form.new_review').on('submit',function(e){
    e.preventDefault();
    $.ajax({
           type: "POST",
           url: '/reviews',
           data: $(this).serialize(), // serializes the form's elements.
           dataType: 'json'
    }).done(function(data) {   //post done, handle returned json of new review
        let n = new Review(data)
        let revHTML = n.trHTML()
        $('tbody').append(revHTML)   //append new row to table
        let user = $('.td-user')[$('.td-user').length - 1] //select from newly added rows
        let userID = user.dataset.id
        user.innerHTML += `<p><a href="/reviews/${user.dataset.rev}/edit">Edit</a>  | <a rel="nofollow" data-method="delete" href="/reviews/${user.dataset.rev}">Delete</a></p>`
        $('.rev-form').empty()
    })
  })
}
