<section>
    <div class="relative w-full flex items-center">
        <form action="index.php" method="get" class="w-full">
            <input type="hidden" name="page" value="Store_Store">
            <input type="text" id="partialName" name="partialName" placeholder="Search by Name or ID" class="relative w-full px-4 py-2 pl-10 pr-8 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500" value={{partialName}} >

            <div class="absolute inset-y-0 left-0 flex items-center pl-3">
                <svg class="h-6 w-6 my-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-5.2-5.2m2.8 5.2a9 9 0 11-12.727-12.727 9 9 0 1112.727 12.727z" />
                </svg>
            </div>
            <div class="absolute inset-y-0 right-0 flex items-center pr-3">
                <button type="submit" class="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700">
                    Search
                </button>
            </div>
        </form>
    </div>
</section>



<div x-data="{ selectedCategory: 'all' }">
 
    <div class="mb-4">
        <select x-model="selectedCategory" @click.away="isOpen = false" @keydown.escape="isOpen = false" @click="isOpen = !isOpen" class="px-4 py-2 text-black my-4 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500">
            <option value="all">All Categories</option>
            <option value="category1">Subscription</option>
            <option value="category2">Merch</option>
        </select>
    </div>



    <div x-show="selectedCategory === 'all' || selectedCategory === 'category1'">
        <h2 class="text-2xl font-semibold mb-2">Explore Skuull2Canldy Subscriptions</h2>
        <section class="py-12">
            <div class="container mx-auto px-4">
                <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    {{foreach Subscription}}
                    <div x-data="{ showModal: false }" class="bg-white rounded-lg overflow-hidden shadow-md relative rounded shadow-xl transition-transform transform hover:scale-110">
                        <div class="p-6 flex flex-col justify-between">
                            <div>
                                <h3 class="text-4xl text-blue-500 font-semibold mb-2">{{subscription_description}}</h3>
                                <p class="text-gray-600 mb-2">Pay every {{subscription_duration}} days</p>
                                <p class="text-gray-600 mb-2">${{subscription_price}}</p>
                            </div>
                            <div class="mt-4 flex justify-between items-center">
                                <form method="post" action="index.php?page=Store_Store">
                                    <input type="hidden" name="xsxtoken" value="{{~token}}"/>
                                    <input type="hidden" name="type" value="subscription">
                                    <input type="hidden" name="productId" value="{{id_subscription}}">
                                    <input type="hidden" name="productName" value="{{subscription_description}}">
                                    <input type="hidden" name="productDescription" value="{{subscription_duration}}">
                                    <input type="hidden" name="productPrice" value="{{subscription_price}}">
                                    <input type="hidden" name="productQuantity" value=1>
                                <div class="flex flex-wrap mx-2 my-0 justify-around">
                                    <a href="#" class="text-pink-300 hover:text-pink-700 flex items-center my-0" @click="showModal = true">
                                        See more
                                        <svg class="h-5 w-5 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                                        </svg>
                                    </a>
                                    <button type="submit" name="addToCart" class="px-4 my-2 bg-gray-800 hover:bg-pink-700 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700">
                                        Add to Cart
                                    </button>
                                </form>
                                
                                </div>
                            </div>
                        </div>
                        <div x-show="showModal" class="fixed inset-0 z-50 overflow-y-auto" style="display: none;">
                            <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
                                <div class="fixed inset-0 transition-opacity" aria-hidden="true">
                                    <div class="absolute inset-0 bg-gray-500 opacity-75"></div>
                                </div>
                                <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>
                                <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full" role="dialog" aria-modal="true" aria-labelledby="modal-headline">
                                    <div class="px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                                        <div class="sm:flex sm:items-start">
                                            <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
                                                <h3 class="text-xl leading-6 font-medium text-gray-900" id="modal-headline">{{subscription_description}}</h3>
                                                <p class="text-gray-600 mt-2">Pay every {{subscription_duration}} days</p>
                                                <p class="text-gray-700 font-bold">${{subscription_price}}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                                        <button @click="showModal = false" type="button" class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-gray-800 text-base font-medium text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:ml-3 sm:w-auto sm:text-sm">
                                            Close
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    {{endfor Subscription}}
                </div>
            </div>
        </section>
    </div>


    <div x-show="selectedCategory === 'all' || selectedCategory === 'category2'">

        <h2 class="text-2xl font-semibold mb-2">Merch</h2>

        
