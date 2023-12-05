<section class="bg-gray-100 p-4 mx-4">
    <h1 class="text-2xl font-bold mb-4"> Descripcion playlist {{modedsc}}</h1>
    
{{with playlist}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Playlists_Playlists&mode={{~mode}}&id_playlist={{id}}" method="POST"><input type="hidden" name="xss_token_playlist" value="{{~xss_token_playlist}}"/><section class="mb-4">
                <label for="id_playlist" class="block text-gray-700 text-sm font-bold mb-2">id_playlist</label>
                <input type="text" id="id_playlist" name="id_playlist" placeholder="id_playlist de playlist " value="{{id_playlist}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_playlist_error}}<div class="text-red-500 text-sm">{{id_playlist_error}}</div>{{endif id_playlist_error}}
            </section><section class="mb-4">
                <label for="playlist_name" class="block text-gray-700 text-sm font-bold mb-2">playlist_name</label>
                <input type="text" id="playlist_name" name="playlist_name" placeholder="playlist_name de playlist " value="{{playlist_name}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if playlist_name_error}}<div class="text-red-500 text-sm">{{playlist_name_error}}</div>{{endif playlist_name_error}}
            </section><section class="mb-4">
                <label for="playlist_description" class="block text-gray-700 text-sm font-bold mb-2">playlist_description</label>
                <input type="text" id="playlist_description" name="playlist_description" placeholder="playlist_description de playlist " value="{{playlist_description}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if playlist_description_error}}<div class="text-red-500 text-sm">{{playlist_description_error}}</div>{{endif playlist_description_error}}
            </section><section class="mb-4">
                <label for="playlist_image" class="block text-gray-700 text-sm font-bold mb-2">playlist_image</label>
                <input type="text" id="playlist_image" name="playlist_image" placeholder="playlist_image de playlist " value="{{playlist_image}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if playlist_image_error}}<div class="text-red-500 text-sm">{{playlist_image_error}}</div>{{endif playlist_image_error}}
            </section><section class="mb-4">
                <label for="playlist_create_at" class="block text-gray-700 text-sm font-bold mb-2">playlist_create_at</label>
                <input type="text" id="playlist_create_at" name="playlist_create_at" placeholder="playlist_create_at de playlist " value="{{playlist_create_at}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if playlist_create_at_error}}<div class="text-red-500 text-sm">{{playlist_create_at_error}}</div>{{endif playlist_create_at_error}}
            </section><section class="mb-4">
                <label for="playlist_status" class="block text-gray-700 text-sm font-bold mb-2">playlist_status</label>
                <input type="text" id="playlist_status" name="playlist_status" placeholder="playlist_status de playlist " value="{{playlist_status}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if playlist_status_error}}<div class="text-red-500 text-sm">{{playlist_status_error}}</div>{{endif playlist_status_error}}
            </section><section class="mb-4">
                <label for="usercod" class="block text-gray-700 text-sm font-bold mb-2">usercod</label>
                <input type="text" id="usercod" name="usercod" placeholder="usercod de playlist " value="{{usercod}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if usercod_error}}<div class="text-red-500 text-sm">{{usercod_error}}</div>{{endif usercod_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith playlist}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Playlists_Playlist");
            });
        });
    </script>