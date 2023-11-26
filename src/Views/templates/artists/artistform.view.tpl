<section class="bg-gray-100 p-4  mx-auto rounded-lg mb-10">
    <h1 class="text-4xl font-bold mb-4 text-center p-4"> Descripcion artist {{modedsc}}</h1>
    
{{with artist}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Artists_Artists&mode={{~mode}}&id_artist={{id}}" method="POST"><input type="hidden" name="xss_token_artist" value="{{~xss_token_artist}}"/><section class="mb-4">
                <label for="id_artist" class="block text-gray-700 text-sm font-bold mb-2">id_artist</label>
                <input type="text" id="id_artist" name="id_artist" placeholder="id_artist de artist " value="{{id_artist}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_artist_error}}<div class="text-red-500 text-sm">{{id_artist_error}}</div>{{endif id_artist_error}}
            </section><section class="mb-4">
                <label for="name_artist" class="block text-gray-700 text-sm font-bold mb-2">name_artist</label>
                <input type="text" id="name_artist" name="name_artist" placeholder="name_artist de artist " value="{{name_artist}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if name_artist_error}}<div class="text-red-500 text-sm">{{name_artist_error}}</div>{{endif name_artist_error}}
            </section><section class="mb-4">
                <label for="image_artist" class="block text-gray-700 text-sm font-bold mb-2">image_artist</label>
                <input type="text" id="image_artist" name="image_artist" placeholder="image_artist de artist " value="{{image_artist}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if image_artist_error}}<div class="text-red-500 text-sm">{{image_artist_error}}</div>{{endif image_artist_error}}
            </section><section class="mb-4">
                <label for="date_of_birth_artist" class="block text-gray-700 text-sm font-bold mb-2">date_of_birth_artist</label>
                <input type="text" id="date_of_birth_artist" name="date_of_birth_artist" placeholder="date_of_birth_artist de artist " value="{{date_of_birth_artist}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if date_of_birth_artist_error}}<div class="text-red-500 text-sm">{{date_of_birth_artist_error}}</div>{{endif date_of_birth_artist_error}}
            </section><section class="mb-4">
                <label for="country_artist" class="block text-gray-700 text-sm font-bold mb-2">country_artist</label>
                <input type="text" id="country_artist" name="country_artist" placeholder="country_artist de artist " value="{{country_artist}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if country_artist_error}}<div class="text-red-500 text-sm">{{country_artist_error}}</div>{{endif country_artist_error}}
            </section><section class="mb-4">
                <label for="status_artist" class="block text-gray-700 text-sm font-bold mb-2">status_artist</label>
                <input type="text" id="status_artist" name="status_artist" placeholder="status_artist de artist " value="{{status_artist}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if status_artist_error}}<div class="text-red-500 text-sm">{{status_artist_error}}</div>{{endif status_artist_error}}
            </section><section class="mb-4">
                <label for="artist_bio" class="block text-gray-700 text-sm font-bold mb-2">artist_bio</label>
                <input type="text" id="artist_bio" name="artist_bio" placeholder="artist_bio de artist " value="{{artist_bio}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if artist_bio_error}}<div class="text-red-500 text-sm">{{artist_bio_error}}</div>{{endif artist_bio_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirmar</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancelar</button>
        </section>
        </section></form></section>
{{endwith artist}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Artists_Artist");
            });
        });
    </script>