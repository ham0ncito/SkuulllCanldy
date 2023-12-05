<section class="bg-gray-100 p-4 mx-4">
    <h1 class="text-2xl font-bold mb-4"> Descripcion carretillaanon {{modedsc}}</h1>
    
{{with carretillaanon}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Carretillaanons_Carretillaanons&mode={{~mode}}&anoncod={{id}}" method="POST"><input type="hidden" name="xss_token_carretillaanon" value="{{~xss_token_carretillaanon}}"/><section class="mb-4">
                <label for="anoncod" class="block text-gray-700 text-sm font-bold mb-2">anoncod</label>
                <input type="text" id="anoncod" name="anoncod" placeholder="anoncod de carretillaanon " value="{{anoncod}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if anoncod_error}}<div class="text-red-500 text-sm">{{anoncod_error}}</div>{{endif anoncod_error}}
            </section><section class="mb-4">
                <label for="productid" class="block text-gray-700 text-sm font-bold mb-2">productid</label>
                <input type="text" id="productid" name="productid" placeholder="productid de carretillaanon " value="{{productid}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if productid_error}}<div class="text-red-500 text-sm">{{productid_error}}</div>{{endif productid_error}}
            </section><section class="mb-4">
                <label for="crrctd" class="block text-gray-700 text-sm font-bold mb-2">crrctd</label>
                <input type="text" id="crrctd" name="crrctd" placeholder="crrctd de carretillaanon " value="{{crrctd}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if crrctd_error}}<div class="text-red-500 text-sm">{{crrctd_error}}</div>{{endif crrctd_error}}
            </section><section class="mb-4">
                <label for="crrprc" class="block text-gray-700 text-sm font-bold mb-2">crrprc</label>
                <input type="text" id="crrprc" name="crrprc" placeholder="crrprc de carretillaanon " value="{{crrprc}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if crrprc_error}}<div class="text-red-500 text-sm">{{crrprc_error}}</div>{{endif crrprc_error}}
            </section><section class="mb-4">
                <label for="crrfching" class="block text-gray-700 text-sm font-bold mb-2">crrfching</label>
                <input type="text" id="crrfching" name="crrfching" placeholder="crrfching de carretillaanon " value="{{crrfching}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if crrfching_error}}<div class="text-red-500 text-sm">{{crrfching_error}}</div>{{endif crrfching_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith carretillaanon}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Carretillaanons_Carretillaanon");
            });
        });
    </script>