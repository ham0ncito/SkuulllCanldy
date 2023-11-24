 
<section class="bg-white bg-opacity-20 backdrop-filter backdrop-blur-lg rounded-md p-6 h-screen flex items-center justify-center">
    <h2 class="text-white text-6xl text-center">{{name}}</h2>
    <div x-data="{ openTab: 1 }" class="p-8">
        <div class="max-w-md mx-auto">
            <div class="mb-4 text-1xl flex flex-column flex-wrap space-around space-x-4 p-4 bg-white rounded-lg shadow-md overflow-hidden">
                {{foreach services}}
                <button x-on:click="openTab = {{id}}" :class="{ 'bg-blue-600 text-white': openTab === {{id}} }" class="flex-1 jello-horizontal text-black p-4 m-auto rounded-md focus:outline-none focus:shadow-outline-blue transition-all duration-300">{{name}}</button>
                {{endfor services}}
            </div>
{{foreach services}}
            <div x-show="openTab === {{id}}" class="transition-all duration-300 bg-white p-4 rounded-lg shadow-md border-l-4 border-blue-600">
                <h2 class="text-3xl font-semibold mb-2 text-blue-600">{{name}}</h2>
                <p class="text-gray-700">{{description}}</p>
            </div>
         {{endfor services}} 
        </div>
    </div>
</section>
<style>
    .jello-horizontal{-webkit-animation:jello-horizontal 2s both;animation:jello-horizontal 2s both}
</style>