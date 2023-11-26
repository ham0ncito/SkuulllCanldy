<section class="bg-gray-100 p-4 mx-4">
    <h1 class="text-2xl font-bold mb-4"> Descripcion album {{modedsc}}</h1>
    
{{with album}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Albums_Albums&mode={{~mode}}&id_album={{id}}" method="POST"><input type="hidden" name="xss_token_album" value="{{~xss_token_album}}"/><section class="mb-4">
                <label for="id_album" class="block text-gray-700 text-sm font-bold mb-2">id_album</label>
                <input type="text" id="id_album" name="id_album" placeholder="id_album de album " value="{{id_album}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_album_error}}<div class="text-red-500 text-sm">{{id_album_error}}</div>{{endif id_album_error}}
            </section><section class="mb-4">
                <label for="title_album" class="block text-gray-700 text-sm font-bold mb-2">title_album</label>
                <input type="text" id="title_album" name="title_album" placeholder="title_album de album " value="{{title_album}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if title_album_error}}<div class="text-red-500 text-sm">{{title_album_error}}</div>{{endif title_album_error}}
            </section><section class="mb-4">
                <label for="image_album" class="block text-gray-700 text-sm font-bold mb-2">image_album</label>
                <input type="text" id="image_album" name="image_album" placeholder="image_album de album " value="{{image_album}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if image_album_error}}<div class="text-red-500 text-sm">{{image_album_error}}</div>{{endif image_album_error}}
            </section><section class="mb-4">
                <label for="release_date_album" class="block text-gray-700 text-sm font-bold mb-2">release_date_album</label>
                <input type="text" id="release_date_album" name="release_date_album" placeholder="release_date_album de album " value="{{release_date_album}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if release_date_album_error}}<div class="text-red-500 text-sm">{{release_date_album_error}}</div>{{endif release_date_album_error}}
            </section><section class="mb-4">
                <label for="number_of_songs_album" class="block text-gray-700 text-sm font-bold mb-2">number_of_songs_album</label>
                <input type="text" id="number_of_songs_album" name="number_of_songs_album" placeholder="number_of_songs_album de album " value="{{number_of_songs_album}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if number_of_songs_album_error}}<div class="text-red-500 text-sm">{{number_of_songs_album_error}}</div>{{endif number_of_songs_album_error}}
            </section><section class="mb-4">
                <label for="id_artist" class="block text-gray-700 text-sm font-bold mb-2">id_artist</label>
                <input type="text" id="id_artist" name="id_artist" placeholder="id_artist de album " value="{{id_artist}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_artist_error}}<div class="text-red-500 text-sm">{{id_artist_error}}</div>{{endif id_artist_error}}
            </section><section class="mb-4">
                <label for="status_album" class="block text-gray-700 text-sm font-bold mb-2">status_album</label>
                <input type="text" id="status_album" name="status_album" placeholder="status_album de album " value="{{status_album}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if status_album_error}}<div class="text-red-500 text-sm">{{status_album_error}}</div>{{endif status_album_error}}
            </section><section class="mb-4">
                <label for="id_genre" class="block text-gray-700 text-sm font-bold mb-2">id_genre</label>
                <input type="text" id="id_genre" name="id_genre" placeholder="id_genre de album " value="{{id_genre}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_genre_error}}<div class="text-red-500 text-sm">{{id_genre_error}}</div>{{endif id_genre_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith album}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Albums_Album");
            });
        });
    </script>