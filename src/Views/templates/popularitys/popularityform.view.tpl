<section class="bg-gray-100 p-4 mx-4">
    <h1 class="text-2xl font-bold mb-4"> Descripcion popularity {{modedsc}}</h1>
    
{{with popularity}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Popularitys_Popularitys&mode={{~mode}}&id_popularity={{id}}" method="POST"><input type="hidden" name="xss_token_popularity" value="{{~xss_token_popularity}}"/><section class="mb-4">
                <label for="id_popularity" class="block text-gray-700 text-sm font-bold mb-2">id_popularity</label>
                <input type="text" id="id_popularity" name="id_popularity" placeholder="id_popularity de popularity " value="{{id_popularity}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_popularity_error}}<div class="text-red-500 text-sm">{{id_popularity_error}}</div>{{endif id_popularity_error}}
            </section><section class="mb-4">
                <label for="id_object" class="block text-gray-700 text-sm font-bold mb-2">id_object</label>
                <input type="text" id="id_object" name="id_object" placeholder="id_object de popularity " value="{{id_object}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_object_error}}<div class="text-red-500 text-sm">{{id_object_error}}</div>{{endif id_object_error}}
            </section><section class="mb-4">
                <label for="dislike_count" class="block text-gray-700 text-sm font-bold mb-2">dislike_count</label>
                <input type="text" id="dislike_count" name="dislike_count" placeholder="dislike_count de popularity " value="{{dislike_count}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if dislike_count_error}}<div class="text-red-500 text-sm">{{dislike_count_error}}</div>{{endif dislike_count_error}}
            </section><section class="mb-4">
                <label for="like_count" class="block text-gray-700 text-sm font-bold mb-2">like_count</label>
                <input type="text" id="like_count" name="like_count" placeholder="like_count de popularity " value="{{like_count}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if like_count_error}}<div class="text-red-500 text-sm">{{like_count_error}}</div>{{endif like_count_error}}
            </section><section class="mb-4">
                <label for="percent_dislike" class="block text-gray-700 text-sm font-bold mb-2">percent_dislike</label>
                <input type="text" id="percent_dislike" name="percent_dislike" placeholder="percent_dislike de popularity " value="{{percent_dislike}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if percent_dislike_error}}<div class="text-red-500 text-sm">{{percent_dislike_error}}</div>{{endif percent_dislike_error}}
            </section><section class="mb-4">
                <label for="percent_like" class="block text-gray-700 text-sm font-bold mb-2">percent_like</label>
                <input type="text" id="percent_like" name="percent_like" placeholder="percent_like de popularity " value="{{percent_like}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if percent_like_error}}<div class="text-red-500 text-sm">{{percent_like_error}}</div>{{endif percent_like_error}}
            </section><section class="mb-4">
                <label for="type_object" class="block text-gray-700 text-sm font-bold mb-2">type_object</label>
                <input type="text" id="type_object" name="type_object" placeholder="type_object de popularity " value="{{type_object}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if type_object_error}}<div class="text-red-500 text-sm">{{type_object_error}}</div>{{endif type_object_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith popularity}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Popularitys_Popularity");
            });
        });
    </script>