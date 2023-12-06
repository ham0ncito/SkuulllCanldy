<section class="bg-gray-100 p-4 mx-4">
    <h1 class="text-2xl font-bold mb-4"> Descripcion favorites {{modedsc}}</h1>
    {{ifnot isCLN}}
{{with favorites}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Favoritess_Favoritess&mode={{~mode}}&id_favorite={{id}}" method="POST"><input type="hidden" name="xss_token_favorites" value="{{~xss_token_favorites}}"/><section class="mb-4">
                <label for="id_favorite" class="block text-gray-700 text-sm font-bold mb-2">id_favorite</label>
                <input type="text" id="id_favorite" name="id_favorite" placeholder="id_favorite de favorites " value="{{id_favorite}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_favorite_error}}<div class="text-red-500 text-sm">{{id_favorite_error}}</div>{{endif id_favorite_error}}
            </section><section class="mb-4">
                <label for="usercod" class="block text-gray-700 text-sm font-bold mb-2">usercod</label>
                <input type="text" id="usercod" name="usercod" placeholder="usercod de favorites " value="{{usercod}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if usercod_error}}<div class="text-red-500 text-sm">{{usercod_error}}</div>{{endif usercod_error}}
            </section><section class="mb-4">
                <label for="id_reference" class="block text-gray-700 text-sm font-bold mb-2">id_reference</label>
                <input type="text" id="id_reference" name="id_reference" placeholder="id_reference de favorites " value="{{id_reference}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_reference_error}}<div class="text-red-500 text-sm">{{id_reference_error}}</div>{{endif id_reference_error}}
            </section><section class="mb-4">
                <label for="type_favorite" class="block text-gray-700 text-sm font-bold mb-2">type_favorite</label>
                <input type="text" id="type_favorite" name="type_favorite" placeholder="type_favorite de favorites " value="{{type_favorite}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if type_favorite_error}}<div class="text-red-500 text-sm">{{type_favorite_error}}</div>{{endif type_favorite_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith favorites}}
{{endifnot isCLN}}
<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Favoritess_Favorites");
            });
        });
    </script>