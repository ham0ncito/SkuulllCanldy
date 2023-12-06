{{if isADMIN}}
<section class="bg-gray-100 p-4 mx-4">
    <h1 class="text-2xl font-bold mb-4"> Descripcion songauthors {{modedsc}}</h1>
    
{{with songauthors}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Songauthorss_Songauthorss&mode={{~mode}}&={{id}}" method="POST"><input type="hidden" name="xss_token_songauthors" value="{{~xss_token_songauthors}}"/><section class="mb-4">
                <label for="artist_id" class="block text-gray-700 text-sm font-bold mb-2">artist_id</label>
                <input type="text" id="artist_id" name="artist_id" placeholder="artist_id de songauthors " value="{{artist_id}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if artist_id_error}}<div class="text-red-500 text-sm">{{artist_id_error}}</div>{{endif artist_id_error}}
            </section><section class="mb-4">
                <label for="song_id" class="block text-gray-700 text-sm font-bold mb-2">song_id</label>
                <input type="text" id="song_id" name="song_id" placeholder="song_id de songauthors " value="{{song_id}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if song_id_error}}<div class="text-red-500 text-sm">{{song_id_error}}</div>{{endif song_id_error}}
            </section><section class="mb-4">
                <label for="song_author_created_at" class="block text-gray-700 text-sm font-bold mb-2">song_author_created_at</label>
                <input type="text" id="song_author_created_at" name="song_author_created_at" placeholder="song_author_created_at de songauthors " value="{{song_author_created_at}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if song_author_created_at_error}}<div class="text-red-500 text-sm">{{song_author_created_at_error}}</div>{{endif song_author_created_at_error}}
            </section><section class="mb-4">
                <label for="song_author_last_update_at" class="block text-gray-700 text-sm font-bold mb-2">song_author_last_update_at</label>
                <input type="text" id="song_author_last_update_at" name="song_author_last_update_at" placeholder="song_author_last_update_at de songauthors " value="{{song_author_last_update_at}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if song_author_last_update_at_error}}<div class="text-red-500 text-sm">{{song_author_last_update_at_error}}</div>{{endif song_author_last_update_at_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith songauthors}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Songauthorss_Songauthors");
            });
        });
    </script>
    {{endif isADMIN}}