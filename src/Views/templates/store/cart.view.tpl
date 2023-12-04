<div class="container mx-auto p-6">
    <h1 class="text-3xl font-semibold mb-6">Carrito</h1>
    <div class="bg-gray-900 relative overflow-hidden ">
        <img class="absolute w-full h-full object-cover" src="https://th.bing.com/th/id/R.4513686c52760775de117b23d472f1b6?rik=hjFjAWSVauQJXQ&riu=http%3a%2f%2f24.media.tumblr.com%2ftumblr_leho1a7oSK1qf8433o1_400.gif&ehk=EwrtGsmUnU3zVykJUi5pQbuYlJzBofwMZAuQUVirA%2fQ%3d&risl=&pid=ImgRaw&r=0" alt="GIF de fondo">
        <div class="absolute inset-0 bg-black opacity-75"></div>
        <div class="text-white text-center z-10 relative">
          <h1 class="text-4xl md:text-6xl lg:text-7xl font-bold tracking-wide mt-24 md:mt-32 lg:mt-40">PAY PAY FASHION BABY</h1>
        </div>
      </div>
      
    <ul class="grid my-4 grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
      
        <li class="bg-white rounded-lg overflow-hidden shadow-md">
            <div class="p-4">
                <h3 class="text-lg font-semibold mb-2">Nombre del Producto</h3>
                <p class="text-gray-600 mb-2">Descripción del Producto</p>
                <p class="text-gray-700 font-bold">Precio: $XX.XX</p>
                <div class="mt-4 flex justify-between items-center">
                    <a href="#" class="text-green-500 hover:text-green-700">Add</a>
                    <p class="text-gray-700 font-bold">2</p>
                    <a href="#" class="text-green-500 hover:text-green-700">Remove</a>
                    <button class="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700">
                        Delete from carrito
                    </button>
                </div>
            </div>
        </li>
        
    </ul>

    <div id="paypal-button-container"></div>
    <p id="result-message"></p>
    <script src="https://www.paypal.com/sdk/js?client-id=Acj_gVlStbcPSVckLdSVIZdJyxUAAjMMWR_NJQzbwU4TSqsm5rNdRlBv4vmie_4Z64W6dEnQCJD-ebXS&components=buttons&enable-funding=paylater,venmo,card" data-sdk-integration-source="integrationbuilder_sc"></script>
    <script src="app.js"></script>
</div>