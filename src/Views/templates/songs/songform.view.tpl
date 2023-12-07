
<section class="bg-gray-100  rounded-lg shadow-lg p-4 mx-8">
    <h2 class="text-2xl font-bold text-white text-center mb-6"> Descripcion song {{modedsc}}</h2>
    
{{with song}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Songs_Songs&mode={{~mode}}&id_song={{id}}" method="POST"><input type="hidden" name="xss_token_song" value="{{~xss_token_song}}"/>{{if ~isADMIN}}<section class="mb-4">
                <label for="id_song" class="block text-gray-700 text-sm font-bold mb-2">id_song</label>
                <input type="text" id="id_song" name="id_song" placeholder="id_song de song " value="{{id_song}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_song_error}}<div class="text-red-500 text-sm">{{id_song_error}}</div>{{endif id_song_error}}
            </section>{{endif ~isADMIN}}<section class="mb-4">
                <label for="title_song" class="block text-gray-700 text-sm font-bold mb-2">title_song</label>
                <input type="text" id="title_song" name="title_song" placeholder="title_song de song " value="{{title_song}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if title_song_error}}<div class="text-red-500 text-sm">{{title_song_error}}</div>{{endif title_song_error}}
            </section><section class="mb-4">
                <label for="duration" class="block text-gray-700 text-sm font-bold mb-2">duration</label>
                <input type="text" id="duration" name="duration" placeholder="duration de song " value="{{duration}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if duration_error}}<div class="text-red-500 text-sm">{{duration_error}}</div>{{endif duration_error}}
            </section>{{if ~isADMIN}}<section class="mb-4">
                <label for="id_genre" class="block text-gray-700 text-sm font-bold mb-2">id_genre</label>
                <input type="text" id="id_genre" name="id_genre" placeholder="id_genre de song " value="{{id_genre}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_genre_error}}<div class="text-red-500 text-sm">{{id_genre_error}}</div>{{endif id_genre_error}}
            </section><section class="mb-4">
                <label for="song_cover" class="block text-gray-700 text-sm font-bold mb-2">song_cover</label>
                <input type="text" id="song_cover" name="song_cover" placeholder="song_cover de song " value="{{song_cover}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if song_cover_error}}<div class="text-red-500 text-sm">{{song_cover_error}}</div>{{endif song_cover_error}}
            </section><section class="mb-4">
                <label for="album_id" class="block text-gray-700 text-sm font-bold mb-2">album_id</label>
                <input type="text" id="album_id" name="album_id" placeholder="album_id de song " value="{{album_id}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if album_id_error}}<div class="text-red-500 text-sm">{{album_id_error}}</div>{{endif album_id_error}}
            </section><section class="mb-4">
                <label for="status_song" class="block text-gray-700 text-sm font-bold mb-2">status_song</label>
                <input type="text" id="status_song" name="status_song" placeholder="status_song de song " value="{{status_song}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if status_song_error}}<div class="text-red-500 text-sm">{{status_song_error}}</div>{{endif status_song_error}}
            </section><section class="mb-4">
                <label for="link_song" class="block text-gray-700 text-sm font-bold mb-2">link_song</label>
                <input type="text" id="link_song" name="link_song" placeholder="link_song de song " value="{{link_song}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if link_song_error}}<div class="text-red-500 text-sm">{{link_song_error}}</div>{{endif link_song_error}}
            </section>{{endif ~isADMIN}}<section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith song}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Songs_Song");
            });
        });
    </script>