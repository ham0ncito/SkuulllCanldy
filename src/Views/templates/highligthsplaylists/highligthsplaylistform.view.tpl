{{if isADMIN}}
<section class="bg-gray-100 p-4 mx-4">
    <h1 class="text-2xl font-bold mb-4"> Descripcion highligthsplaylist {{modedsc}}</h1>
    
{{with highligthsplaylist}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Highligthsplaylists_Highligthsplaylists&mode={{~mode}}&highligths_id={{id}}" method="POST"><input type="hidden" name="xss_token_highligthsplaylist" value="{{~xss_token_highligthsplaylist}}"/><section class="mb-4">
                <label for="highligths_id" class="block text-gray-700 text-sm font-bold mb-2">highligths_id</label>
                <input type="text" id="highligths_id" name="highligths_id" placeholder="highligths_id de highligthsplaylist " value="{{highligths_id}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if highligths_id_error}}<div class="text-red-500 text-sm">{{highligths_id_error}}</div>{{endif highligths_id_error}}
            </section><section class="mb-4">
                <label for="playlist_id" class="block text-gray-700 text-sm font-bold mb-2">playlist_id</label>
                <input type="text" id="playlist_id" name="playlist_id" placeholder="playlist_id de highligthsplaylist " value="{{playlist_id}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if playlist_id_error}}<div class="text-red-500 text-sm">{{playlist_id_error}}</div>{{endif playlist_id_error}}
            </section><section class="mb-4">
                <label for="highligths_description" class="block text-gray-700 text-sm font-bold mb-2">highligths_description</label>
                <input type="text" id="highligths_description" name="highligths_description" placeholder="highligths_description de highligthsplaylist " value="{{highligths_description}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if highligths_description_error}}<div class="text-red-500 text-sm">{{highligths_description_error}}</div>{{endif highligths_description_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith highligthsplaylist}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Highligthsplaylists_Highligthsplaylist");
            });
        });
    </script>
    {{endif isADMIN}}