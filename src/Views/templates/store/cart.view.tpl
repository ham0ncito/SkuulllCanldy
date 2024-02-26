{{ifnot ~isEmpty}}
<div class="container mx-auto text-black">
  <div class="mx-auto w-1/2">
      <div class="bg-gray-200 rounded-lg shadow-md p-6">
          <h2 class="text-4xl text-black font-semibold mb-6">Carrito</h2>
          <h2 class="text-2xl text-black font-semibold py-4">Your Carrito Stats</h2>
          <h2 class="text-xl text-pink-500 font-semibold">${{total_products}} In Carrito</h2>
          <h2 class="text-xl text-pink-500 font-semibold">{{quantity}} Products in carrito</h2>
          <h2 class="text-xl text-pink-500 font-semibold"> Products've been here since {{crrfching}} </h2>
          <h2 class="text-xl text-pink-500 font-semibold"> Your Carrito will be remove on   {{crrfchingRemove}} </h2>
          <div class="flex gap-4 justify-center w-full mx-auto">
            <form action="index.php?page=Checkout_Checkout" method="POST" class="w-full mx-auto my-4">
              <button type="submit" class="hover:bg-blue-500 text-gray-900 py-2 px-4 rounded transition duration-300">
                Order
              </button>
            </form>
          
            <form id="carritoForm" method="POST" class="w-full mx-auto my-4">
              <input type="hidden" name="xsx" value="{{token}}">
                <form action="index.php?page=Store_ShoppingCart" method="POST">
                  <button type="submit" name="deleteButton" class="hover:bg-red-500 text-gray-900 py-2 px-4 rounded transition duration-300">Delete my Carrito</button>
                </form>
              
            </form>
          </div>
          
      </div>
   
  </div>
  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-3 mx-auto gap-4 my-6">
      {{foreach products}}
      <div class="relative bg-white text-black rounded-lg overflow-hidden shadow-md w-72 transition duration-300 transform hover:scale-105">
          <div class="pb-14 px-4">
              <div class="py-4">
                  <h3 class="text-3xl text-pink-500 font-semibold mb-2">{{productName}}</h3>
                  <p class="text-gray-600">Added on <span class="text-gray-500"><span class="text-xl font-bold text-blue-500">{{crrfching}}</span></p>
                  <p class="text-gray-600 mb-2">Reference code <span class="text-gray-500"></span></p>
                  <p class="text-gray-700 font-semibold mb-4">Quantity on carrito: {{crrctd}}</p>
                  <p class="text-gray-700 font-semibold mr-4"> Price {{crrprc}}</p>
              </div>
              <div class="flex flex-row absolute bottom-0 left-0 right-0 space-around my-2">
                    <form method="post" action="index.php?page=Store_ShoppingCart&">
                      <input type="hidden" name="xsx" value="{{~token}}">
                        <input name="productName" value ="{{productName}}" hidden></input>
                        <input name ="productId" value ="{{productid}}" hidden></input>
                  <button type="submit" name="deleteItem" class=" px-4 py-2 mx-auto text-red-500 rounded-md hover:bg-pink-200 transition focus:outline-none" value="{{crrfching}}">Delete from Carrito</button>
                </form>
                  <button class="px-4 py-2 mx-auto text-green-500 rounded-md mr-4 hover:bg-green-200 transition">Add More</button>
              </div>
          </div>
      </div>
      {{endfor products}}
  </div>
</div>
{{endifnot ~isEmpty}}
{{if isEmpty}}
{{include components/tarjeta}}{{endif isEmpty}}