/***//
<div x-data="paginationData()">
   
    <template x-for="(item, index) in paginatedItems" :key="index">
      
        <div x-text="item"></div>
    </template>
   
    <button @click="prevPage()" :disabled="isFirstPage()">Anterior</button>
    <button @click="nextPage()" :disabled="isLastPage()">Siguiente</button>
</div>



/**/

<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-3 gap-6">
   
    {{foreach products}}
    <div x-data="{ showModal: false, showConfirm: false }" class="bg-white rounded-lg overflow-hidden shadow-md relative h-100">
        <img src="{{productImgUrl}}" alt="Product" class="w-full h-60 object-cover">
        <div class="p-4">
            <h3 class="text-lg text-blue-500 font-semibold mb-2">{{productName}}</h3>
            <p class="text-gray-600 mb-2">{{productDescription}}</p>
            <p class="text-gray-700 font-bold">${{productPrice}}</p>
            <div class="h-20"></div>
        </div>

        <div class="absolute bottom-0 left-0 right-0 bg-white p-4">
            <div class="mt-4 flex justify-between items-center">
                <button @click="showConfirm = true" class="submitBtn text-pink-500">Add to Cart</button>
                <a @click="showModal = true" class="text-green-500 hover:text-green-700">See more</a>
            </div>
        </div>

        <div x-show="showModal || showConfirm" x-transition:enter="transition ease-out duration-300" x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100" x-transition:leave="transition ease-in duration-300" x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0" class="fixed inset-0 z-50 overflow-y-auto" style="display: none;">
            <div class="fixed inset-0 z-50 flex items-center justify-center overflow-auto bg-black bg-opacity-50">
                <div class="bg-white rounded-lg shadow-xl p-8 max-w-2xl mx-auto">
                    <template x-if="showModal">
                        <div class="text-center">
                            <img src="{{productImgUrl}}" alt="Product" class="w-full h-80 object-cover">
                            <h3 class="text-2xl text-pink-500 font-semibold mb-2">{{productName}}</h3>
                            <p class="text-gray-600 mb-2">Reference Code: <span class="text-blue-900 text-1xl">{{productId}}</span></p>
                            <p class="text-gray-600 mb-2">{{productDescription}}</p>
                            <p class="text-gray-700 font-bold text-2xl">${{productPrice}}</p>
                            <p class="text-gray-700 py-2 font-bold">Quantity: <span x-text="quantities[productId] ? quantities[productId] : '1'"></span></p>
                        </div>
                    </template>
                    <template x-if="showConfirm">
                        <div class="text-center">
                            <p class="text-lg text-gray-900">Confirmation of Add to Cart</p>
                            <p class="text-gray-600 mb-2">Are you sure you want to add this product to your cart?</p>
                            <div class="mt-4 flex justify-center">
                                <form method="POST" action="index.php?page=Store_Store">
                                    <input type="hidden" name="xsxtoken" value="{{~token}}"/>
                                    <input type="hidden" name="type" value="product">
                                    <input type="hidden" name="productId" value="{{productId}}">
                                    <input type="hidden" name="productName" value="{{productName}}">
                                    <input type="hidden" name="productDescription" value="{{productDescription}}">
                                    <input type="hidden" name="productPrice" value="{{productPrice}}">
                                    <input type="hidden" name="productQuantity" value="1">
                                    <button type="submit" name="addToCart" class="submitBtn text-pink-500 mr-2">Confirm</button>
                                    <button @click="showConfirm = false" type="button" class="submitBtn text-gray-600">Cancel</button>
                                </form>
                            </div>
                        </div>
                    </template>
                    <div class="text-center mt-4">
                        <button @click="showModal = false; showConfirm = false" type="button" class="inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-gray-800 text-base font-medium text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {{endfor products}}
    
</div>

    </div>

<div>

    <script>
        function paginationData() {
           
            return {
                currentPage: 1,
                itemsPerPage: 4, 
                items: [1,2,3,4,5,6,7,8,9,10,11],
                get totalPages() {
                    return Math.ceil(this.items.length / this.itemsPerPage);
                },
                get paginatedItems() {
                    const startIndex = (this.currentPage - 1) * this.itemsPerPage;
                    const endIndex = startIndex + this.itemsPerPage;
                    return this.items.slice(startIndex, endIndex);
                },
                isFirstPage() {
                    return this.currentPage === 1;
                },
                isLastPage() {
                    return this.currentPage === this.totalPages;
                },
                prevPage() {
                    if (!this.isFirstPage()) {
                        this.currentPage--;
                    }
                },
                nextPage() {
                    if (!this.isLastPage()) {
                        this.currentPage++;
                    }
                }
            };
        }
    </script>