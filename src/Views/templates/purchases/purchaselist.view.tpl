<div class="flex items-center justify-between mb-4 mx-10">
    <div class="relative w-full flex items-center">
        <input type="text" id="searchbar" name="searchbar" placeholder="Name or ID" class="w-2/3 px-4 py-2 pl-10 pr-8 border border-gray-300 rounded-md mx-4">
        <div class="absolute inset-y-0 left-0 flex items-center pl-3">
            <svg class="h-6 w-5 text-gray-400 mb-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-5.2-5.2m2.8 5.2a9 9 0 11-12.727-12.727 9 9 0 1112.727 12.727z" />
            </svg>
        </div>
        <div class="absolute inset-y-0 right-0 flex items-center pr-3">
            <button id="searchbutton" name="searchbutton" class="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700 mr-2">
                Search
            </button>
            {{if ~isADMIN}}
            <a href="index.php?page=Purchases_Purchases&mode=INS" class="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 focus:outline-none focus:bg-gray-700">
                Insert
            </a>
            {{endif ~isADMIN}}
        </div>
    </div>
</div>
{{ifnot isEmpty}}
<section class="mx-8 justify-center">
    <h2 class="text-2xl font-bold mb-4 mx-4"> PURCHASES </h2>
    <div class="overflow-x-auto">
        <table class="min-w-full bg-white border border-gray-300 mx-6">
            <thead class="text-center justify-center mx-2">
                <tr>
                    <th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">REFERENCE ID </th>
                    <th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">PURCHASE_DATE</th>
                    <th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">TOTAL</th>
                    <th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">DETAILS</th>
                    <th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">PAYMENTS</th>
                    {{if ~isADMIN}}
                    <th class="py-2 px-2 text-center justify-center text-white bg-blue-500 border-b">Actions</th>
                    {{end ~isADMIN}}
                </tr>
            </thead>
            <tbody>
                {{foreach purchase}}
                <tr>
                    <td class="p-2 text-center">
                        <a class="text-blue-500 hover:text-blue-700" href="index.php?page=Purchases_Purchases&mode=DSP&id_purchase={{id_purchase}}">
                            {{id_purchase}}
                        </a>
                    </td>
                    <td class="p-2 text-center">
                        <a class="text-blue-500 hover:text-blue-700" href="index.php?page=Purchases_Purchases&mode=DSP&id_purchase={{id_purchase}}">
                            {{purchase_date}}
                        </a>
                    </td>
                    <td class="p-2 text-center">
                        <a class="text-blue-500 hover:text-blue-700" href="index.php?page=Purchases_Purchases&mode=DSP&id_purchase={{id_purchase}}">
                            {{total}}
                        </a>
                    </td>
                    <td class="p-2 text-center">
                        <a class="text-blue-500 hover:text-blue-700" href="index.php?page=Purchases_Purchases&mode=DSP&id_purchase={{id_purchase}}">
                            {{details}}
                        </a>
                    </td>
                    <td class="p-2 text-center">
                        <a class="text-blue-500 hover:text-blue-700" href="index.php?page=Purchases_Purchases&mode=DSP&id_purchase={{id_purchase}}">
                            {{payments}}
                        </a>
                    </td>
                    {{if ~isADMIN}}
                    <td class="p-2 text-center">
                        <a class="text-green-500 hover:text-green-700" href="index.php?page=Purchases_Purchases&mode=UPD&id_purchase={{id_purchase}}">
                            Edit
                        </a> 
                        <a class="text-red-500 hover:text-red-700" href="index.php?page=Purchases_Purchases&mode=DEL&id_purchase={{id_purchase}}">
                            Delete
                        </a>
                    </td>
                    {{endif ~isADMIN}}
                </tr>
                {{endfor purchase}}
            
            </tbody>
        </table>
    </div>
</section>{{endifnot isEmpty}}{{if isEmpty}}
{{include components/tarjeta}}{{endif isEmpty}}
