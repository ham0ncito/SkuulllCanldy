<div class="flex items-center justify-between mb-4 mx-4">
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
			<a href="index.php?page=Artists_Artists&mode=INS" class="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700">
                Insert
            </a>
        </div>
    </div>
</div>

<div class="mt-20">
    <section class="mx-4">
        <h2 class="text-2xl font-bold mb-4">PRODUCTS</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 pb-10">
            {{foreach products}}
            <div class="relative bg-gray-900 border border-gray-300 rounded p-4 overflow-hidden">
                <img src="{{productImgUrl}}" alt="{{productName}}" class="w-full h-48 object-cover">
                <a href="index.php?page=Productss_Productss&mode=DSP&productId={{productId}}" class="flex flex-col items-center h-full">
                    <h3 class="text-xl font-bold mb-2 text-white">{{productName}}</h3>
                    <p class="text-gray-600 mb-2">{{productDescription}}</p>
                    <p class="text-gray-700 font-bold">{{productPrice}}</p>
                    <div class="h-10"></div>
                    <div class="absolute bottom-0 left-0 right-0 flex justify-center p-4">
                        <a href="index.php?page=Productss_Productss&mode=UPD&productId={{productId}}" class="text-green-500 hover:text-green-700 mr-2">Edit</a>
                        <a href="index.php?page=Productss_Productss&mode=DEL&productId={{productId}}" class="text-red-500 hover:text-red-700">Delete</a>
                    </div>
                </a>
            </div>
            {{endfor products}}
        </div>
    </section>
</div>

<script>
    const searchButton = document.getElementById('searchbutton');
    const searchInput = document.querySelector('#searchbar');

    searchButton.addEventListener('click', function() {
        const searchTerm = searchInput.value; 
        alert(searchTerm);
    });
</script>
