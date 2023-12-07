<div class="container mx-auto p-6">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
       
        <div class="bg-white rounded-lg shadow-md p-6">
            <h2 class="text-4xl text-black font-semibold mb-6">Carrito</h2>
            <h2 class="text-2xl text-black font-semibold py-4">Your Carrito Stats</h2>
            <h2 class="text-1xl text-pink-500 font-semibold">${{total_products}} In Carrito</h2>
            <h2 class="text-1xl text-pink-500 font-semibold">{{quantity}} Products in carrito</h2>
            <h2 class="text-1xl text-pink-500 font-semibold"> Products've been here since {{crrfching}} </h2>
            <h2 class="text-1xl text-pink-500 font-semibold"> Your Carrito will be remove on   {{crrfchingRemove}} </h2>
            <form id="carritoForm" method="POST" class="w-full mx-auto my-4">
                <input type="hidden" name="xsx" value="{{token}}">
                <div class="flex gap-4">
                    
                    <div id="smart-button-container">
      <div style="text-align: center;">
        <div id="paypal-button-container"></div>
      </div>
    </div>
  <script src="https://www.paypal.com/sdk/js?client-id=test&currency=USD" data-sdk-integration-source="button-factory"></script>
  <script>
    function initPayPalButton() {
      paypal.Buttons({
        style: {
          shape: 'rect',
          color: 'gold',
          layout: 'vertical',
          label: 'pay',

        },

        createOrder: function(data, actions) {
          return actions.order.create({
            purchase_units: [{"description":"LA DESCRIPCION DE TU PRODUCTO","amount":{"currency_code":"USD","value":13}}]
          });
        },

        onApprove: function(data, actions) {
          return actions.order.capture().then(function(orderData) {

            // Full available details
            console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));
 
actions.redirect('LA URL DE TU PAGINA DE GRACIAS');

          });
        },

        onError: function(err) {
          console.log(err);
        }
      }).render('#paypal-button-container');
    }
    initPayPalButton();
  </script>

                    
                    <button type="button" name="deleteButton" class=" text-red-500 font-bold py-2 px-4 rounded">Delete my Carrito</button>
                </div>
            </form>  
        </div>
    
        <div class="relative">
            <div class="bg-gray-900 relative overflow-hidden rounded-lg shadow-md">
                <img class="w-full h-full object-cover rounded-lg" src="https://th.bing.com/th/id/R.4513686c52760775de117b23d472f1b6?rik=hjFjAWSVauQJXQ&riu=http%3a%2f%2f24.media.tumblr.com%2ftumblr_leho1a7oSK1qf8433o1_400.gif&ehk=EwrtGsmUnU3zVykJUi5pQbuYlJzBofwMZAuQUVirA%2fQ%3d&risl=&pid=ImgRaw&r=0" alt="GIF de fondo">
                <div class="absolute inset-0 bg-black opacity-75 rounded-lg"></div>
                <div class="text-white text-center absolute inset-0 flex flex-col justify-center items-center">
                    <h1 class="text-4xl md:text-6xl lg:text-7xl font-bold tracking-wide mt-24 md:mt-32 lg:mt-40">PAY PAY FASHION BABY</h1>
                </div>
            </div>
        </div>
    </div>
      
      <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 py-6">
    {{foreach products}}
    <div class="relative bg-white rounded-lg overflow-hidden shadow-md w-72">
        <div class="pb-14 px-4">
            <div class="py-4">   <h3 class="text-3xl text-pink-500 font-semibold mb-2">{{productName}}</h3>
                <p class="text-gray-600">Added on <span class="text-gray-500">Added on <span class="text-1xl text-bold text-blue-500">{{crrfching}}</span></p>
                <p class="text-gray-600 mb-2">Reference code <span class="text-gray-500">{{productid}}</span></p>
                <p class="text-gray-700 font-semibold mb-4">Quantity on carrito: {{crrctd}}</p>
                <p class="text-gray-700 font-semibold mr-4"> Price {{crrprc}}</p></div>
          
            <div class="flex flex-row absolute bottom-0 left-0 right-0 space-around my-2">
                    <button class="px-4 py-2 mx-auto text-red-500 rounded-md hover:bg-pink-200 transition focus:outline-none">
                        Delete from carrito
                    </button>
                    <button class="px-4 py-2 mx-auto  text-green-500 rounded-md mr-4 hover:bg-green-200 transition">Add More</button>
             
            </div>
        </div>
    </div>
    
    {{endfor products}}
    </div>

 
</div>
