class Review {
  constructor(obj){
    this.rating = obj.rating
    this.content = obj.content
    this.user_name = obj.user_name
    this.id = obj.id
    this.user_id = obj.user_id
  }
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
