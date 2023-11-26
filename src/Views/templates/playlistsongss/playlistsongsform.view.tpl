<section class="bg-gray-100 p-4 mx-4">
    <h1 class="text-2xl font-bold mb-4"> Descripcion playlistsongs {{modedsc}}</h1>
    
{{with playlistsongs}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Playlistsongss_Playlistsongss&mode={{~mode}}&playlist_id={{id}}" method="POST"><input type="hidden" name="xss_token_playlistsongs" value="{{~xss_token_playlistsongs}}"/><section class="mb-4">
                <label for="playlist_id" class="block text-gray-700 text-sm font-bold mb-2">playlist_id</label>
                <input type="text" id="playlist_id" name="playlist_id" placeholder="playlist_id de playlistsongs " value="{{playlist_id}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if playlist_id_error}}<div class="text-red-500 text-sm">{{playlist_id_error}}</div>{{endif playlist_id_error}}
            </section><section class="mb-4">
                <label for="song_id" class="block text-gray-700 text-sm font-bold mb-2">song_id</label>
                <input type="text" id="song_id" name="song_id" placeholder="song_id de playlistsongs " value="{{song_id}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if song_id_error}}<div class="text-red-500 text-sm">{{song_id_error}}</div>{{endif song_id_error}}
            </section><section class="mb-4">
                <label for="playlistsong_added_at" class="block text-gray-700 text-sm font-bold mb-2">playlistsong_added_at</label>
                <input type="text" id="playlistsong_added_at" name="playlistsong_added_at" placeholder="playlistsong_added_at de playlistsongs " value="{{playlistsong_added_at}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if playlistsong_added_at_error}}<div class="text-red-500 text-sm">{{playlistsong_added_at_error}}</div>{{endif playlistsong_added_at_error}}
            </section><section class="mb-4">
                <label for="playlistsong_status" class="block text-gray-700 text-sm font-bold mb-2">playlistsong_status</label>
                <input type="text" id="playlistsong_status" name="playlistsong_status" placeholder="playlistsong_status de playlistsongs " value="{{playlistsong_status}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if playlistsong_status_error}}<div class="text-red-500 text-sm">{{playlistsong_status_error}}</div>{{endif playlistsong_status_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith playlistsongs}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Playlistsongss_Playlistsongs");
            });
        });
    </script>