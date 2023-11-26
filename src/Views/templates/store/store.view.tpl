<div class="flex items-center justify-between mb-4 mx-8">
    <div class="relative w-full flex items-center">
        <input type="text" id="searchbar" name="searchbar" placeholder="Name or ID" class="w-2/3 px-4 py-2 pl-10 pr-8 border border-gray-300 rounded-md">
        <div class="absolute inset-y-0 left-0 flex items-center pl-3">
            <svg class="h-6 w-5 text-gray-400 mb-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-5.2-5.2m2.8 5.2a9 9 0 11-12.727-12.727 9 9 0 1112.727 12.727z" />
            </svg>
        </div>
        <div class="absolute inset-y-0 right-0 flex items-center pr-3">
            <button id="searchbutton" name="searchbutton" class="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700 mr-2">
                Search
            </button>
        </div>
    </div>
</div>
<div class="mx-4">

    <section class="py-12">
        <div class="container mx-auto px-4">
            <h2 class="text-3xl font-semibold mb-6">Shop your favorite artists' merch</h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                {{foreach Products}}
                <div class="bg-white hover:bg-indigo-300 rounded-lg overflow-hidden shadow-md relative h-100">
                    <img src="{{productImgUrl}}" alt="Product" class="w-full h-48 object-cover">
                    <div class="p-4">
                        <h3 class="text-lg font-semibold mb-2">{{productName}}</h3>
                        <p class="text-gray-600 mb-2">{{productDescription}}</p>
                        <p class="text-gray-700 font-bold">${{productPrice}}</p>
                        <div class="h-20">
                        </div>
                    </div>
                    
                    <div class="absolute bottom-0 left-0 right-0 bg-white p-4">
                        <div class="mt-4 flex justify-between items-center">
                            <form method="post" action="agregar_a_carrito.php">
                                <input type="hidden" name="productId" value="{{productId}}">
                                <input type="hidden" name="productName" value="{{productName}}">
                                <input type="hidden" name="productDescription" value="{{productDescription}}">
                                <input type="hidden" name="productPrice" value="{{productPrice}}">
                                <input type="hidden" name="productQuantity" value=1>
                                <button type="submit" name="addToCart" class="px-4 py-2 bg-gray-800 hover:bg-pink-700 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700">
                                    Add to Carrito
                                </button>
                            </form>
                            <a href="#" class="text-green-500 hover:text-green-700">See more</a>
                        </div>
                    </div>
                </div>
                {{endfor Products}}
            </div>
        </div>


        <div class="container mx-auto px-4">
            <h2 class="text-3xl font-semibold mb-6 py-4">Shop your Skuull2Canldy Subscription</h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                {{foreach Subscription}}
                <div class="bg-white rounded-lg overflow-hidden shadow-md relative">
                    <div class="p-6 flex flex-col justify-between">
                        <div>
                            <h3 class="text-4xl font-semibold mb-2">{{subscription_description}}</h3>
                            <p class="text-blue-500 mb-2 overflow-hidden overflow-ellipsis">{{id_subscription}}</p>
                            <p class="text-gray-600 mb-2">Pay every {{subscription_duration}} days</p>
                            <p class="text-gray-700 font-bold">${{subscription_price}}</p>
                        </div>
                        <div class="mt-4 flex justify-between items-center">
                            <form method="post" action="agregar_a_carrito.php">
                                <input type="hidden" name="productId" value="{{id_subscription}}">
                                <input type="hidden" name="productName" value="{{subscription_description}}">
                                <input type="hidden" name="productDescription" value="{{subscription_duration}}">
                                <input type="hidden" name="productPrice" value="{{subscription_price}}">
                                <input type="hidden" name="productQuantity" value=1>
                                <button type="submit" name="addToCart" class="px-4 py-2 bg-gray-800 hover:bg-pink-700 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700">
                                    Add to Carrito
                                </button>
                            </form>
                            <a href="#" class="text-green-500 hover:text-green-700 flex items-center">
                                See more
                                <svg class="h-5 w-5 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>
                {{endfor Subscription}}
            </div>
        </div>
        
        </div>
    </section>
</div>