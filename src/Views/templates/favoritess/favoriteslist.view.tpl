<div class="flex items-center justify-between mb-4 mx-8">
    <div class="relative w-full flex items-center">
        <input type="text" id="searchbar" name="searchbar" placeholder="Name or ID" class="w-2/3 px-4 py-2 pl-10 pr-8 border border-gray-300 rounded-md mx-4">
        <div class="absolute inset-y-0 left-0 flex items-center ml-4 pl-3">
            <svg class="h-6 w-5 text-gray-400 mb-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-5.2-5.2m2.8 5.2a9 9 0 11-12.727-12.727 9 9 0 1112.727 12.727z" />
            </svg>
        </div>
        <div class="absolute inset-y-0 right-0 flex items-center pr-3">
            <button id="searchbutton" name="searchbutton" class="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700 mr-2">
                Search
            </button>
            {{if ~isADMIN}}
            <a href="index.php?page=Favoritess_Favoritess&mode=INS" class="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700">
                Insert
            </a>
            {{endif ~isADMIN}}
        </div>
    </div>
</div>

{{ifnot isEmpty}}
<section class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 mx-8">
    <h2 class="text-2xl font-bold mb-4 mx-4 col-span-full">FAVORITES</h2>
    {{foreach favorites}}
    <div class="bg-white rounded-lg overflow-hidden shadow-md">
        <div class="p-4">
            <h3 class="font-bold text-xl mb-2">ID Favorite: {{id_favorite}}</h3>
            {{if ~isADMIN}}
            <p class="text-gray-600 mt-2">User Code: {{usercod}}</p>
            <p class="text-gray-600 mt-2">ID Reference: {{id_reference}}</p>
            {{endif ~isADMIN}}
            <p class="text-gray-600 mt-2">Type: {{type_favorite}}</p>
            
            {{ifnot isCLN}}
            <div class="mt-4">
                <a href="index.php?page=Favoritess_Favoritess&mode=UPD&id_favorite={{id_favorite}}" class="text-green-500 hover:text-green-700 mr-2">Edit</a>
                <a href="index.php?page=Favoritess_Favoritess&mode=DEL&id_favorite={{id_favorite}}" class="text-red-500 hover:text-red-700">Delete</a>
            </div>
            {{endifnot isCLN}}
        </div>
    </div>
    {{endfor favorites}}
</section>
{{endifnot isEmpty}}

{{if isEmpty}}
{{include components/tarjeta}}
{{endif isEmpty}}
