<section class="bg-gray-100 p-4 mx-4">
    <h1 class="text-2xl font-bold mb-4"> Descripcion offer {{modedsc}}</h1>
    
{{with offer}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Offers_Offers&mode={{~mode}}&id_offer={{id}}" method="POST"><input type="hidden" name="xss_token_offer" value="{{~xss_token_offer}}"/><section class="mb-4">
                <label for="id_offer" class="block text-gray-700 text-sm font-bold mb-2">id_offer</label>
                <input type="text" id="id_offer" name="id_offer" placeholder="id_offer de offer " value="{{id_offer}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_offer_error}}<div class="text-red-500 text-sm">{{id_offer_error}}</div>{{endif id_offer_error}}
            </section><section class="mb-4">
                <label for="offer_description" class="block text-gray-700 text-sm font-bold mb-2">offer_description</label>
                <input type="text" id="offer_description" name="offer_description" placeholder="offer_description de offer " value="{{offer_description}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if offer_description_error}}<div class="text-red-500 text-sm">{{offer_description_error}}</div>{{endif offer_description_error}}
            </section><section class="mb-4">
                <label for="offer_starts_at" class="block text-gray-700 text-sm font-bold mb-2">offer_starts_at</label>
                <input type="text" id="offer_starts_at" name="offer_starts_at" placeholder="offer_starts_at de offer " value="{{offer_starts_at}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if offer_starts_at_error}}<div class="text-red-500 text-sm">{{offer_starts_at_error}}</div>{{endif offer_starts_at_error}}
            </section><section class="mb-4">
                <label for="offer_ends_at" class="block text-gray-700 text-sm font-bold mb-2">offer_ends_at</label>
                <input type="text" id="offer_ends_at" name="offer_ends_at" placeholder="offer_ends_at de offer " value="{{offer_ends_at}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if offer_ends_at_error}}<div class="text-red-500 text-sm">{{offer_ends_at_error}}</div>{{endif offer_ends_at_error}}
            </section><section class="mb-4">
                <label for="offer_status" class="block text-gray-700 text-sm font-bold mb-2">offer_status</label>
                <input type="text" id="offer_status" name="offer_status" placeholder="offer_status de offer " value="{{offer_status}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if offer_status_error}}<div class="text-red-500 text-sm">{{offer_status_error}}</div>{{endif offer_status_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith offer}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Offers_Offer");
            });
        });
    </script>