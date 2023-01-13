var updateBtns = document.getElementsByClassName('update-cart')

for (i = 0; i < updateBtns.length; i++) {
	updateBtns[i].addEventListener('click', function(){
		var productId = this.dataset.product
		var action = this.dataset.action
		// console.log('productId:', productId, 'Action:', action)
		// console.log('USER:', user)
		console.log($('input[csrfmiddlewaretoken]').val())
		if (user == 'AnonymousUser'){
			addCookieItem(productId, action)
		}else{
			updateUserOrder(productId, action)
		}
	})
}

function updateUserOrder(productId, action){
	console.log('User is authenticated, sending data...')
		var url = '/store/cart_add/'
		obj = {'productId':productId, 'action':action}
		$.ajax({
			url: url,
			type: 'POST',
			headers: { "X-CSRFToken": $.cookie("csrftoken") },
			contentType: 'application/json',
			// data: {
			// 	'productId':productId,
			// 	'action':action,				
			// },
			data:JSON.stringify(obj),
			success: function (data) {
			  console.log(data)
			},
			error: function(data){
				console.log("error");
			  }
		  });
}

function addCookieItem(productId, action){
	console.log('User is not authenticated')

	if (action == 'add'){
		if (cart[productId] == undefined){
		cart[productId] = {'quantity':1}

		}else{
			cart[productId]['quantity'] += 1
		}
	}

	if (action == 'remove'){
		cart[productId]['quantity'] -= 1

		if (cart[productId]['quantity'] <= 0){
			console.log('Item should be deleted')
			delete cart[productId];
		}
	}
	console.log('CART:', cart)
	document.cookie ='cart=' + JSON.stringify(cart) + ";domain=;path=/"
	
	location.reload()
}