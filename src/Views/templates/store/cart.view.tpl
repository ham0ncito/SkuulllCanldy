<div class="container mx-auto p-6">
    <h1 class="text-3xl font-semibold mb-6">Carrito</h1>

    <!-- Lista de productos -->
    <ul class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
        <!-- Elemento de la lista por cada producto -->
        <!-- Producto 1 -->
        <li class="bg-white rounded-lg overflow-hidden shadow-md">
            <div class="p-4">
                <img src="URL_DE_LA_IMAGEN" alt="Nombre del Producto" class="w-full h-48 object-cover mb-4">
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
        <!-- Repite este bloque para cada producto -->
    </ul>
</div>