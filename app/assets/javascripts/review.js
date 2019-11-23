class Review {
  constructor(obj){
    this.rating = obj.rating
    this.content = obj.content
    this.user_name = obj.user_name
    this.id = obj.id
    this.user_id = obj.user_id
    this.drink_id = obj.drink_id
  }
  //
  // trHTML(){     //same result as prototype method
  //   let cont = this.content.substring(0,27)
  //   let html = `  <tr>
  //     <td>${this.rating}/5</td>
  //     <td id='review-cell-${this.id}'> ${cont}`
  //     if (cont.length < this.content.length){
  //       html += `... <a class="full-rev" data-id="${this.id}" href="#">See More</a>`
  //     }
  //   html += `
  //     </td>
  //     <td class='td-user' data-id='${this.user_id}' data-rev='${this.id}'>${this.user_name}
  //     </td>
  //   </tr>`//add links to edit/delete in nextDrink listener in bar.js
  //   return html
  // }
}

Review.prototype.trHTML = function(){
  let cont = this.content.substring(0,27)
  let html = `  <tr>
    <td>${this.rating}/5</td>
    <td id='review-cell-${this.id}'> ${cont}`
    if (cont.length < this.content.length){
      html += `... <a class="full-rev" data-id="${this.id}" href="#">See More</a>`
    }
  html += `
    </td>
    <td class='td-user' data-id='${this.user_id}' data-rev='${this.id}'>${this.user_name}
    </td>
  </tr>`//add links to edit/delete in nextDrink listener in bar.js
  return html
}

Review.prototype.formHTML = function(){
  let html = `
    <form class="new_review" id="new_review" action="/reviews" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓">

      <label for="review_rating">Rating (out of 5)</label>
      <select name="review[rating]" id="review_rating"><option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option></select> <br>

      <label for="review_content">Content</label> <br>
      <textarea name="review[content]" id="review_content" class="form-input"></textarea> <br>

      <input value="${this.user_id}" type="hidden" name="review[user_id]" id="review_user_id">
      <input value="${this.drink_id}" type="hidden" name="review[drink_id]" id="review_drink_id">

      <input type="submit" name="commit" class="btn btn-secondary" value="Create Review" data-disable-with="Create Review""">
    </form>
    `
  return html
}
