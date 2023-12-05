<section class="bg-gray-100 p-4 mx-4">
    <h1 class="text-2xl font-bold mb-4"> Descripcion loguser {{modedsc}}</h1>
    
{{with loguser}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Logusers_Logusers&mode={{~mode}}&user_cod={{id}}" method="POST"><input type="hidden" name="xss_token_loguser" value="{{~xss_token_loguser}}"/><section class="mb-4">
                <label for="user_cod" class="block text-gray-700 text-sm font-bold mb-2">user_cod</label>
                <input type="text" id="user_cod" name="user_cod" placeholder="user_cod de loguser " value="{{user_cod}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if user_cod_error}}<div class="text-red-500 text-sm">{{user_cod_error}}</div>{{endif user_cod_error}}
            </section><section class="mb-4">
                <label for="log_cod" class="block text-gray-700 text-sm font-bold mb-2">log_cod</label>
                <input type="text" id="log_cod" name="log_cod" placeholder="log_cod de loguser " value="{{log_cod}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if log_cod_error}}<div class="text-red-500 text-sm">{{log_cod_error}}</div>{{endif log_cod_error}}
            </section><section class="mb-4">
                <label for="date" class="block text-gray-700 text-sm font-bold mb-2">date</label>
                <input type="text" id="date" name="date" placeholder="date de loguser " value="{{date}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if date_error}}<div class="text-red-500 text-sm">{{date_error}}</div>{{endif date_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith loguser}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Logusers_Loguser");
            });
        });
    </script>