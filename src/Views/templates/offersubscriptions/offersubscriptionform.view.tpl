<section class="bg-gray-100  rounded-lg shadow-lg p-4 mx-8">
    <h2 class="text-2xl font-bold text-white text-center mb-6"> Descripcion offersubscription {{modedsc}}</h2>
    
{{with offersubscription}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Offersubscriptions_Offersubscriptions&mode={{~mode}}&id_offer={{id}}" method="POST"><input type="hidden" name="xss_token_offersubscription" value="{{~xss_token_offersubscription}}"/>{{if ~isADMIN}}<section class="mb-4">
                <label for="id_offer" class="block text-gray-700 text-sm font-bold mb-2">id_offer</label>
                <input type="text" id="id_offer" name="id_offer" placeholder="id_offer de offersubscription " value="{{id_offer}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_offer_error}}<div class="text-red-500 text-sm">{{id_offer_error}}</div>{{endif id_offer_error}}
            </section><section class="mb-4">
                <label for="id_subscription" class="block text-gray-700 text-sm font-bold mb-2">id_subscription</label>
                <input type="text" id="id_subscription" name="id_subscription" placeholder="id_subscription de offersubscription " value="{{id_subscription}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_subscription_error}}<div class="text-red-500 text-sm">{{id_subscription_error}}</div>{{endif id_subscription_error}}
            </section>{{endif ~isADMIN}}<section class="mb-4">
                <label for="price_offer" class="block text-gray-700 text-sm font-bold mb-2">price_offer</label>
                <input type="text" id="price_offer" name="price_offer" placeholder="price_offer de offersubscription " value="{{price_offer}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if price_offer_error}}<div class="text-red-500 text-sm">{{price_offer_error}}</div>{{endif price_offer_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith offersubscription}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Offersubscriptions_Offersubscription");
            });
        });
    </script>