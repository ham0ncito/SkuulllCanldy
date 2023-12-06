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
            {{if isADMIN}}
            <a href="index.php?page=Carretillas_Carretillas&mode=INS" class="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700">
                Insert
            </a>
            {{endif isADMIN}}
        </div>
    </div>
</div>

<div class="flex items-center justify-between mb-4 mx-4">
    
</div>

<section>
    <h2 class="text-2xl font-bold mb-4 mx-4"> CARRETILLA</h2>
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 mx-4">
     
        {{foreach carretilla}}
        <div class="bg-white border border-gray-300 rounded p-4 overflow-hidden">
            <h3 class="text-lg font-bold overflow-hidden overflow-ellipsis mb-2">User Code: <a class="overflow-hidden overflow-ellipsis"href="index.php?page=Carretillas_Carretillas&mode=DSP&usercod={{usercod}}">{{usercod}}</a></h3>
            <p class="mb-2 overflow-hidden overflow-ellipsis">Product ID: <a class="overflow-hidden overflow-ellipsis"href="index.php?page=Carretillas_Carretillas&mode=DSP&usercod={{usercod}}">{{productid}}</a></p>
            <p class="mb-2 overflow-hidden overflow-ellipsis">Quantity: <a class="overflow-hidden overflow-ellipsis" href="index.php?page=Carretillas_Carretillas&mode=DSP&usercod={{usercod}}">{{crrctd}}</a></p>
            <p class="mb-2">Price: <a href="index.php?page=Carretillas_Carretillas&mode=DSP&usercod={{usercod}}">{{crrprc}}</a></p>
            <p class="mb-2">Date Added: <a href="index.php?page=Carretillas_Carretillas&mode=DSP&usercod={{usercod}}">{{crrfching}}</a></p>
            {{if isADMIN}}
            <div class="flex justify-center">
                <a href="index.php?page=Carretillas_Carretillas&mode=UPD&usercod={{usercod}}" class="text-green-500 hover:text-green-700 mr-2">Edit</a>
                <a href="index.php?page=Carretillas_Carretillas&mode=DEL&usercod={{usercod}}" class="text-red-500 hover:text-red-700">Delete</a>
            </div>
            {{endif isADMIN}}
        </div>
        {{endfor carretilla}}
      
     
    </div>
</section>
