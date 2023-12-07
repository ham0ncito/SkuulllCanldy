<section class="bg-gray-100  rounded-lg shadow-lg p-4 mx-8">
    <h2 class="text-2xl font-bold text-white text-center mb-6"> Descripcion log {{modedsc}}</h2>
    
{{with log}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Logs_Logs&mode={{~mode}}&={{id}}" method="POST"><input type="hidden" name="xss_token_log" value="{{~xss_token_log}}"/><section class="mb-4">
                <label for="log_cod" class="block text-gray-700 text-sm font-bold mb-2">log_cod</label>
                <input type="text" id="log_cod" name="log_cod" placeholder="log_cod de log " value="{{log_cod}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if log_cod_error}}<div class="text-red-500 text-sm">{{log_cod_error}}</div>{{endif log_cod_error}}
            </section><section class="mb-4">
                <label for="log_description" class="block text-gray-700 text-sm font-bold mb-2">log_description</label>
                <input type="text" id="log_description" name="log_description" placeholder="log_description de log " value="{{log_description}}" {{if ~readonly}} disabled readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if log_description_error}}<div class="text-red-500 text-sm">{{log_description_error}}</div>{{endif log_description_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith log}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Logs_Log");
            });
        });
    </script>