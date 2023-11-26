<section class="bg-gray-100 p-4 mx-4">
    <h1 class="text-2xl font-bold mb-4"> Descripcion video {{modedsc}}</h1>
    
{{with video}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Videos_Videos&mode={{~mode}}&id_video={{id}}" method="POST"><input type="hidden" name="xss_token_video" value="{{~xss_token_video}}"/><section class="mb-4">
                <label for="id_video" class="block text-gray-700 text-sm font-bold mb-2">id_video</label>
                <input type="text" id="id_video" name="id_video" placeholder="id_video de video " value="{{id_video}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_video_error}}<div class="text-red-500 text-sm">{{id_video_error}}</div>{{endif id_video_error}}
            </section><section class="mb-4">
                <label for="title_video" class="block text-gray-700 text-sm font-bold mb-2">title_video</label>
                <input type="text" id="title_video" name="title_video" placeholder="title_video de video " value="{{title_video}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if title_video_error}}<div class="text-red-500 text-sm">{{title_video_error}}</div>{{endif title_video_error}}
            </section><section class="mb-4">
                <label for="description_video" class="block text-gray-700 text-sm font-bold mb-2">description_video</label>
                <input type="text" id="description_video" name="description_video" placeholder="description_video de video " value="{{description_video}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if description_video_error}}<div class="text-red-500 text-sm">{{description_video_error}}</div>{{endif description_video_error}}
            </section><section class="mb-4">
                <label for="duration" class="block text-gray-700 text-sm font-bold mb-2">duration</label>
                <input type="text" id="duration" name="duration" placeholder="duration de video " value="{{duration}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if duration_error}}<div class="text-red-500 text-sm">{{duration_error}}</div>{{endif duration_error}}
            </section><section class="mb-4">
                <label for="video_cover" class="block text-gray-700 text-sm font-bold mb-2">video_cover</label>
                <input type="text" id="video_cover" name="video_cover" placeholder="video_cover de video " value="{{video_cover}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if video_cover_error}}<div class="text-red-500 text-sm">{{video_cover_error}}</div>{{endif video_cover_error}}
            </section><section class="mb-4">
                <label for="artist_id" class="block text-gray-700 text-sm font-bold mb-2">artist_id</label>
                <input type="text" id="artist_id" name="artist_id" placeholder="artist_id de video " value="{{artist_id}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if artist_id_error}}<div class="text-red-500 text-sm">{{artist_id_error}}</div>{{endif artist_id_error}}
            </section><section class="mb-4">
                <label for="status_video" class="block text-gray-700 text-sm font-bold mb-2">status_video</label>
                <input type="text" id="status_video" name="status_video" placeholder="status_video de video " value="{{status_video}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if status_video_error}}<div class="text-red-500 text-sm">{{status_video_error}}</div>{{endif status_video_error}}
            </section><section class="mb-4">
                <label for="link_song" class="block text-gray-700 text-sm font-bold mb-2">link_song</label>
                <input type="text" id="link_song" name="link_song" placeholder="link_song de video " value="{{link_song}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if link_song_error}}<div class="text-red-500 text-sm">{{link_song_error}}</div>{{endif link_song_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith video}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Videos_Video");
            });
        });
    </script>