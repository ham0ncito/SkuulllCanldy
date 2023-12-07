{{if ~isADMIN}}
<section class="bg-gray-100  rounded-lg shadow-lg p-4 mx-8">
    <h2 class="text-2xl font-bold text-white text-center mb-6"> Descripcion highligths {{modedsc}}</h2>
    
{{with highligths}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Highligthss_Highligthss&mode={{~mode}}&highligths_id={{id}}" method="POST"><input type="hidden" name="xss_token_highligths" value="{{~xss_token_highligths}}"/><section class="mb-4">
                <label for="highligths_id" class="block text-gray-700 text-sm font-bold mb-2">highligths_id</label>
                <input type="text" id="highligths_id" name="highligths_id" placeholder="highligths_id de highligths " value="{{highligths_id}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if highligths_id_error}}<div class="text-red-500 text-sm">{{highligths_id_error}}</div>{{endif highligths_id_error}}
            </section><section class="mb-4">
                <label for="highligths_starts_at" class="block text-gray-700 text-sm font-bold mb-2">highligths_starts_at</label>
                <input type="text" id="highligths_starts_at" name="highligths_starts_at" placeholder="highligths_starts_at de highligths " value="{{highligths_starts_at}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if highligths_starts_at_error}}<div class="text-red-500 text-sm">{{highligths_starts_at_error}}</div>{{endif highligths_starts_at_error}}
            </section><section class="mb-4">
                <label for="highligths_ends_at" class="block text-gray-700 text-sm font-bold mb-2">highligths_ends_at</label>
                <input type="text" id="highligths_ends_at" name="highligths_ends_at" placeholder="highligths_ends_at de highligths " value="{{highligths_ends_at}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if highligths_ends_at_error}}<div class="text-red-500 text-sm">{{highligths_ends_at_error}}</div>{{endif highligths_ends_at_error}}
            </section><section class="mb-4">
                <label for="highligths_time" class="block text-gray-700 text-sm font-bold mb-2">highligths_time</label>
                <input type="text" id="highligths_time" name="highligths_time" placeholder="highligths_time de highligths " value="{{highligths_time}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if highligths_time_error}}<div class="text-red-500 text-sm">{{highligths_time_error}}</div>{{endif highligths_time_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith highligths}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Highligthss_Highligths");
            });
        });
    </script>
    {{if ~isADMIN}}