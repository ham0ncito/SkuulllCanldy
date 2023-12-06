<section class="bg-gray-100 p-4 mx-4">
    <h1 class="text-6xl font-bold mb-4 text-center"> Descripcion genre {{modedsc}}</h1>
    
{{with genre}}

    <form class="my-4 mx-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Genres_Genres&mode={{~mode}}&id_genre={{id}}" method="POST"><input type="hidden" name="xss_token_genre" value="{{~xss_token_genre}}"/><section class="mb-4">
                <label for="id_genre" class="block text-gray-700 text-sm font-bold mb-2">id_genre</label>
                <input type="text" id="id_genre" name="id_genre" placeholder="id_genre de genre " value="{{id_genre}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_genre_error}}<div class="text-red-500 text-sm">{{id_genre_error}}</div>{{endif id_genre_error}}
            </section><section class="mb-4">
                <label for="name_genre" class="block text-gray-700 text-sm font-bold mb-2">name_genre</label>
                <input type="text" id="name_genre" name="name_genre" placeholder="name_genre de genre " value="{{name_genre}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if name_genre_error}}<div class="text-red-500 text-sm">{{name_genre_error}}</div>{{endif name_genre_error}}
            </section><section class="mb-4">
                <label for="description_genre" class="block text-gray-700 text-sm font-bold mb-2">description_genre</label>
                <input type="text" id="description_genre" name="description_genre" placeholder="description_genre de genre " value="{{description_genre}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if description_genre_error}}<div class="text-red-500 text-sm">{{description_genre_error}}</div>{{endif description_genre_error}}
            </section>{{if isADMIN}}<section class="mb-4">
                <label for="status_genre" class="block text-gray-700 text-sm font-bold mb-2">status_genre</label>
                <input type="text" id="status_genre" name="status_genre" placeholder="status_genre de genre " value="{{status_genre}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if status_genre_error}}<div class="text-red-500 text-sm">{{status_genre_error}}</div>{{endif status_genre_error}}
            </section><section class="mb-4">
                <label for="image_genre" class="block text-gray-700 text-sm font-bold mb-2">image_genre</label>
                <input type="text" id="image_genre" name="image_genre" placeholder="image_genre de genre " value="{{image_genre}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if image_genre_error}}<div class="text-red-500 text-sm">{{image_genre_error}}</div>{{endif image_genre_error}}
            </section>{{endif isADMIN}}<section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirmar</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancelar</button>
        </section>
        </section></form></section>
{{endwith genre}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Genres_Genre");
            });
        });
    </script>