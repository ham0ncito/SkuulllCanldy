<div class="flex items-center justify-between mb-4 mx-4">
        <div class="relative w-full flex items-center">
            <input type="text" id="searchbar" name="searchbar" placeholder="Name or ID" class="w-2/3 px-4 py-2 pl-10 pr-8 border border-gray-300 rounded-md mx-4">
            <div class="absolute inset-y-0 left-0 flex items-center ml-2 pl-3">
                <svg class="h-6 w-5 text-gray-400 mb-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-5.2-5.2m2.8 5.2a9 9 0 11-12.727-12.727 9 9 0 1112.727 12.727z" />
                </svg>
            </div>
            <div class="absolute inset-y-0 right-0 flex items-center pr-3">
                <button id="searchbutton" name="searchbutton" class="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700 mr-2">
                    Search
                </button>
                {{if ~isADMIN}}
                <a href="index.php?page=Popularitys_Popularitys&mode=INS" class="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700">
                    Insert
                </a>
                {{endif ~isADMIN}}
            </div>
        </div>
    </div><section><h2 class="text-2xl font-bold mb-4 mx-4"> POPULARITY</h2>
<div class="overflow-x-auto">
<table class="min-w-full bg-white border border-gray-300 mx-6">
<thead class="text-center justify-center mx-2">
<tr>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">ID_POPULARITY</th>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">ID_OBJECT</th>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">DISLIKE_COUNT</th>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">LIKE_COUNT</th>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">PERCENT_DISLIKE</th>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">PERCENT_LIKE</th>
	<th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">TYPE_OBJECT</th><th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">{{if ~isADMIN}}<a href="index.php?page=Popularitys_Popularitys&mode=INS">ADD</a></th>{{endif ~isADMIN}}
	</tr>
</thead><tbody>{{foreach popularity}}<tr><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Popularitys_Popularitys&mode=DSP&id_popularity={{id_popularity}} ">{{id_popularity}}</a></td><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Popularitys_Popularitys&mode=DSP&id_popularity={{id_popularity}} ">{{id_object}}</a></td><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Popularitys_Popularitys&mode=DSP&id_popularity={{id_popularity}} ">{{dislike_count}}</a></td><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Popularitys_Popularitys&mode=DSP&id_popularity={{id_popularity}} ">{{like_count}}</a></td><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Popularitys_Popularitys&mode=DSP&id_popularity={{id_popularity}} ">{{percent_dislike}}</a></td><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Popularitys_Popularitys&mode=DSP&id_popularity={{id_popularity}} ">{{percent_like}}</a></td><td class="p-2 text-center"><a class="text-blue-500 hover:text-blue-700" href="index.php?page=Popularitys_Popularitys&mode=DSP&id_popularity={{id_popularity}} ">{{type_object}}</a></td>
            <td class"p-2 text-center">
                <a class="text-green-500 hover:text-green-700" href="index.php?page=Popularitys_Popularitys&mode=UPD&id_popularity={{id_popularity}}" >Edit</a> 
                <a class="text-red-500 hover:text-red-700" href="index.php?page=Popularitys_Popularitys&mode=DEL&id_popularity={{id_popularity}}" >Delete</a>
            </td>
	</tr>
 {{endfor popularity}}</tbody>
</table>
</div> </section>