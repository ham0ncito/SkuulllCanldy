{{if isADMIN}}
<section class="bg-gray-100 p-4 mx-4">
    <h1 class="text-2xl font-bold mb-4"> Descripcion subscriptionuser {{modedsc}}</h1>
    
{{with subscriptionuser}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Subscriptionusers_Subscriptionusers&mode={{~mode}}&usercod={{id}}" method="POST"><input type="hidden" name="xss_token_subscriptionuser" value="{{~xss_token_subscriptionuser}}"/><section class="mb-4">
                <label for="usercod" class="block text-gray-700 text-sm font-bold mb-2">usercod</label>
                <input type="text" id="usercod" name="usercod" placeholder="usercod de subscriptionuser " value="{{usercod}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if usercod_error}}<div class="text-red-500 text-sm">{{usercod_error}}</div>{{endif usercod_error}}
            </section><section class="mb-4">
                <label for="id_subscription" class="block text-gray-700 text-sm font-bold mb-2">id_subscription</label>
                <input type="text" id="id_subscription" name="id_subscription" placeholder="id_subscription de subscriptionuser " value="{{id_subscription}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_subscription_error}}<div class="text-red-500 text-sm">{{id_subscription_error}}</div>{{endif id_subscription_error}}
            </section><section class="mb-4">
                <label for="purchase_date_subscription" class="block text-gray-700 text-sm font-bold mb-2">purchase_date_subscription</label>
                <input type="text" id="purchase_date_subscription" name="purchase_date_subscription" placeholder="purchase_date_subscription de subscriptionuser " value="{{purchase_date_subscription}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if purchase_date_subscription_error}}<div class="text-red-500 text-sm">{{purchase_date_subscription_error}}</div>{{endif purchase_date_subscription_error}}
            </section><section class="mb-4">
                <label for="purchase_date_end" class="block text-gray-700 text-sm font-bold mb-2">purchase_date_end</label>
                <input type="text" id="purchase_date_end" name="purchase_date_end" placeholder="purchase_date_end de subscriptionuser " value="{{purchase_date_end}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if purchase_date_end_error}}<div class="text-red-500 text-sm">{{purchase_date_end_error}}</div>{{endif purchase_date_end_error}}
            </section><section class="mb-4">
                <label for="status_subscription" class="block text-gray-700 text-sm font-bold mb-2">status_subscription</label>
                <input type="text" id="status_subscription" name="status_subscription" placeholder="status_subscription de subscriptionuser " value="{{status_subscription}}" {{if ~readonly}}   readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if status_subscription_error}}<div class="text-red-500 text-sm">{{status_subscription_error}}</div>{{endif status_subscription_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith subscriptionuser}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Subscriptionusers_Subscriptionuser");
            });
        });
    </script>
    {{if isADMIN}}