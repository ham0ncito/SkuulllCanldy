<section class="p-6 ">
    <h2 class="text-white text-6xl text-center">{{name}}</h2>
    <div x-data="{ openTab: 1 }" class="p-8 flex items-center ">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 justify-around">
            {{foreach services}}
            <div x-on:click="openTab = {{id}}" :class="{ 'bg-gray-100 text-pink-500 transform hover:scale-105 transition duration-300': openTab === {{id}} }" class="cursor-pointer bg-white rounded-lg shadow-md border-l-4 border-blue-600 overflow-hidden">
                <div class="p-4">
                    <h2 class="text-3xl font-semibold mb-2 text-blue-600">{{name}}</h2>
                    <p class="text-gray-700">{{description}}</p>
                </div>
            </div>
            {{endfor services}}
        </div>
    </div>
</section>
