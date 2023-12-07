<section class="bg-gray-100  rounded-lg shadow-lg p-4 mx-8">
    <h2 class="text-2xl font-bold text-white text-center mb-6"> Descripcion subscription {{modedsc}}</h2>
    
{{with subscription}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Subscriptions_Subscriptions&mode={{~mode}}&id_subscription={{id}}" method="POST"><input type="hidden" name="xss_token_subscription" value="{{~xss_token_subscription}}"/><section class="mb-4">
                <label for="id_subscription" class="block text-gray-700 text-sm font-bold mb-2">id_subscription</label>
                <input type="text" id="id_subscription" name="id_subscription" placeholder="id_subscription de subscription " value="{{id_subscription}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_subscription_error}}<div class="text-red-500 text-sm">{{id_subscription_error}}</div>{{endif id_subscription_error}}
            </section><section class="mb-4">
                <label for="subscription_description" class="block text-gray-700 text-sm font-bold mb-2">subscription_description</label>
                <input type="text" id="subscription_description" name="subscription_description" placeholder="subscription_description de subscription " value="{{subscription_description}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if subscription_description_error}}<div class="text-red-500 text-sm">{{subscription_description_error}}</div>{{endif subscription_description_error}}
            </section><section class="mb-4">
                <label for="subscription_duration" class="block text-gray-700 text-sm font-bold mb-2">subscription_duration</label>
                <input type="text" id="subscription_duration" name="subscription_duration" placeholder="subscription_duration de subscription " value="{{subscription_duration}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if subscription_duration_error}}<div class="text-red-500 text-sm">{{subscription_duration_error}}</div>{{endif subscription_duration_error}}
            </section>{{if ~isADMIN}}<section class="mb-4">
                <label for="subscription_price" class="block text-gray-700 text-sm font-bold mb-2">subscription_price</label>
                <input type="text" id="subscription_price" name="subscription_price" placeholder="subscription_price de subscription " value="{{subscription_price}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if subscription_price_error}}<div class="text-red-500 text-sm">{{subscription_price_error}}</div>{{endif subscription_price_error}}
            </section>{{endif ~isADMIN}}<section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith subscription}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Subscriptions_Subscription");
            });
        });
    </script>