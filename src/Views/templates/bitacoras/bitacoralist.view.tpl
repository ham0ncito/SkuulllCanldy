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
            <a href="index.php?page=Bitacoras_Bitacoras&mode=INS" class="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700">
                Insert
            </a>
        </div>
    </div>
</div>

<section class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-4 gap-4 pb-10 mx-4">
    {{foreach bitacora}}
    <div class="bg-white rounded-md shadow-md">
        <div class="p-4">
            <p class="text-blue-500 hover:text-blue-700 mb-2">
                <a href="index.php?page=Bitacoras_Bitacoras&mode=DSP&bitacoracod={{bitacoracod}}">{{bitacoracod}}</a>
            </p>
            <p class="text-gray-500 mb-2">{{bitacorafch}}</p>
            <p class="text-gray-500 mb-2">{{bitprograma}}</p>
            <p class="text-gray-500 mb-2">{{bitdescripcion}}</p>
            <p class="text-gray-500 mb-2">{{bitobservacion}}</p>
            <p class="text-gray-500 mb-2">{{bittipo}}</p>
            <p class="text-gray-500 mb-2">{{bitusuario}}</p>
            <div class="flex justify-center mt-4">
                <a class="text-green-500 hover:text-green-700 mr-2" href="index.php?page=Bitacoras_Bitacoras&mode=UPD&bitacoracod={{bitacoracod}}">Edit</a> 
                <a class="text-red-500 hover:text-red-700" href="index.php?page=Bitacoras_Bitacoras&mode=DEL&bitacoracod={{bitacoracod}}">Delete</a>
            </div>
        </div>
    </div>
    {{endfor bitacora}}
</section>
